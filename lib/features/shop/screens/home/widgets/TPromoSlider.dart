import 'package:carousel_slider/carousel_slider.dart';
import 'package:etrade_actions/common/widgets/custom_shapes/circular_container.dart';
import 'package:etrade_actions/common/widgets/shimmer/t_shimmer.dart';
import 'package:etrade_actions/features/shop/controllers/banner_controller.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TCircularContainerImage.dart';
import 'package:etrade_actions/utils/constants/colors.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({super.key, required this.banners});

  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      if (controller.isLoading.value) {
        return const TShimmerEffect(width: double.infinity, height: 190);
      }
      if (controller.banners.isEmpty) {
        return const Center(child: Text('No data found!'));
      } else {
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 1.8,
                enlargeCenterPage: true,
                viewportFraction: 1,
                onPageChanged: (index, _) =>
                    controller.updatePageIndicator(index),
              ),
              items: controller.banners
                  .map((banner) => TRoundedImage(
                        image: banner.imageUrl,
                        isNetworkImage: true,
                        onTap: () => Get.toNamed(banner.targetScreen),
                        radius: TSizes.defaultSpace,
                        height: 400,
                        width: 600,
                      ))
                  .toList(),
            ),
            const SizedBox(height: TSizes.spaceBtwItems - 10),
            Center(
              child: Obx(
                () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < controller.banners.length; i++)
                      TRoundedContainer(
                        width: 20,
                        height: 4,
                        margin: const EdgeInsets.only(right: 10),
                        backgroundColor:
                            controller.carouselCurrentIndex.value == i
                                ? TColors.primary
                                : TColors.grey,
                      ),
                  ],
                ),
              ),
            )
          ],
        );
      }
    });
  }
}
