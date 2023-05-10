import 'package:etrade_actions/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:etrade_actions/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:etrade_actions/common/widgets/tabs/category_brands.dart';
import 'package:etrade_actions/features/shop/controllers/category_controller.dart';
import 'package:etrade_actions/features/shop/models/category_model.dart';
import 'package:etrade_actions/features/shop/screens/all_products/all_products.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TGriedViewLayout.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TSectionHeading.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:etrade_actions/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.categoryModel});

  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                // Brand Related Info
                CategoryBrands(category: categoryModel),
                const SizedBox(height: TSizes.spaceBtwItems),

                FutureBuilder(
                  future: controller.getCategoryProducts(categoryId: categoryModel.id),
                  builder: (context, snapshot) {
                    final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: const TVerticalProductShimmer());
                    if (response != null) return response ;

                    final products = snapshot.data!;

                    return Column(
                      children: [
                        TSectionHeading(
                            title: 'You might like', onButtonPressed: () => Get.to(AllProducts(title: categoryModel.name, futureMethod: controller.getCategoryProducts(categoryId: categoryModel.id, limit: -1),))),
                        const SizedBox(height: TSizes.spaceBtwSections),
                        TGridViewLayout(
                          itemCount: products.length,
                          mainAxisExtent: 280,
                          itemBuilder: (_, index) => TProductCartVertical(
                            product: products[index]
                          ),
                        ),
                      ],
                    );
                  }
                ),
              ],
            ),
          )
        ]);
  }
}
