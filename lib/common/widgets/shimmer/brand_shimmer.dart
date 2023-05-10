import 'package:etrade_actions/common/widgets/shimmer/t_shimmer.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TGriedViewLayout.dart';
import 'package:flutter/material.dart';

class TBrandsShimmer extends StatelessWidget {
  const TBrandsShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridViewLayout(
      mainAxisExtent: 80,
      itemCount: itemCount,
      itemBuilder: (_, __) => const TShimmerEffect(width: 300, height: 80), 
    );
  }
}