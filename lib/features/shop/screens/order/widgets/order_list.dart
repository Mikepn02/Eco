import 'package:etrade_actions/common/widgets/custom_shapes/circular_container.dart';
import 'package:etrade_actions/common/widgets/loaders/animation_loader.dart';
import 'package:etrade_actions/features/shop/controllers/order_controller.dart';
import 'package:etrade_actions/navigation_menu.dart';
import 'package:etrade_actions/utils/constants/colors.dart';
import 'package:etrade_actions/utils/constants/image_strings.dart';
import 'package:etrade_actions/utils/constants/sizes.dart';
import 'package:etrade_actions/utils/helpers/cloud_helper_functions.dart';
import 'package:etrade_actions/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    final dark = THelperFunctions.isDarkMode(context);
    return 
    FutureBuilder(
      future: controller.fetchUserOrders(),
      builder: (context, snapshot) {
        final emptyWidget = TAnimationLoaderWidget(
                      text: 'Whoops! No orders yet!',
                      animation: TImages.pencilAnimation,
                      showAction: true,
                      actionText: 'Let\'s add some',
                      onActionPressed: () => Get.off(() => const NavigationMenu()));

        final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, nothingFound: emptyWidget);
        if (response != null) return response;

        final orders = snapshot.data!;
        return ListView.separated(
          separatorBuilder: (_, index) =>
              const SizedBox(height: TSizes.spaceBtwItems),
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: orders.length,
          itemBuilder: (_, index) {
            final order = orders[index];
            return TRoundedContainer(
            showBorder: true,
            backgroundColor: dark ? TColors.dark : TColors.white,
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Row 1
                Row(
                  children: [
                    const Icon(Iconsax.ship),
                    const SizedBox(width: TSizes.spaceBtwItems / 2),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.orderStatusText,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .apply(color: TColors.primary, fontWeightDelta: 1),
                          ),
                          Text(order.formattedOrderDate,
                              style: Theme.of(context).textTheme.headlineSmall)
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Iconsax.arrow_right_34, size: TSizes.iconSm),
                    )
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                // Row 2
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(Iconsax.tag),
                          const SizedBox(width: TSizes.spaceBtwItems / 2),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order',
                                  style: Theme.of(context).textTheme.labelMedium,
                                ),
                                Text(order.id,
                                    style: Theme.of(context).textTheme.titleMedium)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(Iconsax.calendar),
                          const SizedBox(width: TSizes.spaceBtwItems / 2),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Shipping Date',
                                  style: Theme.of(context).textTheme.labelMedium,
                                ),
                                Text(order.formattedDeliveryDate,
                                    style: Theme.of(context).textTheme.titleMedium)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          );
          }
        );
      }
    );
  }
}
