import 'package:etrade_actions/common/widgets/custom_shapes/circular_container.dart';
import 'package:etrade_actions/features/shop/controllers/address_controller.dart';
import 'package:etrade_actions/features/shop/models/address_model.dart';
import 'package:etrade_actions/utils/constants/colors.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:etrade_actions/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress(
      {super.key,
      required this.selectedAddress,
      required this.addressModel,
      required this.onTap});
  final bool selectedAddress;
  final AddressModel addressModel;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Obx(() {
      final selectedAddressId = controller.selectedAddress.value.id;
      final selectedAddress = selectedAddressId == addressModel.id;
      return InkWell(
        onTap: onTap,
        child: TRoundedContainer(
          width: double.infinity,
          showBorder: true,
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: selectedAddress
              ? TColors.primary.withOpacity(0.5)
              : Colors.transparent,
          borderColor: selectedAddress
              ? Colors.transparent
              : dark
                  ? TColors.darkGrey
                  : TColors.grey,
          margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
          child: Stack(
            children: [
              Positioned(
                right: 5,
                top: 0,
                child: Icon(
                  selectedAddress ? Iconsax.tick_circle5 : null,
                  color: selectedAddress
                      ? dark
                          ? TColors.light
                          : TColors.dark
                      : null,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    addressModel.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: TSizes.sm / 2),
                  Text(
                    addressModel.formattedPhoneNumber,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: TSizes.sm / 2),
                  Text(addressModel.toString(),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
