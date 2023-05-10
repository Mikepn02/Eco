import 'package:etrade_actions/features/authentication/controllers/signup/signup_controller.dart';
import 'package:etrade_actions/features/authentication/screens/signup/widgets/terms_policy.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:etrade_actions/utils/constants/text_strings.dart';
import 'package:etrade_actions/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                    validator: (value) => TValidator.validateEmptyText('First name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: TTexts.firstName),
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwItems),
                Expanded(
                  child: TextFormField(
                    controller: controller.lastName,
                    validator: (value) => TValidator.validateEmptyText('Last name', value),
                    expands: false,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: TTexts.lastName,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),
            TextFormField(
              controller: controller.username,
              validator: (value) => TValidator.validateEmptyText('Username', value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.user_edit),
                  labelText: TTexts.username),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct), labelText: TTexts.email),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),
            TextFormField(
              autofocus: true,
              controller: controller.phoneNumber,
              validator: (value) => TValidator.validatePhoneNumber(value),
              keyboardType: TextInputType.phone ,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.call), labelText: TTexts.phoneNo, ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),
            Obx(
              () => TextFormField(
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                validator: (value) => TValidator.validatePassword(value),
                decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                    ),
                    labelText: TTexts.password),
                    
              ),
            ),
            // Terms of Agreement
            const TTermsPolicy(),
            // Create Account
            const SizedBox(height: TSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.signup(), child: const Text(TTexts.createAccount)),
            )
          ],
        ),
      ),
    );
  }
}
