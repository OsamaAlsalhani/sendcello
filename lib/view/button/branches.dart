// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:supercellostore/constance.dart';
import 'package:supercellostore/model/product_model.dart';
import 'package:supercellostore/view/widgets/custom_text.dart';

class BranchesView extends StatelessWidget {
  const BranchesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Branches'.tr),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.85,
          child: ListView.builder(
            itemCount: afroaData.length,
            itemBuilder: (context, index) =>
                BranchesCard(list: afroaData[index]),
          ),
        ),
      ),
    );
  }
}

class BranchesCard extends StatelessWidget {
  ProductModel list;

  BranchesCard({required this.list, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            child: Image.asset(
              list.imageSlider[0],
              height: 150,
              width: 150,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomText(
                  text: list.category,
                ),
                CustomText(
                  text: list.name,
                ),
                CustomText(
                  text: list.description,
                ),
                CustomText(
                  text: list.productId,
                ),
                GestureDetector(
                  onTap: () {
                    var number = ClipboardData(text: list.price);
                    Clipboard.setData(number);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('تم النسخ الى الحافظة')),
                    );
                  },
                  child: CustomText(
                    text: list.price,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

var afroaData = [
  ProductModel(
    imageSlider: ['assets/images/cello.png'],
    name: 'الفرع الرئيسي',
    category: 'دمشق',
    description: 'الحريقة - شارع ابو عبيدة بن الجراح',
    productId: 'البنك العربي سابقا',
    price: '+963944700444',
  ),
  ProductModel(
    imageSlider: ['assets/images/cello.png'],
    name: ' 2 فرع الحريقة',
    category: 'دمشق',
    description: 'شارع عبيدة بن الجراح',
    productId: 'جانب شحن الأطلس',
    price: '+963933942988',
  ),
  ProductModel(
    imageSlider: ['assets/images/cello.png'],
    name: ' 3 فرع الحريقة',
    category: 'دمشق',
    description: 'شارع عبد القادر',
    productId: 'الحسيني',
    price: '+963932210871',
  ),
  ProductModel(
    imageSlider: ['assets/images/cello.png'],
    name: ' 1 فرع مدحت باشا',
    category: 'دمشق',
    description: 'مدحت باشا',
    productId: 'سوق ضراع',
    price: '+963944308999',
  ),
  ProductModel(
    imageSlider: ['assets/images/cello.png'],
    name: 'فرع مدحت باشا 2',
    category: 'دمشق',
    description: 'مدحت باشا ',
    productId: 'بناء المهدي ط 1',
    price: '+963981123006',
  ),
  ProductModel(
    imageSlider: ['assets/images/cello.png'],
    name: 'فرع مساكن برزة',
    category: 'دمشق',
    description: 'مساكن برزة ',
    productId: 'مقابل السكن الجامعي',
    price: '+963981123005',
  ),
  ProductModel(
    imageSlider: ['assets/images/cello.png'],
    name: 'فرع ميدان',
    category: 'دمشق',
    description: 'ميدان ابو حبل',
    productId: 'جانب جامع الدقاق',
    price: '+963981123013',
  ),
  ProductModel(
    imageSlider: ['assets/images/cello.png'],
    name: 'فرع دوما',
    category: 'دمشق',
    description: 'دوما - شارع الجلاء',
    productId: 'مقابل الجامع الكبير',
    price: '+963981123001',
  ),
  ProductModel(
    imageSlider: ['assets/images/cello.png'],
    name: 'فرع قدسيا',
    category: 'دمشق',
    description: 'مقابل شاورما أنس',
    productId: 'مركز سيرياتل سابقا',
    price: '+963981123012',
  ),
  ProductModel(
    imageSlider: ['assets/images/cello.png'],
    name: 'فرع حمص',
    category: 'حمص ',
    description: 'سوق الجملة - جانب الحلبي',
    productId: 'ساحة الجامع الكبير',
    price: '+963981123007',
  ),
  ProductModel(
    imageSlider: ['assets/images/cello.png'],
    name: 'فرع حماة',
    category: 'حماة',
    description: 'شارع ابن الرشد',
    productId: 'محل الحاج متولي سابقا',
    price: '+963981123008',
  ),
  ProductModel(
    imageSlider: ['assets/images/cello.png'],
    name: '2 فرع حماة',
    category: 'حماة',
    description: 'شارع ابن الرشد',
    productId: 'مقابل جامع السلطان',
    price: '+963981123008',
  ),
  ProductModel(
    imageSlider: ['assets/images/cello.png'],
    name: 'فرع بانياس',
    category: 'بانياس',
    description: 'شارع جول جمال',
    productId: 'مقابل M_ONE',
    price: '+963936867567',
  ),
  ProductModel(
    imageSlider: ['assets/images/cello.png'],
    name: 'فرع اللاذقية 1',
    category: 'اللاذقية',
    description: 'شارع اليرموك',
    productId: 'مقابل مدرسة الكلية',
    price: '+963981123004',
  ),
  ProductModel(
    imageSlider: ['assets/images/cello.png'],
    name: 'فرع اللاذقية 2',
    category: 'اللاذقية',
    description: 'سوق التجار',
    productId: 'جانب كل شيء للطفل',
    price: '+963981123002',
  ),
];
