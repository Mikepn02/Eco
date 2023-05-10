import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etrade_actions/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:etrade_actions/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:etrade_actions/features/shop/controllers/product_controller.dart';
import 'package:etrade_actions/features/shop/screens/all_products/all_products.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TGriedViewLayout.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/THomeAppBar.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/THomeCategory.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TPrimaryHeader.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TPromoSlider.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TSearchStore.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TSectionHeading.dart';
import 'package:etrade_actions/utils/constants/image_strings.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  const THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TStoreSearch(
                    displayText: 'Search in store',
                    onTap: () {},
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.defaultSpace),
                  ),
                  // Categories
                  const THomeCategory(),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: TSizes.spaceBtwItems),
              child: Column(
                children: [
                  const TPromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3,
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSectionHeading(
                    title: 'Popular Products',
                    showActionsButton: true,
                    onButtonPressed: () => Get.to(() => AllProducts(title: 'Popular Producs', query: FirebaseFirestore.instance.collection('Products').where('IsFeatured', isEqualTo: true).limit(6), futureMethod: controller.fetchAllFeaturedProducts(),)),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const TVerticalProductShimmer();
                    }
                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                          child: Text('No Data Found!',
                              style: Theme.of(context).textTheme.bodyMedium));
                    }
                    return TGridViewLayout(
                        itemCount: controller.featuredProducts.length,
                        mainAxisExtent: 280,
                        itemBuilder: (_, index) {
                          return TProductCartVertical(product: controller.featuredProducts[index],);
                        });
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
