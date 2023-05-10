import 'package:etrade_actions/common/widgets/appbar/appbar.dart';
import 'package:etrade_actions/common/widgets/brands/TBrands.dart';
import 'package:etrade_actions/common/widgets/shimmer/brand_shimmer.dart';
import 'package:etrade_actions/features/shop/controllers/brand_controller.dart';
import 'package:etrade_actions/features/shop/screens/all_brands/brand_products.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TGriedViewLayout.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TSectionHeading.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
        appBar: const TAppBar(
          title: Text('Brands'),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                const TSectionHeading(
                  title: 'Brands',
                  showActionsButton: false,
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                Obx(() {
                  if (brandController.isLoading.value) return const TBrandsShimmer();

                  if (brandController.featuredBrands.isEmpty) {
                    return Center(
                      child: Text(
                        'No Data found!',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: Colors.white),
                      ),
                    );
                  }

                  return TGridViewLayout(
                    itemCount: brandController.allBrands.length,
                    mainAxisExtent: 80,
                    itemBuilder: (_, index) {
                      final brand = brandController.allBrands[index];
                      return TBrandCard(showBorder: true, brand: brand, onTap: () => Get.to(() => BrandProducts(brandModel: brand,)),);
                    },
                  );
                }),
              ],
            ),
          ),
        ));
  }
}
