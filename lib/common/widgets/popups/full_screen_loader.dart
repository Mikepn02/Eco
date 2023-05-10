import 'package:etrade_actions/common/widgets/loaders/animation_loader.dart';
import 'package:etrade_actions/utils/constants/colors.dart';
import 'package:etrade_actions/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false, // The dialog cannot be dismissed by tapping outside
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!) ? TColors.dark : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              TAnimationLoaderWidget(text: text, animation: animation)
            ],
          ),
        )
      )
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}