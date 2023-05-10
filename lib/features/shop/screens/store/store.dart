import 'package:etrade_actions/common/widgets/brands/TBrands.dart';
import 'package:etrade_actions/common/widgets/shimmer/brand_shimmer.dart';
import 'package:etrade_actions/common/widgets/tabs/TBottomTabBar.dart';
import 'package:etrade_actions/common/widgets/appbar/appbar.dart';
import 'package:etrade_actions/common/widgets/product/cart/cart_counter_menu.dart';
import 'package:etrade_actions/common/widgets/tabs/TCategoryTab.dart';
import 'package:etrade_actions/features/shop/controllers/brand_controller.dart';
import 'package:etrade_actions/features/shop/controllers/category_controller.dart';
import 'package:etrade_actions/features/shop/screens/all_brands/all_brands.dart';
import 'package:etrade_actions/features/shop/screens/all_brands/brand_products.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TGriedViewLayout.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TSearchStore.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TSectionHeading.dart';
import 'package:etrade_actions/utils/constants/colors.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:etrade_actions/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;
    
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            TCartCounterIcon(
              onPressed: () {},
              iconColor: TColors.black,
            ),
          ],
          showBackArrow: false,
        ),
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    pinned: true,
                    floating: true,
                    automaticallyImplyLeading: false,
                    backgroundColor: THelperFunctions.isDarkMode(context)
                        ? TColors.black
                        : TColors.white,
                    expandedHeight: 440,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          TStoreSearch(
                            displayText: 'Search in store',
                            onTap: () {},
                            showBackground: false,
                            padding: EdgeInsets.zero,
                          ),
                          const SizedBox(height: TSizes.spaceBtwSections),
                          // Featured Brandings
                          TSectionHeading(
                              title: 'Featured Brandings',
                              showActionsButton: true,
                              onButtonPressed: () =>
                                  Get.to(() => const AllBrands())),
                          const SizedBox(height: TSizes.spaceBtwItems / 1.5),
                          // Brandings
                          Obx(() {
                            if (brandController.isLoading.value) return const TBrandsShimmer();

                            if (brandController.featuredBrands.isEmpty) {
                              return Center(
                                child: Text('No Data found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),
                              );
                            }

                            return TGridViewLayout(
                              itemCount: brandController.featuredBrands.length,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                final brand = brandController.featuredBrands[index];
                                return TBrandCard(showBorder: true,brand: brand, onTap: () => Get.to(() => BrandProducts(brandModel: brand)),);
                              },
                            );
                          }),
                        ],
                      ),
                    ),
                    bottom: TBottomBar(
                      tabs: categories
                          .map((element) => Tab(child: Text(element.name)))
                          .toList(),
                    ))
              ];
            },
            body: TabBarView(
              children: categories
                  .map((element) => TCategoryTab(categoryModel: element))
                  .toList(),
            )),
      ),
    );
  }
}
