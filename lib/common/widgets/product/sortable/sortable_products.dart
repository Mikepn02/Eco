import 'package:etrade_actions/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:etrade_actions/features/shop/controllers/all_products_controller.dart';
import 'package:etrade_actions/features/shop/models/product_model.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TGriedViewLayout.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({super.key, required this.products});

  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    controller.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ]
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ))
              .toList(),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            controller.sortProducts(value!);
          },
          hint: const Text('Select category'),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        Obx(
          () => TGridViewLayout(
              itemCount: controller.products.length,
              itemBuilder: (_, index) {
                return TProductCartVertical(
                    product: controller.products[index]);
              }),
        )
      ],
    );
  }
}
