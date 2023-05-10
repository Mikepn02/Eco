import 'package:etrade_actions/common/widgets/appbar/appbar.dart';
import 'package:etrade_actions/common/widgets/loaders/animation_loader.dart';
import 'package:etrade_actions/features/shop/controllers/cart_controller.dart';
import 'package:etrade_actions/features/shop/screens/cart/widgets/multiple_cart_items.dart';
import 'package:etrade_actions/features/shop/screens/checkout/checkout_screen.dart';
import 'package:etrade_actions/navigation_menu.dart';
import 'package:etrade_actions/utils/constants/image_strings.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: Obx(
        () {
          final emptyWidget = TAnimationLoaderWidget(
              text: 'Whoops! Cart is empty',
              animation: TImages.cartAnimation,
              showAction: true,
              actionText: 'Let\'s fill it',
              onActionPressed: () => Get.off(() => const NavigationMenu()));

          return controller.cartItems.isEmpty
              ? emptyWidget
              : const SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(TSizes.defaultSpace),
                    child: TCartItems(),
                  ),
                );
        },
      ),
      bottomNavigationBar: controller.cartItems.isEmpty ? const SizedBox() : Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckoutScreen()),
          child: Obx(() => Text('Checkout \$${controller.totalCartPrice.value}')),
        ),
      ),
    );
  }
}
