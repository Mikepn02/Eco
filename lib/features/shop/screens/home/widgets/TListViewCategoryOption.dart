import 'package:etrade_actions/common/widgets/shimmer/category_shimmer.dart';
import 'package:etrade_actions/features/shop/controllers/category_controller.dart';
import 'package:etrade_actions/features/shop/screens/home/widgets/TVerticalCard.dart';
import 'package:etrade_actions/features/shop/screens/sub_category/sub_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TListViewCategoryOption extends StatelessWidget {
  const TListViewCategoryOption({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Obx(() {
      if (categoryController.isLoading.value) return const TCategoryShimmer();
      if (categoryController.featuredCategories.isEmpty) {
        return Center(
            child: Text('No Data Found!',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(color: Colors.white)));
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
            itemCount: categoryController.featuredCategories.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = categoryController.featuredCategories[index];
              return TVerticalCard(
                image: category.image,
                title: category.name,
                onTap: () => Get.to(() => SubCategoriesScreen(category: category,)),
              );
            }),
      );
    });
  }
}
