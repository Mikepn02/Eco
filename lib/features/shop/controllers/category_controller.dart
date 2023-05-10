import 'package:etrade_actions/common/widgets/loaders/loaders.dart';
import 'package:etrade_actions/common/widgets/popups/full_screen_loader.dart';
import 'package:etrade_actions/data/repositories/categories/category_repository.dart';
import 'package:etrade_actions/data/repositories/product/product_repository.dart';
import 'package:etrade_actions/features/shop/models/category_model.dart';
import 'package:etrade_actions/features/shop/models/product_model.dart';
import 'package:etrade_actions/utils/constants/image_strings.dart';
import 'package:etrade_actions/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  final isUploadLoad = false.obs;
  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;
      final categories = await _categoryRepository.getAllCategories();
      allCategories.assignAll(categories);
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
      isLoading.value = false;
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Oh Snap', message: 'Something went wrong $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final subCategories =
          await _categoryRepository.getSubCategories(categoryId);
      return subCategories;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> getCategoryProducts(
      {required String categoryId, int limit = -1}) async {
    final products = await ProductRepository.instance
        .getProductsForCategory(categoryId: categoryId, limit: limit);
    return products;
  }

  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      isUploadLoad.value = true;
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      TFullScreenLoader.openLoadingDialog(
          'Saving up data...', TImages.docerAnimation);
      await _categoryRepository.uploadDummyData(categories);
      isUploadLoad.value = false;
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: 'Success', message: 'Data uploaded');
    } catch (e) {
      isLoading.value = false;
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
