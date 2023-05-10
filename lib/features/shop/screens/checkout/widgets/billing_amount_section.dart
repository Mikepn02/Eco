import 'package:etrade_actions/features/shop/controllers/cart_controller.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:etrade_actions/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller  = CartController.instance;
    final subtotal = controller.totalCartPrice.value;
    return Column(
      children: [
        // SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Sub total',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text('\$$subtotal', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shipping fee',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text('\$${TPricingCalculator.calculateShippingCost(subtotal, 'US')}', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax fee', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$${TPricingCalculator.calculateTax(subtotal, 'US')}', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order total', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$${TPricingCalculator.calculateTotalPrice(subtotal, 'US')}', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),        
      ],
    );
  }
}
