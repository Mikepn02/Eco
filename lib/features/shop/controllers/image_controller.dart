import 'package:cached_network_image/cached_network_image.dart';
import 'package:etrade_actions/features/shop/models/product_model.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

  RxString selectedProductImage = ''.obs;

  List<String> getAllProductImages(ProductModel productModel) {
    Set<String> images = {};

    images.add(productModel.thumbnail);

    selectedProductImage.value = productModel.thumbnail;

    if (productModel.images != null) {
      images.addAll(productModel.images!);
    }

    if (productModel.productVariations != null || productModel.productVariations!.isNotEmpty) {
      images.addAll(productModel.productVariations!.map((variation) => variation.image ));
    }

    return images.toList();
  }

  void showEnlargedImage (String image ) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: TSizes.defaultSpace * 2, horizontal: TSizes.defaultSpace),
              child: CachedNetworkImage(imageUrl: image),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(onPressed: () => Get.back(), child: const Text('Close'),),
              ),
            )
          ],
        ),
      )
    );
  }
}