import 'package:cached_network_image/cached_network_image.dart';
import 'package:etrade_actions/common/widgets/shimmer/t_shimmer.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    Key? key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.padding = TSizes.sm,
    this.isNetworkImage = false,
    this.onTap,
    this.radius = TSizes.sm,
    this.fit = BoxFit.fitWidth,
    this.showMargin = false,
    this.applyImageRadius = true,
    this.border,
  }) : super(key: key);

  final double? width, height;
  final double padding;
  final double radius;
  final BoxFit? fit;
  final String image;
  final bool isNetworkImage, showMargin;
  final VoidCallback? onTap;
  final Color? overlayColor;
  final Color? backgroundColor;
  final Border? border;
  final bool applyImageRadius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(padding),
        margin: showMargin
            ? const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace)
            : null,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            border: border,
            color: backgroundColor),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(radius)
              : BorderRadius.zero,
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: fit,
                  color: overlayColor,
                  imageUrl: image,
                  progressIndicatorBuilder: (context, url, progress) =>
                      const TShimmerEffect(width: 55, height: 55),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  fit: fit,
                  image: isNetworkImage
                      ? NetworkImage(image)
                      : AssetImage(image) as ImageProvider,
                  color: overlayColor,
                  // fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
