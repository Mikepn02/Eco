import 'package:etrade_actions/common/widgets/shimmer/t_shimmer.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TListTileShimmer extends StatelessWidget {
  const TListTileShimmer({Key? key}) : super(key: key); // Added missing key parameter and fixed syntax

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            TShimmerEffect(width: 50, height: 50, radius: 50), // Assuming TShimmerEffect is defined elsewhere
            SizedBox(width: TSizes.spaceBtwItems), // Assuming TSizes.spaceBtwItems is defined elsewhere
            Column(
              children: [
                TShimmerEffect(width: 100, height: 15), // Assuming TShimmerEffect is defined elsewhere
                SizedBox(height: TSizes.spaceBtwItems / 2), // Assuming TSizes.spaceBtwItems is defined elsewhere
                TShimmerEffect(width: 80, height: 12), // Assuming TShimmerEffect is defined elsewhere
              ],
            ),
          ],
        ),
      ],
    );
  }
}
