import 'package:etrade_actions/common/widgets/loaders/loaders.dart';
import 'package:etrade_actions/common/widgets/popups/full_screen_loader.dart';
import 'package:etrade_actions/data/repositories/auth/authentication_repository.dart';
import 'package:etrade_actions/data/repositories/user/user_repository.dart';
import 'package:etrade_actions/features/authentication/screens/verify-email/verify-email.dart';
import 'package:etrade_actions/features/personalization/models/user_model.dart';
import 'package:etrade_actions/utils/constants/image_strings.dart';
import 'package:etrade_actions/utils/helpers/network_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog('We are processing your information ...', TImages.verifyIllustration);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        Get.snackbar('No internet connection', 'Please check your internet connection and try again.');
        return;
      }

      if (signupFormKey.currentState!.validate()) return;

      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(title: 'Accept Privacy Policy!', message: 'You must agree to the terms and conditions to continue.');
        return;
      }

      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text, password.text);
      
      // save authenticated user details
      final newUser = UserModel(
        id: userCredential.user!.uid,
        email: email.text.trim(),
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        phoneNumber: phoneNumber.text.trim()
      );
      
      final userRepository = Get.put(UserRepository());
      
      await userRepository.saveUserRecord(newUser);
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created successfully! Verify Email');
      Get.to(() => VerifyEmailScreen(email: email.text.trim(),));

    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      TFullScreenLoader.stopLoading();
      
    }
  }
}