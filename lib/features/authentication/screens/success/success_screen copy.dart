import 'package:etrade_actions/common/styles/spacing_styles.dart';
import 'package:etrade_actions/features/shop/screens/home/home_screen.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:etrade_actions/utils/constants/text_strings.dart';
import 'package:etrade_actions/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SucessScreen extends StatelessWidget {
  const SucessScreen(
      { super.key,
      required this.image,
      required this.title,
      this.onPressed,
      required this.subTitle});

  final String image, title, subTitle;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: TSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              children: [
                Image(
                  image: AssetImage(image),
                  width: THelperFunctions.screenWidth() * 0.5,
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                Text(title,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: TSizes.spaceBtwItems),
                Text(subTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: TSizes.spaceBtwSections),
                // Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.off(const HomeScreen()),
                    child: const Text(TTexts.tContinue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
