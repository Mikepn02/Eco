import 'package:etrade_actions/common/widgets/appbar/appbar.dart';
import 'package:etrade_actions/common/widgets/shimmer/t_shimmer.dart';
import 'package:etrade_actions/features/personalization/controllers/user_controller.dart';
import 'package:etrade_actions/features/personalization/screens/profile/change_name.dart';
import 'package:etrade_actions/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TCircularContainerImage.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TSectionHeading.dart';
import 'package:etrade_actions/utils/constants/colors.dart';
import 'package:etrade_actions/utils/constants/image_strings.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:etrade_actions/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Profile',
            style: Theme.of(context).textTheme.headlineMedium!.apply(
                color: THelperFunctions.isDarkMode(context)
                    ? TColors.white
                    : TColors.black)),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Obx(
                  () {
                    final networkImage = controller.user.value.profilePicture;
                    final image = networkImage.isNotEmpty ?  networkImage : TImages.user;
                    return controller.imageUploading.value ? const TShimmerEffect(width: 80, height: 80, radius: 80) :
                     TRoundedImage(
                        image: image, height: 120, width: 120, isNetworkImage: networkImage.isNotEmpty ? true : false,radius: 80,applyImageRadius: true,);
                  },
                ),
                TextButton(
                  onPressed: () => controller.uploadUserProfilePicture(),
                  child: const Text('Change profile Picture'),
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),
                const TSectionHeading(
                    title: 'Profile Information', showActionsButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),
                TProfileMenu(
                    onPressed: () => Get.to(() => const ChangeName()),
                    title: 'Name',
                    value: controller.user.value.fullName),
                TProfileMenu(
                    onPressed: () {},
                    title: 'Username',
                    value: controller.user.value.username),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),
                const TSectionHeading(
                    title: 'Personal Information', showActionsButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),
                TProfileMenu(
                  onPressed: () {},
                  title: 'User ID',
                  value: controller.user.value.id,
                  icon: Iconsax.copy,
                ),
                TProfileMenu(
                    onPressed: () {},
                    title: 'E-mail',
                    value: controller.user.value.email),
                TProfileMenu(
                    onPressed: () {},
                    title: 'Phone Number',
                    value: controller.user.value.phoneNumber),
                TProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
                TProfileMenu(
                    onPressed: () {},
                    title: 'Date of Birth',
                    value: '10 Oct, 2005'),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),
                Center(
                  child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    child: const Text(
                      'Close Account',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      )),
    );
  }
}
