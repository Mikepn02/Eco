import 'package:etrade_actions/common/widgets/custom_shapes/circular_container.dart';
import 'package:etrade_actions/common/widgets/product/cart/t_brand_title_text_with_vertical_icon.dart';
import 'package:etrade_actions/common/widgets/product/favourite_icon/favourite_icon.dart';
import 'package:etrade_actions/common/widgets/texts/product_title_text.dart';
import 'package:etrade_actions/features/shop/controllers/product_controller.dart';
import 'package:etrade_actions/features/shop/models/product_model.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TCircularContainerImage.dart';
import 'package:etrade_actions/features/shop/screens/product_details/widgets/product_price_text.dart';
import 'package:etrade_actions/utils/constants/colors.dart';
import 'package:etrade_actions/utils/constants/enums.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:etrade_actions/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.darkerGrey : TColors.lightContainer,
      ),
      child: Row(
        children: [
          TRoundedContainer(
            radius: TSizes.md,
            height: 80,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                TRoundedImage(
                  height: 120,
                  width: 120,
                  image: product.thumbnail,
                  applyImageRadius: true,
                  isNetworkImage: true,
                  fit: BoxFit.contain,
                ),
                if (product.productType == ProductType.single.toString() &&
                    product.salePrice > 0)
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text(
                        '$salePercentage%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),
                // Fav Icon
                Positioned(
                    top: 0,
                    right: 0,
                    child: TFavouriteIcon(
                      productId: product.id,
                    ))
              ],
            ),
          ),
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(title: product.title, smallSize: true),
                      const SizedBox(height: TSizes.spaceBtwItems / 2),
                      TBrandTitleWithVerificationIcon(
                          title: product.brand!.name)
                    ],
                  ),
                  const Spacer(),
                  // Price Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                            if (product.productType ==
                                    ProductType.single.toString() &&
                                product.salePrice > 0)
                              Padding(
                                padding: const EdgeInsets.only(left: TSizes.sm),
                                child: Text(
                                  product.price.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .apply(
                                          decoration:
                                              TextDecoration.lineThrough),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.only(left: TSizes.sm),
                              child: TProductPriceText(
                                  price: controller.getProductPrice(product)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(TSizes.cardRadiusMd),
                              bottomRight:
                                  Radius.circular(TSizes.productImageRadius)),
                        ),
                        child: const SizedBox(
                          width: TSizes.iconLg * 1.2,
                          height: TSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add,
                              color: TColors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
