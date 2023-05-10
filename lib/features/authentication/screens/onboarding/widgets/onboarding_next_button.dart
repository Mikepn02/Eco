import 'package:etrade_actions/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:etrade_actions/utils/constants/colors.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:etrade_actions/utils/device/device_utility.dart';
import 'package:etrade_actions/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
        right: TSizes.defaultSpace,
        bottom: TDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(), backgroundColor: dark ? TColors.primary : Colors.black),
            onPressed: () => OnBoardingController.instance.nextPage(),
            child: const Icon(Iconsax.arrow_right_3)));
  }
}
