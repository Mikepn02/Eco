import 'package:etrade_actions/common/widgets/appbar/appbar.dart';
import 'package:etrade_actions/common/widgets/product/product_cards/product_card_horizontal.dart';
import 'package:etrade_actions/common/widgets/shimmer/horizontal_product_shimmer.dart';
import 'package:etrade_actions/features/shop/controllers/category_controller.dart';
import 'package:etrade_actions/features/shop/models/category_model.dart';
import 'package:etrade_actions/features/shop/screens/all_products/all_products.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TCircularContainerImage.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TSectionHeading.dart';
import 'package:etrade_actions/utils/constants/image_strings.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:etrade_actions/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: TAppBar(title: Text(category.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TRoundedImage(
                width: double.infinity,
                fit: BoxFit.cover,
                height: 200,
                image: TImages.banner5,
                isNetworkImage: false,
                applyImageRadius: true,
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    const loader = THorizontalProductShimmer();
                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) {
                      return widget;
                    }

                    final subCategories = snapshot.data!;                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: subCategories.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: ((context, index) {
                        final subCategory = subCategories[index];
                        return FutureBuilder(
                            future: controller.getCategoryProducts(
                                categoryId: subCategory.id),
                            builder: (context, snapshot) {
                              final widget =
                                  TCloudHelperFunctions.checkMultiRecordState(
                                      snapshot: snapshot, loader: loader);
                              if (widget != null) {
                                return widget;
                              }
                              final product = snapshot.data!;
                              return Column(
                                children: [
                                  TSectionHeading(
                                      title: subCategory.name,
                                      onButtonPressed: () =>
                                          Get.to(() => AllProducts(
                                                title: subCategory.name,
                                                futureMethod: controller
                                                    .getCategoryProducts(
                                                        categoryId:
                                                            subCategory.id),
                                              ))),
                                  const SizedBox(
                                      height: TSizes.spaceBtwItems / 2),
                                  SizedBox(
                                    height: 120,
                                    child: ListView.separated(
                                      itemCount: product.length,
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                              width: TSizes.spaceBtwItems),
                                      itemBuilder: (_, index) =>
                                          TProductCardHorizontal(
                                              product: product[index]),
                                    ),
                                  ),
                                  const SizedBox(
                                      height: TSizes.spaceBtwSections)
                                ],
                              );
                            });
                      }),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
