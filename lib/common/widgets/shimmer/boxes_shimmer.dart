import 'package:etrade_actions/common/widgets/shimmer/t_shimmer.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TBoxesShimmer extends StatelessWidget {
  const TBoxesShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: TShimmerEffect(width: 150, height: 110)), // Assuming TShimmerEffect is defined elsewhere
            SizedBox(width: TSizes.spaceBtwItems), // Assuming TSizes.spaceBtwItems is defined elsewhere
            Expanded(child: TShimmerEffect(width: 150, height: 110)), // Assuming TShimmerEffect is defined elsewhere
            SizedBox(width: TSizes.spaceBtwItems), // Assuming TSizes.spaceBtwItems is defined elsewhere
            Expanded(child: TShimmerEffect(width: 150, height: 110)), // Assuming TShimmerEffect is defined elsewhere
          ],
        ),
      ],
    );
  }
}
