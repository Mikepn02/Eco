import 'package:etrade_actions/common/widgets/loaders/loaders.dart';
import 'package:etrade_actions/common/widgets/popups/full_screen_loader.dart';
import 'package:etrade_actions/data/repositories/auth/authentication_repository.dart';
import 'package:etrade_actions/data/repositories/orders/order_repository.dart';
import 'package:etrade_actions/features/authentication/screens/success/success_screen%20copy.dart';
import 'package:etrade_actions/features/shop/controllers/address_controller.dart';
import 'package:etrade_actions/features/shop/controllers/cart_controller.dart';
import 'package:etrade_actions/features/shop/controllers/checkout_controller.dart';
import 'package:etrade_actions/features/shop/models/order_model.dart';
import 'package:etrade_actions/utils/constants/enums.dart';
import 'package:etrade_actions/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  // Fetch user's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final orders = await orderRepository.fetchUserOrders();
      return orders;
    } catch (e) {
      TLoaders.warningSnackBar(title: 'Oh snap', message: e.toString());
      return [];
    }
  }

  // Place a new order
  void processOrder(double totalAmount) async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Processing your order', TImages.pencilAnimation);

      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) {
        throw 'Unable to find user information. Try again in a few minutes.';
      }

      final order = OrderModel(
          id: UniqueKey().toString(),
          userId: userId,
          status: OrderStatus.processing,
          totalAmount: totalAmount,
          orderDate: DateTime.now(),
          paymentMethod: checkoutController.selectedPaymentMethod.value.name,
          address: addressController.selectedAddress.value,
          deliveryDate: DateTime.now(),
          items: cartController.cartItems.toList());

      await orderRepository.saveOrder(order, userId);

      cartController.clearCart();
      Get.off(
        () => const SucessScreen(
            image: TImages.successfulPaymentIcon,
            title: 'Payment Success',
            subTitle: 'Your item will be shipped soon!'),
      );
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }
}
