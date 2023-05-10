import 'package:etrade_actions/features/shop/controllers/cart_controller.dart';
import 'package:etrade_actions/features/shop/models/product_model.dart';
import 'package:etrade_actions/features/shop/screens/product_details/product_detail.dart';
import 'package:etrade_actions/utils/constants/colors.dart';
import 'package:etrade_actions/utils/constants/enums.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  final ProductModel product;

  const ProductCardAddToCartButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return InkWell(
      onTap: () {
        if (product.productType == ProductType.single.toString()) {
          final cartItem = controller.convertToCartItem(product, 1);
          controller.addOneToCart(cartItem);
        } else {
          Get.to(() => ProductDetail(product: product));
        }
      },
      child: Obx(() {
        final productQuantityInCart = controller.productQuantityInCart.value;
        return Container(
          decoration: const BoxDecoration(
            color: TColors.dark,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(TSizes.cardRadiusMd),
              bottomRight: Radius.circular(TSizes.productImageRadius),
            ),
          ),
          child:  SizedBox(
            width: TSizes.iconLg * 1.2,
            height: TSizes.iconLg * 1.2,
            child: Center(
              child: productQuantityInCart > 0 ? Text(
                productQuantityInCart.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .apply(color: TColors.white,backgroundColor: TColors.primary),
              ) : const Icon(
                Iconsax.add,
                color: TColors.white,
              ),
            ),
          ),
        );
      }),
    );
  }
}
