import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supercellostore/constance.dart';
import 'package:supercellostore/view/button/branches.dart';
import 'package:supercellostore/view/button/feedback.dart';
import 'package:supercellostore/view/button/news.dart';
import 'package:supercellostore/view/widgets/custom_text.dart';

class RowNews extends StatelessWidget {
  const RowNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: primaryColor),
          ),
          height: 75,
          width: 75,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Get.to(() => NewsView());
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.newspaper),
                  CustomText(
                    text: 'News',
                    alignment: Alignment.center,
                    fontSize: 12,
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: primaryColor),
          ),
          height: 75,
          width: 75,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Get.to(() => const BranchesView());
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.home_work),
                  CustomText(
                    text: 'Branches',
                    alignment: Alignment.center,
                    fontSize: 12,
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: primaryColor),
          ),
          height: 75,
          width: 75,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Get.to(() => FeedBackView());
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.message),
                  CustomText(
                    text: 'FeedBack',
                    alignment: Alignment.center,
                    fontSize: 12,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
