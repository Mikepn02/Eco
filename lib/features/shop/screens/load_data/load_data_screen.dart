import 'package:etrade_actions/common/mock/dummy_data.dart';
import 'package:etrade_actions/common/widgets/appbar/appbar.dart';
import 'package:etrade_actions/features/shop/controllers/category_controller.dart';
import 'package:etrade_actions/features/shop/controllers/product_controller.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoadDataScreen extends StatelessWidget {
  const LoadDataScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());
    final categoryController = Get.put(CategoryController());
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Upload Data'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            ListTile(
              title: const Text('Upload your category\'s data'),
              trailing: IconButton(onPressed: () => categoryController.uploadDummyData(TDummyData.categories), icon: const Icon(Iconsax.cloud_plus)),
            ),
            ListTile(
              title: const Text('Upload your product\'s data'),
              trailing: IconButton(onPressed: () => productController.uploadDummyData(TDummyData.products), icon: const Icon(Iconsax.cloud_plus)),
            ),
          ],
        ),
      ),
    );
  }
}