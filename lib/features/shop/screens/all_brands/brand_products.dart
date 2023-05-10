import 'package:etrade_actions/common/widgets/appbar/appbar.dart';
import 'package:etrade_actions/common/widgets/brands/TBrands.dart';
import 'package:etrade_actions/common/widgets/product/sortable/sortable_products.dart';
import 'package:etrade_actions/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:etrade_actions/features/shop/controllers/brand_controller.dart';
import 'package:etrade_actions/features/shop/models/brand_model.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:etrade_actions/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({Key? key, required this.brandModel}) : super(key: key);

  final BrandModel brandModel;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(brandModel.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                TBrandCard(showBorder: true,brand: brandModel),
                const SizedBox(height: TSizes.spaceBtwSections),
                FutureBuilder(
                  future: controller.getBrandProducts(brandId: brandModel.id),
                  builder: (context, snapshot) {
                    const loader = TVerticalProductShimmer();
                    final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;
                    final brandProducts = snapshot.data!;
                    return TSortableProducts(products: brandProducts);
                  }
                )
              ],
            )),
      ),
    );
  }
}
