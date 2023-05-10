import 'package:etrade_actions/common/widgets/appbar/appbar.dart';
import 'package:etrade_actions/common/widgets/coupon/coupon_code.dart';
import 'package:etrade_actions/common/widgets/custom_shapes/circular_container.dart';
import 'package:etrade_actions/common/widgets/loaders/loaders.dart';
import 'package:etrade_actions/features/shop/controllers/cart_controller.dart';
import 'package:etrade_actions/features/shop/controllers/order_controller.dart';
import 'package:etrade_actions/features/shop/screens/cart/widgets/multiple_cart_items.dart';
import 'package:etrade_actions/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:etrade_actions/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:etrade_actions/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:etrade_actions/utils/constants/colors.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:etrade_actions/utils/helpers/helper_functions.dart';
import 'package:etrade_actions/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmount = TPricingCalculator.calculateTotalPrice(subTotal, 'US');
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title: Text('Order Review',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TCartItems(showAddRemoveButtons: false),
              const SizedBox(height: TSizes.spaceBtwSections),
              const TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Billing Section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    // Pricing
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    // Divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    // Payment methods
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    // Billing Address
                    TBillingAddressSection()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: subTotal > 0
              ? () => orderController.processOrder(totalAmount)
              : () => TLoaders.warningSnackBar(
                  title: 'Empty Cart',
                  message: 'Add items in the cart in order to proceed.'),
          child: Text(
              'Checkout \$${TPricingCalculator.calculateTotalPrice(subTotal, 'US')}'),
        ),
      ),
    );
  }
}
