import 'package:etrade_actions/common/styles/spacing_styles.dart';
import 'package:etrade_actions/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:etrade_actions/utils/constants/text_strings.dart';
import 'package:etrade_actions/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              Text(TTexts.forgetPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(TTexts.forgetPasswordSubTitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwSections * 2),
              Form(
                key: controller.forgetPasswordFormKey,
                child: TextFormField(
                  validator: (value) => TValidator.validateEmail(value),
                  controller: controller.email,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: TTexts.email),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.sendPasswordResetEmail(),
                  child: const Text(TTexts.submit),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
