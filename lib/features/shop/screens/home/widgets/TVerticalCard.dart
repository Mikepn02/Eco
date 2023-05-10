import 'package:etrade_actions/features/shop/screens/home/widgets/TCircularContainerImage.dart';
import 'package:etrade_actions/utils/constants/colors.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:etrade_actions/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TVerticalCard extends StatelessWidget {
  const TVerticalCard(
      {super.key,
      required this.image,
      required this.title,
      this.backgroundColor,
      this.isNetworkImage = true,
      this.onTap});

  final String image, title;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Circular Icon
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                  color:
                      backgroundColor ?? (dark ? TColors.black : TColors.white),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: TRoundedImage(
                  image: image,
                  fit: BoxFit.fitWidth,
                  isNetworkImage: true,
                  backgroundColor: backgroundColor,
                  overlayColor: THelperFunctions.isDarkMode(context)
                      ? TColors.light
                      : TColors.dark,
                ),
              ),
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .apply(color: TColors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
