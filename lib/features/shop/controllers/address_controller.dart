import 'package:etrade_actions/common/widgets/loaders/loaders.dart';
import 'package:etrade_actions/common/widgets/popups/full_screen_loader.dart';
import 'package:etrade_actions/data/repositories/address/address_repository.dart';
import 'package:etrade_actions/features/personalization/screens/address/add_new_address.dart';
import 'package:etrade_actions/features/personalization/screens/address/widgets/single_address.dart';
import 'package:etrade_actions/features/shop/models/address_model.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TSectionHeading.dart';
import 'package:etrade_actions/utils/constants/image_strings.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:etrade_actions/utils/helpers/cloud_helper_functions.dart';
import 'package:etrade_actions/utils/helpers/network_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final _addressRepository = Get.put(AddressRepository());
  RxBool refreshData = true.obs;

  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await _addressRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere((element) => element.selectedAddress, orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Address not found!', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
        title: '',
        onWillPop: () async {
          return false;
        },
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: const Center(
          child: CircularProgressIndicator(),
        )
      );

      if (selectedAddress.value.id.isNotEmpty) {
        await _addressRepository.updateSelectedField(selectedAddress.value.id, false);
      }
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      await _addressRepository.updateSelectedField(selectedAddress.value.id, true);
      Get.back();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error selecting address!', message: e.toString());
    }
  }

  Future addNewAddresses() async {
    try {
      TFullScreenLoader.openLoadingDialog('Saving address ...', TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!addressFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return; 
      }

      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        postalCode: postalCode.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        country: country.text.trim(),
        selectedAddress: false,
      );

      final id = await _addressRepository.addNewAddress(address);
      
      address.id = id;
      await selectAddress(address);
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: 'Address added successfully', message: 'Your address has been added successfully');

      refreshData.toggle();
      resetFormFields();

      Navigator.of(Get.context!).pop();

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Error adding address!', message: e.toString());
    }
  }

  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
  }

  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(TSizes.lg),
        child: 
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TSectionHeading(title: 'Select Address', showActionsButton: false),
              FutureBuilder(
                future: getAllUserAddresses(),
                builder: (context, snapshot) {
                  final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                  if (response != null) {
                    return response;
                  }
        
                  return Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => TSingleAddress(
                        selectedAddress: snapshot.data![index].selectedAddress,
                        addressModel: snapshot.data![index],
                        onTap: () async {
                          await selectAddress(snapshot.data![index]);
                          Get.back();
                        },
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: TSizes.defaultSpace * 2),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const AddNewAddressScreen()),
                  child: const Text('Add New Address'),
                ),
              )
            ],
          ),
      ),
    );
  }
} 