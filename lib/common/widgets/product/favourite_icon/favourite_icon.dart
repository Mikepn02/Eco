import 'package:etrade_actions/common/widgets/icon/circular_icon.dart';
import 'package:etrade_actions/features/shop/controllers/favourite_controller.dart';
import 'package:etrade_actions/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TFavouriteIcon extends StatelessWidget {
  const TFavouriteIcon({super.key, required this.productId});

  final String productId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    return Obx(() {
      return TCicularIcon(
          icon: controller.isFavourite(productId)
              ? Iconsax.heart5
              : Iconsax.heart,
          onPressed: () => controller.toggleFavouriteProduct(productId),
          color: controller.isFavourite(productId) ? TColors.error : null);
    });
  }
}
