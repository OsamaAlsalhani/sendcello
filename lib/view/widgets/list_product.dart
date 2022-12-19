import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supercellostore/constance.dart';
import 'package:supercellostore/model/product_model.dart';
import 'package:supercellostore/view/product_detail_view.dart';
import 'package:supercellostore/view/widgets/custom_text.dart';

class ListViewProducts extends StatelessWidget {
  final List<ProductModel> product;

  const ListViewProducts({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: product.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(() => ProductDetailView(product[index]));
            },
            child: SizedBox(
              width: 164.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        bottomRight: Radius.circular(12.r),
                      ),
                      color: Colors.white,
                    ),
                    height: 240.h,
                    width: 164.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        bottomRight: Radius.circular(12.r),
                      ),
                      child: Image.network(
                        product[index].imageSlider[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  CustomText(
                    text: product[index].name,
                    fontSize: 16,
                  ),
                  CustomText(
                    text: product[index].description,
                    fontSize: 12,
                    maxLines: 1,
                  ),
                  CustomText(
                    text: '${product[index].price} S.P',
                    fontSize: 16,
                    color: primaryColor,
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 15.w);
        },
      ),
    );
  }
}
