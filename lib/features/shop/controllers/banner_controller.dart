import 'package:etrade_actions/common/widgets/loaders/loaders.dart';
import 'package:etrade_actions/data/repositories/banners/banner_repository.dart';
import 'package:etrade_actions/features/shop/models/banner_model.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  final isLoading = false.obs;
  final carouselCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit () {
    fetchBanners();
    super.onInit();
  }
  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();
      this.banners.assignAll(banners);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: 'Something went wrong $e');
    } finally {
      isLoading.value = false;
    }
  }
}