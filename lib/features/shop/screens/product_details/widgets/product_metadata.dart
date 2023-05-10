import 'package:etrade_actions/common/widgets/custom_shapes/circular_container.dart';
import 'package:etrade_actions/common/widgets/product/cart/t_brand_title_text_with_vertical_icon.dart';
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

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.productModel});

  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(
        productModel.price, productModel.salePrice);
    final darkMode = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                '$salePercentage %',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.black),
              ),
            ),
            if (productModel.productType == ProductType.single.toString() &&
                productModel.salePrice > 0)
              Text(
                '\$ ${productModel.salePrice.toString()}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough),
              ),
            const SizedBox(width: TSizes.spaceBtwItems),
            TProductPriceText(
                price: controller.getProductPrice(productModel), isLarge: true),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        TProductTitleText(title: productModel.title),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            const TProductTitleText(title: 'Status'),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(controller.getProductStockStatus(productModel.stock),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .apply(color: controller.getProductStockStatus(productModel.stock) == 'In Stock' ? TColors.primary : Colors.red))
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TRoundedImage(
              image: productModel.brand != null ? productModel.brand!.image : '',
              width: 24,
              height: 24,
              radius: 0,
              padding: 0,
              isNetworkImage: false,
              fit: BoxFit.fitWidth,
              overlayColor: darkMode ? TColors.white : TColors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(left: TSizes.md),
              child: TBrandTitleWithVerificationIcon(
                  title: productModel.brand != null ? productModel.brand!.name : '',
                  brandTextSize: TextSizes.medium,
                  iconColor: TColors.primary),
            )
          ],
        )
      ],
    );
  }
}
