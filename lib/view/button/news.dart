import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supercellostore/core/view&model/feedback_viewmodel.dart';
import 'package:supercellostore/view/widgets/custom_text.dart';

import 'feedback.dart';

class NewsView extends StatelessWidget {
  NewsView({super.key});
  final FeedBackController controller = Get.find();

  _lodingnews() {
    if (controller.feedbacks
        .where((feed) => feed.userId == 'newspaper')
        .isNotEmpty) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'.tr),
      ),
      body: Column(
        children: [
          Expanded(
            child: _lodingnews()
                ? const CustomText(
                    text: 'No News',
                    alignment: Alignment.center,
                  )
                : Obx(
                    () => ListView.builder(
                      itemCount: controller.feedbacks
                          .where((feed) => feed.userId == 'newspaper')
                          .length,
                      itemBuilder: (context, index) => feedBackCard(controller
                          .feedbacks
                          .where((feed) => feed.userId == 'newspaper')
                          .toList()[index]),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
