import 'package:etrade_actions/features/shop/controllers/address_controller.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TSectionHeading.dart';
import 'package:etrade_actions/utils/constants/colors.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
            title: 'Shipping Address',
            buttonTitle: 'Change',
            onButtonPressed: () =>
                addressController.selectNewAddressPopup(context)),
        addressController.selectedAddress.value.id.isNotEmpty
            ? Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(addressController.selectedAddress.value.name,
                        style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    Row(
                      children: [
                        const Icon(Icons.phone, color: TColors.grey, size: 16),
                        const SizedBox(width: TSizes.spaceBtwItems),
                        Text(addressController.selectedAddress.value.phoneNumber,
                            style: Theme.of(context).textTheme.bodyMedium)
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    Row(
                      children: [
                        const Icon(Icons.location_history,
                            color: TColors.grey, size: 16),
                        const SizedBox(width: TSizes.spaceBtwItems),
                        Text(
                          addressController.selectedAddress.value.toString(),
                          style: Theme.of(context).textTheme.labelMedium,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ],
                ),
            )
            : Text(
                'Select Address',
                style: Theme.of(context).textTheme.bodyMedium,
              )
      ],
    );
  }
}
