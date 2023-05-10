import 'package:etrade_actions/common/styles/spacing_styles.dart';
import 'package:etrade_actions/features/authentication/screens/signup/shared/divider.dart';
import 'package:etrade_actions/features/authentication/screens/signup/shared/social_icon.dart';
import 'package:etrade_actions/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:etrade_actions/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Form
              SignupForm(),
              // Divider
              DividerClass(dividerText: TTexts.orSignInWith),
              SizedBox(height: TSizes.spaceBtwItems),
              // Social Icons
              TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
