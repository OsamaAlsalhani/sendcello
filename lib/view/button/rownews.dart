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
            border: Border.all(color: secondColor),
            color: const Color(0xFFE7C7B7),
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
                  Icon(
                    Icons.newspaper,
                    color: Color(0xFF7C4E46),
                  ),
                  CustomText(
                    text: 'News',
                    alignment: Alignment.center,
                    fontSize: 12,
                    color: Color(0xFF7C4E46),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: secondColor),
            color: const Color(0xFFE7C7B7),
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
                  Icon(
                    Icons.home_work,
                    color: Color(0xFF7C4E46),
                  ),
                  CustomText(
                    text: 'Branches',
                    alignment: Alignment.center,
                    fontSize: 12,
                    color: Color(0xFF7C4E46),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: secondColor),
            color: const Color(0xFFE7C7B7),
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
                  Icon(
                    Icons.message,
                    color: Color(0xFF7C4E46),
                  ),
                  CustomText(
                    text: 'FeedBack',
                    alignment: Alignment.center,
                    fontSize: 12,
                    color: Color(0xFF7C4E46),
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
