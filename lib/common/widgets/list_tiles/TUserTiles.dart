import 'package:etrade_actions/common/widgets/shimmer/t_shimmer.dart';
import 'package:etrade_actions/features/personalization/controllers/user_controller.dart';
import 'package:etrade_actions/features/personalization/screens/profile/profile.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TCircularContainerImage.dart';
import 'package:etrade_actions/utils/constants/colors.dart';
import 'package:etrade_actions/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TUserTiles extends StatelessWidget {
  const TUserTiles({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(
        () {
          final networkImage = controller.user.value.profilePicture;
          final image = networkImage.isNotEmpty ? networkImage : TImages.user;
          return controller.imageUploading.value
              ? const TShimmerEffect(
                  width: 50,
                  height: 50,
                  radius: 80,
                )
              : TRoundedImage(
                  image: image,
                  isNetworkImage: networkImage.isNotEmpty ? true : false,
                  radius: 80,
                  applyImageRadius: true,
                );
        },
      ),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: TColors.white),
      ),
      subtitle: Text(controller.user.value.email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: TColors.white)),
      trailing: IconButton(
        onPressed: () => Get.to(const ProfileScreen()),
        icon: const Icon(
          Iconsax.edit,
          color: TColors.white,
        ),
      ),
    );
  }
}
