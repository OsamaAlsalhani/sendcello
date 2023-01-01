// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:supercellostore/constance.dart';
import 'package:supercellostore/core/view&model/home_view_model.dart';
import 'package:supercellostore/model/product_model.dart';
import 'package:supercellostore/view/open_image.dart';
import 'package:supercellostore/view/widgets/custom_text.dart';

class InfoView extends StatelessWidget {
  InfoView({super.key});
  final HomeViewModel controller = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: primaryColor),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 60,
                  width: 150,
                  child: GestureDetector(
                    onTap: () {
                      const number = ClipboardData(text: '+963944700444');
                      Clipboard.setData(number);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('تم النسخ الى الحافظة')),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CustomText(
                          text: 'للتواصل جملة',
                          alignment: Alignment.center,
                        ),
                        CustomText(
                          text: '+963944700444',
                          color: Colors.amber,
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          /* Obx(
            () => BranchsCard(
              product: controller.products
                  .where((cate) => cate.category == 'أفرع')
                  .toList(),
            ),
          )*/
        ],
      ),
    );
  }
}

class BranchsCard extends StatelessWidget {
  List<ProductModel> product;

  BranchsCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: product.length,
      itemBuilder: (context, index) => Card(
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => OpenImageScreen(
                      imageSlid: product[index].imageSlider[0],
                    ));
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                child: Hero(
                  tag: product[index].imageSlider[0],
                  child: Image.network(
                    product[index].imageSlider[0],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                CustomText(text: product[index].name),
                CustomText(text: product[index].category),
                CustomText(
                  text: product[index].description,
                  fontSize: 12,
                  maxLines: 1,
                ),
              ],
            )
          ],
        ),
      ),
      separatorBuilder: (context, index) {
        return const SizedBox(width: 15);
      },
    );
  }
}
