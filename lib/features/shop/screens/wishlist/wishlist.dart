import 'package:etrade_actions/common/widgets/appbar/appbar.dart';
import 'package:etrade_actions/common/widgets/icon/circular_icon.dart';
import 'package:etrade_actions/common/widgets/loaders/animation_loader.dart';
import 'package:etrade_actions/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:etrade_actions/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:etrade_actions/features/shop/controllers/favourite_controller.dart';
import 'package:etrade_actions/features/shop/screens/home/home_screen.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TGriedViewLayout.dart';
import 'package:etrade_actions/navigation_menu.dart';
import 'package:etrade_actions/utils/constants/image_strings.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:etrade_actions/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    return Scaffold(
      appBar: TAppBar(
        title:
            Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCicularIcon(
              icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen()))
        ],
        showBackArrow: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
                future: controller.favoriteProducts(),
                builder: (context, snapshot) {
                  final emptyWidget = TAnimationLoaderWidget(
                      text: 'Whoops Wishlist is empty',
                      animation: TImages.pencilAnimation,
                      showAction: true,
                      actionText: 'Let\'s add some',
                      onActionPressed: () => Get.off(() => const NavigationMenu()));
                  const loader = TVerticalProductShimmer(itemCount: 6);
                  final widget = TCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot,
                      loader: loader,
                      nothingFound: emptyWidget);
                  if (widget != null) {
                    return widget;
                  }
                  final products = snapshot.data!;
                  return TGridViewLayout(
                    itemCount: products.length,
                    mainAxisExtent: 280,
                    itemBuilder: (_, index) =>
                        TProductCartVertical(product: products[index]),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
