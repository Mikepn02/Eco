import 'package:etrade_actions/utils/constants/image_strings.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:etrade_actions/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TFormHeader extends StatelessWidget {
  const TFormHeader({super.key, required this.title, required this.subTitle});

  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            height: 150,
            image:
                AssetImage(dark ? TImages.lightAppLogo : TImages.darkAppLogo)),
        Text(title,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: TSizes.sm),
        Text(subTitle,
            style: Theme.of(context).textTheme.bodyMedium)
      ],
    );
  }
}
