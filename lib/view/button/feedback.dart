import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supercellostore/constance.dart';
import 'package:supercellostore/core/view&model/feedback_viewmodel.dart';
import 'package:supercellostore/core/view&model/profile_viewmodel.dart';
import 'package:supercellostore/model/feedback.dart';
import 'package:supercellostore/view/widgets/custom_text.dart';
import 'package:supercellostore/view/widgets/custom_textfield.dart';

class FeedBackView extends StatelessWidget {
  FeedBackView({super.key});
  final String userId = Get.find<ProfileViewModel>().currentUser!.userId;
  final FeedBackController controller = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FeedBack'.tr),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: GetBuilder<FeedBackController>(
                init: FeedBackController(),
                builder: (controller) => Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: primaryColor),
                      ),
                      child: CustomTextFormField(
                        title: 'FeedBack'.tr,
                        hintText: '',
                        validator: (value) {
                          if (value!.isEmpty || value.length < 6) {
                            return 'Please enter valid password with at least 6 characters.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          controller.feedBackMes = value;
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const CustomText(
                          text: 'Send FeedBack',
                          fontWeight: FontWeight.bold,
                        ),
                        IconButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              await controller.sendFeedBack();
                            }
                          },
                          icon: const Icon(Icons.send),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.feedbacks
                    .where((feed) => feed.userId == userId)
                    .length,
                itemBuilder: (context, index) => feedBackCard(controller
                    .feedbacks
                    .where((feed) => feed.userId == userId)
                    .toList()[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget feedBackCard(FeedBackModel feedBack) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomText(
              text: feedBack.date,
              color: Colors.grey,
            ),
            const SizedBox(height: 10),
            CustomText(
              text: feedBack.feedBackMes,
              color: primaryColor,
            ),
          ],
        ),
      ),
    ),
  );
}
