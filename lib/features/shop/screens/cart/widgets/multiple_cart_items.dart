import 'package:etrade_actions/common/widgets/product/cart/cart_item.dart';
import 'package:etrade_actions/features/shop/controllers/cart_controller.dart';
import 'package:etrade_actions/features/shop/screens/cart/widgets/product_quantity.dart';
import 'package:etrade_actions/features/shop/screens/product_details/widgets/product_price_text.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButtons = true});
  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemCount: controller.cartItems.length,
        separatorBuilder: (_, __) => const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        itemBuilder: (_, index) => Obx(() {
          final item = controller.cartItems[index];
          return Column(
            children: [
              TCartItem(cartItemModel: controller.cartItems[index]),
              if (showAddRemoveButtons)
                const SizedBox(height: TSizes.spaceBtwItems),
              if (showAddRemoveButtons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 70),
                        TProductQuantityWithAddRemoveButton(quantity: item.quantity, add: () => controller.addOneToCart(item), remove: () => controller.removeOneFromCart(item),),
                      ],
                    ),
                    TProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1)),
                  ],
                )
            ],
          );
        }),
      ),
    );
  }
}
