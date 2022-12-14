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
                      const SnackBar(content: Text('???? ?????????? ?????? ??????????????')),
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
    name: '?????????? ??????????????',
    category: '????????',
    description: '?????????????? - ???????? ?????? ?????????? ???? ????????????',
    productId: '?????????? ???????????? ??????????',
    price: '+963944700444',
  ),
  ProductModel(
    imageSlider: ['assets/images/cello.png'],
    name: ' 2 ?????? ??????????????',
    category: '????????',
    description: '???????? ?????????? ???? ????????????',
    productId: '???????? ?????? ????????????',
    price: '+963933942988',
  ),
  ProductModel(
    imageSlider: ['assets/images/cello.png'],
    name: ' 3 ?????? ??????????????',
    category: '????????',
    description: '???????? ?????? ????????????',
    productId: '??????????????',
    price: '+963932210871',
  ),
  ProductModel(
    imageSlider: ['assets/images/cello.png'],
    name: ' 1 ?????? ???????? ????????',
    category: '????????',
    description: '???????? ????????',
    productId: '?????? ????????',
    price: '+963944308999',
  ),
  ProductModel(
    imageSlider: ['assets/images/cello.png'],
    name: '?????? ???????? ???????? 2',
    category: '????????',
    description: '???????? ???????? ',
    productId: '???????? ???????????? ?? 1',
    price: '+963981123006',
  ),
  ProductModel(
    imageSlider: ['assets/images/cello.png'],
    name: '?????? ?????????? ????????',
    category: '????????',
    description: '?????????? ???????? ',
    productId: '?????????? ?????????? ??????????????',
    price: '+963981123005',
  ),
  ProductModel(
    imageSlider: ['assets/images/cello.png'],
    name: '?????? ????????',
    category: '????????',
    description: '???????? - ???????? ????????????',
    productId: '?????????? ???????????? ????????????',
    price: '+963981123001',
  ),
  ProductModel(
    imageSlider: ['assets/images/cello.png'],
    name: '?????? ??????',
    category: '?????? ',
    description: '?????? ???????????? - ???????? ????????????',
    productId: '???????? ???????????? ????????????',
    price: '+963981123007',
  ),
  ProductModel(
    imageSlider: ['assets/images/cello.png'],
    name: '?????? ????????',
    category: '????????',
    description: '???????? ?????? ??????????',
    productId: '?????? ?????????? ?????????? ??????????',
    price: '+963981123008',
  ),
  ProductModel(
    imageSlider: ['assets/images/cello.png'],
    name: '?????? ???????????????? 1',
    category: '????????????????',
    description: '???????? ??????????????',
    productId: '?????????? ?????????? ????????????',
    price: '+963981123004',
  ),
  ProductModel(
    imageSlider: ['assets/images/cello.png'],
    name: '?????? ???????????????? 2',
    category: '????????????????',
    description: '?????? ????????????',
    productId: '???????? ???? ?????? ??????????',
    price: '+963981123002',
  ),
];
