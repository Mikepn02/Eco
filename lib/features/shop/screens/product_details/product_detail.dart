
import 'package:etrade_actions/features/shop/models/product_model.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TSectionHeading.dart';
import 'package:etrade_actions/features/shop/screens/product_details/widgets/bottom_cart_navigation.dart';
import 'package:etrade_actions/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:etrade_actions/features/shop/screens/product_details/widgets/product_metadata.dart';
import 'package:etrade_actions/features/shop/screens/product_details/widgets/product_ratings_share.dart';
import 'package:etrade_actions/features/shop/screens/product_details/widgets/product_slider.dart';
import 'package:etrade_actions/features/shop/screens/product_reviews/product_review_screen.dart';
import 'package:etrade_actions/utils/constants/enums.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key,required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(productModel: product,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Image Slider
            TProductImageSlider(productModel: product),

            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  // Rating * Share
                  const TRatingsAndShare(),
                  // Price and title
                  TProductMetaData(productModel: product),
                  // Attribute
                  if(product.productType == ProductType.variable.toString()) TProductAttributes(productModel: product),
                  if(product.productType == ProductType.variable.toString()) const SizedBox(height: TSizes.spaceBtwSections),

                  const SizedBox(height: TSizes.spaceBtwItems),

                  TSectionHeading(title: product.title, showActionsButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: ' Less',
                    moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  // Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(title: 'Reviews (199)', showActionsButton: false),
                      IconButton(onPressed: () => Get.to(const ProductReview()), icon: const Icon(Iconsax.arrow_right_3, size: 18),)
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  
                ],
              ),
            )

            /// Product details
          ],
        ),
      ),
    );
  }
}
