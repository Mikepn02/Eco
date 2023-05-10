import 'package:etrade_actions/common/chips/t_choice_chip.dart';
import 'package:etrade_actions/common/widgets/custom_shapes/circular_container.dart';
import 'package:etrade_actions/common/widgets/texts/product_title_text.dart';
import 'package:etrade_actions/features/shop/controllers/variation_controller.dart';
import 'package:etrade_actions/features/shop/models/product_model.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TSectionHeading.dart';
import 'package:etrade_actions/features/shop/screens/product_details/widgets/product_price_text.dart';
import 'package:etrade_actions/utils/constants/colors.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:etrade_actions/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.productModel});

  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Obx(
      () => Column(
        children: [
          const SizedBox(
            height: TSizes.md,
          ),
          if (controller.selectedVariation.value.id.isNotEmpty)
            TRoundedContainer(
              padding: const EdgeInsets.all(TSizes.md),
              radius: TSizes.md,
              backgroundColor: dark ? TColors.darkerGrey : TColors.lightGrey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const TSectionHeading(
                          title: 'Variation', showActionsButton: false),
                      const SizedBox(width: TSizes.spaceBtwSections),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            children: [
                              const TProductTitleText(
                                  title: 'Price: ', smallSize: true),
                              if (controller.selectedVariation.value.salePrice >
                                  0)
                                Text(
                                  '\$${controller.selectedVariation.value.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                ),
                              const SizedBox(width: TSizes.spaceBtwItems),
                              TProductPriceText(price: controller.getVariationPrice())
                            ],
                          ),
                          Row(
                            children: [
                              const TProductTitleText(
                                title: 'Stock',
                                smallSize: true,
                              ),
                              const SizedBox(width: TSizes.spaceBtwItems),
                              Text(
                                controller.variationStockStatus.value,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .apply(color: controller.variationStockStatus.value == 'In Stock' ? TColors.primary : Colors.red),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtwItems,
                          )
                        ],
                      ),
                    ],
                  ),
                  // Stock
                  TProductTitleText(
                    title:
                        controller.selectedVariation.value.description ?? '',
                    smallSize: true,
                    maxLines: 4,
                  )
                ],
              ),
            ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: productModel.productAttributes!
                  .map((attribute) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TSectionHeading(
                              title: attribute.name ?? '',
                              showActionsButton: false),
                          const SizedBox(height: TSizes.spaceBtwItems / 2),
                          Obx(
                            () => Wrap(
                              spacing: 8,
                              children: attribute.values!.map((attributeValue) {
                                final isSelected = controller
                                        .selectedAttributes[attribute.name] ==
                                    attributeValue;
                                final available = controller
                                    .getAttributesAvailabilityInVariation(
                                        productModel.productVariations!,
                                        attribute.name!)
                                    .contains(attributeValue);
    
                                return TChoiceChip(
                                  text: attributeValue,
                                  selected: isSelected,
                                  onSelected: available
                                      ? (selected) {
                                          if (selected && available) {
                                            controller.onAttributeSelected(
                                                productModel,
                                                attribute.name ?? '',
                                                attributeValue);
                                          }
                                        }
                                      : null,
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      ))
                  .toList()),
        ],
      ),
    );
  }
}
