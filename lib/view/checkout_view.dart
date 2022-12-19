// ignore_for_file: must_be_immutable
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supercellostore/constance.dart';
import 'package:supercellostore/core/view&model/checkout_viewmodel.dart';
import 'package:supercellostore/view/widgets/custom_textfield.dart';
import 'package:supercellostore/view/widgets/list_product_cart.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_text.dart';

class CheckoutView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String? sendname = '';
  CheckoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 130.h,
            child: Padding(
              padding: EdgeInsets.only(bottom: 24.h, left: 16.w, right: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  const CustomText(
                    text: 'Checkout',
                    fontSize: 20,
                    alignment: Alignment.bottomCenter,
                  ),
                  Container(width: 24),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 24.h),
                child: Form(
                  key: _formKey,
                  child: GetBuilder<CheckoutViewModel>(
                    init: Get.find<CheckoutViewModel>(),
                    builder: (controller) => Column(
                      children: [
                        const ListViewProductsCart(),
                        SizedBox(height: 20.h),
                        CustomTextFormField(
                          title: 'Name',
                          hintText: 'Enter Full Name',
                          validator: (value) {
                            if (value!.isEmpty || value.length < 4) {
                              return 'Please enter valid name.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            controller.name = value;
                            sendname = controller.name;
                          },
                        ),
                        SizedBox(height: 20.h),
                        CustomTextFormField(
                          title: 'Phone Number',
                          hintText: '09xxxxxxxx',
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 10) {
                              return 'Please enter valid number.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            controller.phone = value;
                          },
                        ),
                        SizedBox(height: 38.h),
                        CustomButton(
                          text: 'SUBMIT',
                          color: primaryColor,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              await controller.addCheckoutToFireStore();
                              sendOrderNotifiy(sendname!);
                              Get.dialog(
                                AlertDialog(
                                  content: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.check_circle_outline_outlined,
                                          color: primaryColor,
                                          size: 200.h,
                                        ),
                                        const CustomText(
                                          text: 'Order Submitted',
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          alignment: Alignment.center,
                                        ),
                                        SizedBox(
                                          height: 40.h,
                                        ),
                                        CustomButton(
                                          text: 'Done',
                                          color: primaryColor,
                                          onPressed: () {
                                            Get.back();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                barrierDismissible: false,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  var serverToken =
      'AAAAOpQ0fnM:APA91bG7aiAMrac6h3WKzQlYt5no5-OGo7dEQ2sASn7_5M3zT440x_MR3hO1DSu-0nsKPNwib9oTKKMOpJpGLHcXrRnYduXBk2Dha3YutZEYWkW3oMAJaOHsOnxQfRMAbEoaDMr-RkFE';

  sendOrderNotifiy(String body) async {
    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'body': body,
            'title': 'طلب جديد من ',
          },
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1'
          },
          'to': "/topics/Admin"
        },
      ),
    );
  }
}
