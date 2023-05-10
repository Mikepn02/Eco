import 'package:etrade_actions/features/shop/screens/home/widgets/TListViewCategoryOption.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TSectionHeading.dart';
import 'package:etrade_actions/utils/constants/colors.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class THomeCategory extends StatelessWidget {
  const THomeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
          left: TSizes.defaultSpace,
          right: TSizes.defaultSpace,
          top: TSizes.spaceBtwItems),
      child: Column(
        children: [
          TSectionHeading(
              title: 'Popular Categories', showActionsButton: false, textColor: TColors.white,),
          SizedBox(height: TSizes.spaceBtwItems),
          // Categories
          TListViewCategoryOption(),
          SizedBox(height: TSizes.spaceBtwSections * 1.4),
        ],
      ),
    );
  }
}
