import 'package:etrade_actions/common/widgets/shimmer/t_shimmer.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class THorizontalProductShimmer extends StatelessWidget {
  const THorizontalProductShimmer({
    Key? key,
    this.itemCount = 4,
  }) : super(key: key);

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems),
        itemBuilder: (_, index) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Image
            TShimmerEffect(width: 120, height: 120),
            SizedBox(width: TSizes.spaceBtwItems),
            /// Text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: TSizes.spaceBtwItems / 2),
                TShimmerEffect(width: 160, height: 15),
                SizedBox(height: TSizes.spaceBtwItems / 2),
                TShimmerEffect(width: 110, height: 15),
                SizedBox(height: TSizes.spaceBtwItems / 2),
                TShimmerEffect(width: 80, height: 15),
              ],
            ),
            // Spacer(),
          ],
        ),
      ),
    );
  }
}
