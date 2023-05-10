import 'dart:async';

import 'package:etrade_actions/common/widgets/loaders/loaders.dart';
import 'package:etrade_actions/data/repositories/auth/authentication_repository.dart';
import 'package:etrade_actions/features/authentication/screens/success/success_screen%20copy.dart';
import 'package:etrade_actions/utils/constants/image_strings.dart';
import 'package:etrade_actions/utils/constants/text_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Please check your email to verify your account');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  // Timer to automatically redirect on Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;

      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SucessScreen(
            image: TImages.successfulPaymentIcon,
            title: TTexts.yourAccountCreatedTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
            subTitle: TTexts.yourAccountCreatedSubTitle));
      }
    });
  }
  // Manually check if email is verified

  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SucessScreen(
          image: TImages.successfulPaymentIcon,
          title: TTexts.yourAccountCreatedTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          subTitle: TTexts.yourAccountCreatedSubTitle));
    }
  }
}
