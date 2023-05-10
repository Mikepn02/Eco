import 'package:etrade_actions/common/widgets/product/cart/t_brand_title_text_with_vertical_icon.dart';
import 'package:etrade_actions/common/widgets/texts/product_title_text.dart';
import 'package:etrade_actions/features/shop/models/cart_item_model.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TCircularContainerImage.dart';
import 'package:etrade_actions/utils/constants/colors.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:etrade_actions/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({super.key, required this.cartItemModel});

  final CartItemModel cartItemModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TRoundedImage(
          image: cartItemModel.image ?? '',
          isNetworkImage: true,
          width: 60,
          height: 60,
          padding: TSizes.md,
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBrandTitleWithVerificationIcon(
                  title: cartItemModel.brandName ?? ''),
              Flexible(
                  child: TProductTitleText(
                      title: cartItemModel.title ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1)),

              // Attributes
              Text.rich(
                TextSpan(
                  children: (cartItemModel.selectedVariation ?? {})
                      .entries
                      .map((e) => TextSpan(children: [
                            TextSpan(
                                text: e.key,
                                style: Theme.of(context).textTheme.bodySmall),
                            TextSpan(
                                text: e.value,
                                style: Theme.of(context).textTheme.bodyLarge)
                          ]))
                      .toList(),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
