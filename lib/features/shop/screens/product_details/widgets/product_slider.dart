import 'package:cached_network_image/cached_network_image.dart';
import 'package:etrade_actions/common/widgets/appbar/appbar.dart';
import 'package:etrade_actions/common/widgets/custom_shapes/curved_edge_widget.dart';
import 'package:etrade_actions/common/widgets/product/favourite_icon/favourite_icon.dart';
import 'package:etrade_actions/features/shop/controllers/image_controller.dart';
import 'package:etrade_actions/features/shop/models/product_model.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TCircularContainerImage.dart';
import 'package:etrade_actions/utils/constants/colors.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:etrade_actions/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({super.key, required this.productModel});

  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImageController());
    final images = controller.getAllProductImages(productModel);
    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkGrey : TColors.light,
        child: Stack(
          children: [
            // Main large image
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius),
                child: Obx(() {
                  final image = controller.selectedProductImage.value;
                  return GestureDetector(
                    onTap: () => controller.showEnlargedImage(image),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      progressIndicatorBuilder: (_, __, downloadProgress) =>
                          CircularProgressIndicator(
                              value: downloadProgress.progress,
                              color: TColors.primary),
                    ),
                  );
                }),
              ),
            ),

            // Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemBuilder: (_, index) => Obx(() {
                    final imageSelected = controller.selectedProductImage.value == images[index];
                    return TRoundedImage(
                      width: 80,
                      image: images[index],
                      backgroundColor: dark ? TColors.dark : TColors.white,
                      padding: TSizes.sm,
                      isNetworkImage: true,
                      onTap: () => controller.selectedProductImage.value = images[index],
                      border: Border.all(
                        color: imageSelected ? TColors.primary : Colors.transparent,
                        width: 2,
                      ),
                      radius: TSizes.sm,
                    );
                  }),
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: TSizes.defaultSpace / 1.4),
                  itemCount: productModel.images!.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                ),
              ),
            ),

            TAppBar(
              showBackArrow: true,
              actions: [
                TFavouriteIcon(productId: productModel.id,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
