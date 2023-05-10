import 'package:etrade_actions/common/widgets/product/cart/t_brand_title.dart';
import 'package:etrade_actions/utils/constants/enums.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TBrandTitleWithVerificationIcon extends StatelessWidget {
  const TBrandTitleWithVerificationIcon({super.key, required this.title,  this.maxLines = 1, this.textColor, this.iconColor, this.textAlign, this.brandTextSize = TextSizes.small});

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: TBrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(width: TSizes.xs),
        Icon(
          Icons.verified,
          color: iconColor,
          size: TSizes.iconXs,
        ),
      ],
    );
  }
}
