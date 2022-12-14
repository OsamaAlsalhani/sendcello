import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supercellostore/constance.dart';
import 'package:supercellostore/core/view&model/home_view_model.dart';
import 'package:supercellostore/view/category_products_view.dart';
import 'package:supercellostore/view/widgets/custom_text.dart';

class RowName extends StatelessWidget {
  final String categoryName, productCategoryName;
  final HomeViewModel controller = Get.put(HomeViewModel());
  RowName({
    super.key,
    required this.categoryName,
    required this.productCategoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: categoryName,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: primaryColor,
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => CategoryProductsView(
                categoryName: categoryName,
                products: controller.products
                    .where((product) => product.category == productCategoryName)
                    .toList()));
          },
          child: const CustomText(
            text: 'See all',
            fontSize: 16,
            color: primaryColor,
          ),
        ),
      ],
    );
  }
}
