import 'package:etrade_actions/features/shop/controllers/address_controller.dart';
import 'package:etrade_actions/features/shop/controllers/checkout_controller.dart';
import 'package:etrade_actions/features/shop/controllers/variation_controller.dart';
import 'package:etrade_actions/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(AddressController());
    Get.put(CheckoutController());
  }
}