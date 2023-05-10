import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etrade_actions/common/widgets/appbar/appbar.dart';
import 'package:etrade_actions/common/widgets/product/sortable/sortable_products.dart';
import 'package:etrade_actions/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:etrade_actions/features/shop/controllers/all_products_controller.dart';
import 'package:etrade_actions/features/shop/models/product_model.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:etrade_actions/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.query, this.futureMethod });

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    return  Scaffold(
        appBar: const TAppBar(
          title: Text('Popular Products'),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: FutureBuilder(future: futureMethod ?? controller.fetchProductsByQuery(query), builder: (context, snapshot) {

              const loader = TVerticalProductShimmer();
              final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);

              if (widget != null ) return widget;
              
              final products = snapshot.data!;
              return TSortableProducts(products: products);
            })
          ),
        ));
  }
}
