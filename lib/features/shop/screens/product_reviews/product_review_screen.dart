import 'package:etrade_actions/common/widgets/appbar/appbar.dart';
import 'package:etrade_actions/features/shop/screens/product_reviews/widgets/t_overall_indicator.dart';
import 'package:etrade_actions/features/shop/screens/product_reviews/widgets/t_rating_review.dart';
import 'package:etrade_actions/features/shop/screens/product_reviews/widgets/t_user_review_card.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductReview extends StatelessWidget {
  const ProductReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            const Text(
                'Ratings and review are verified and rae from who use the same type of device that you use.'),
            const SizedBox(height: TSizes.spaceBtwItems),
            const TOverallIndicator(),
            const SizedBox(height: TSizes.spaceBtwItems),
            const TRatingBarIndicator(rating: 4.5,),
            Text('12, 611', style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: TSizes.spaceBtwSections),
            
            // User Reviews list
            const TUserReviewCard(),
            const TUserReviewCard(),
            const TUserReviewCard(),
            const TUserReviewCard(),
            const TUserReviewCard(),
          ],
        ),
      ),
    );
  }
}
