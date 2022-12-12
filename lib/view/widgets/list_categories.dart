import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supercellostore/core/view&model/home_view_model.dart';
import 'package:supercellostore/view/category_products_view.dart';
import 'package:supercellostore/view/widgets/custom_text.dart';

class ListViewCategories extends StatelessWidget {
  ListViewCategories({Key? key}) : super(key: key);
  final HomeViewModel controller = Get.put(HomeViewModel());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(() => CategoryProductsView(
                    categoryName: controller.categories[index].name,
                    products: controller.products
                        .where((product) =>
                            product.category ==
                            controller.categories[index].name.toLowerCase())
                        .toList(),
                  ));
            },
            child: Container(
              height: 40.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: Colors.amber),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                  text: controller.categories[index].name,
                  fontSize: 24,
                  alignment: Alignment.center,
                  color: Colors.black,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 20.w);
        },
      ),
    );
  }
}
