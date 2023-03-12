import 'package:flutter/material.dart';
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
      height: 320,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: product.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(() => ProductDetailView(product[index]));
            },
            child: SizedBox(
              width: 164,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      color: Colors.white,
                    ),
                    height: 240,
                    width: 164,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
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
                    color: secondColor,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    text: product[index].description,
                    fontSize: 12,
                    maxLines: 1,
                    color: secondColor,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    text: '${product[index].price} S.P',
                    fontSize: 16,
                    color: const Color(0xFFC0846C),
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 15);
        },
      ),
    );
  }
}
