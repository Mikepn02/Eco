import 'package:etrade_actions/common/widgets/appbar/appbar.dart';
import 'package:etrade_actions/common/widgets/loaders/animation_loader.dart';
import 'package:etrade_actions/features/personalization/screens/address/add_new_address.dart';
import 'package:etrade_actions/features/personalization/screens/address/widgets/single_address.dart';
import 'package:etrade_actions/features/shop/controllers/address_controller.dart';
import 'package:etrade_actions/utils/constants/colors.dart';
import 'package:etrade_actions/utils/constants/image_strings.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:etrade_actions/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () => Get.to(const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: TColors.white),
      ),
      appBar: TAppBar(
        showBackArrow: true,
        
        title:
            Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
                key: Key(controller.refreshData.value.toString()),
                future: controller.getAllUserAddresses(),
                builder: (context, snapshot) {
                  // Add loader
                  final emptyWidget = TAnimationLoaderWidget(
                      text: 'Whoops Address list is empty',
                      animation: TImages.pencilAnimation,
                      showAction: true,
                      actionText: 'Let\'s add some',
                      onActionPressed: () => Get.off(() => const AddNewAddressScreen()));

                  final response = TCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                    nothingFound: emptyWidget,
                  );
                  if (response != null) {
                    return response;
                  }

                  final addresses = snapshot.data!;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: addresses.length,
                    itemBuilder: (context, index) => TSingleAddress(
                      addressModel: addresses[index],
                      onTap: () => controller.selectAddress(addresses[index]),
                      selectedAddress: addresses[index].selectedAddress,
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
