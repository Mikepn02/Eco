import 'package:cached_network_image/cached_network_image.dart';
import 'package:etrade_actions/common/widgets/brands/TBrands.dart';
import 'package:etrade_actions/common/widgets/custom_shapes/circular_container.dart';
import 'package:etrade_actions/common/widgets/shimmer/t_shimmer.dart';
import 'package:etrade_actions/features/shop/models/brand_model.dart';
import 'package:etrade_actions/features/shop/screens/all_brands/brand_products.dart';
import 'package:etrade_actions/utils/constants/colors.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:etrade_actions/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TBrandCardShowcase extends StatelessWidget {
  const TBrandCardShowcase({super.key, required this.images, required this.brandModel});

  final List<String> images;
  final BrandModel brandModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brandModel: brandModel)),
      child: TRoundedContainer(
        radius: TSizes.md,
        padding: const EdgeInsets.all(TSizes.sm),
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        backgroundColor: Colors.transparent,
        child: Column(
          children: [
            TBrandCard(showBorder: true, brand: brandModel,),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: TSizes.sm, horizontal: TSizes.md),
              child: Row(
                children: images.map((image) => brandTopProductImageWidget(image, context)).toList()
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
    child: TRoundedContainer(
      height: 100,
      radius: TSizes.sm,
      backgroundColor: THelperFunctions.isDarkMode(context)
          ? TColors.darkGrey
          : TColors.light,
      margin: const EdgeInsets.only(right: TSizes.defaultSpace),
      padding: const EdgeInsets.all(TSizes.md),
      child: CachedNetworkImage(
        fit: BoxFit.contain,
        imageUrl: image,
        progressIndicatorBuilder: (context, url, progress) => const TShimmerEffect(width: 100, height: 100),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      )
    ),
  );
}
