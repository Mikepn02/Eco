import 'package:etrade_actions/common/widgets/shimmer/t_shimmer.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TGriedViewLayout.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TVerticalProductShimmer extends StatelessWidget {
  const TVerticalProductShimmer({
    Key? key,
    this.itemCount = 4,
  }) : super(key: key);

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridViewLayout(
      itemCount: itemCount,
      itemBuilder: (context, index) => SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            TShimmerEffect(
              width: 180,
              height: 180,
              color: Colors.grey[300],
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            // Text
            TShimmerEffect(
              width: 160,
              height: 15,
              color: Colors.grey[300],
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            const TShimmerEffect(
              width: 110,
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
