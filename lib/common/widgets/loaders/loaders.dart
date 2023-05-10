import 'package:etrade_actions/utils/constants/colors.dart';
import 'package:etrade_actions/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TLoaders {
  static hideSnackBar() =>
      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            color: THelperFunctions.isDarkMode(Get.context!)
                ? TColors.dark
                : TColors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(message,
                style: Theme.of(Get.context!).textTheme.labelLarge),
          ),
        ),
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.transparent,
        action: SnackBarAction(
          label: 'Close',
          textColor: TColors.white,
          onPressed: () {
            hideSnackBar();
          },
        ),
      ),
    );
  }

  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: TColors.white,
      backgroundColor: Colors.red.shade800,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2, color: TColors.white),
    );
  }

  static warningSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: TColors.white,
      backgroundColor: Colors.orange.shade800,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2, color: TColors.white),
    );
  }

  static successSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: TColors.white,
      backgroundColor: Colors.green.shade800,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.check, color: TColors.white),
    );
  }
}
