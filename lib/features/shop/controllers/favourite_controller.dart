import 'dart:convert';

import 'package:etrade_actions/common/widgets/loaders/loaders.dart';
import 'package:etrade_actions/data/repositories/product/product_repository.dart';
import 'package:etrade_actions/features/shop/models/product_model.dart';
import 'package:etrade_actions/utils/local_storage/storage_utility.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  static FavouriteController get instance => Get.find();

  final favourites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  Future<void> initFavourites() async {
    final json = TLocalStorage.instance().readData('favourites');
    if (json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(
          storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId) {
    return favourites[productId] ?? false;
  }

  void toggleFavouriteProduct(String productId) {
    if (!favourites.containsKey(productId)) {
      favourites[productId] = true;
      saveFavoritesToStorage();
      TLoaders.customToast(message: 'Product has been added to wishlist.');
    } else {
      TLocalStorage.instance().removeData(productId);
      favourites.remove(productId);
      saveFavoritesToStorage();
      favourites.refresh();
    }
  }
  
  void saveFavoritesToStorage() {
    final encondedFavourites = json.encode(favourites);
    TLocalStorage.instance().saveData('favourites', encondedFavourites);
  }

  Future<List<ProductModel>> favoriteProducts() async {
    return await ProductRepository.instance.getFavouriteProducts(productIds: favourites.keys.toList());
  }
}