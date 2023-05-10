import 'package:etrade_actions/common/widgets/loaders/loaders.dart';
import 'package:etrade_actions/common/widgets/popups/full_screen_loader.dart';
import 'package:etrade_actions/data/repositories/auth/authentication_repository.dart';
import 'package:etrade_actions/features/personalization/controllers/user_controller.dart';
import 'package:etrade_actions/utils/constants/image_strings.dart';
import 'package:etrade_actions/utils/helpers/network_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    final rememberedEmail = localStorage.read('REMEMBER_ME_EMAIL') as String?;
    final rememberedPassword =
        localStorage.read('REMEMBER_ME_PASSWORD') as String?;

    if (rememberedEmail != null) {
      email.text = rememberedEmail;
    }

    if (rememberedPassword != null) {
      password.text = rememberedPassword;
    }

    super.onInit();
  }

  // Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Logging you in ....', TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      TFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  // Google SignIn
  Future<void> googleSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Logging you in ....', TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      await userController.saveUserRecord(userCredentials);

      TFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  // logout 
  Future<void> logout() async {
    try {
      await AuthenticationRepository.instance.logout();
      
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
