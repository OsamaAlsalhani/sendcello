// ignore_for_file: must_be_immutable
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
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
            height: 130,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
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
                padding: const EdgeInsets.only(right: 16, left: 16, bottom: 24),
                child: Form(
                  key: _formKey,
                  child: GetBuilder<CheckoutViewModel>(
                    init: Get.find<CheckoutViewModel>(),
                    builder: (controller) => Column(
                      children: [
                        const ListViewProductsCart(),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          title: 'Name',
                          hintText: 'Enter Full Name'.tr,
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
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          title: 'Location',
                          hintText: 'Enter Your Location'.tr,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 4) {
                              return 'Please enter valid Location.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            controller.locate = value;
                          },
                        ),
                        const SizedBox(height: 20),
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
                        const SizedBox(height: 38),
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
                                        const Icon(
                                          Icons.check_circle_outline_outlined,
                                          color: primaryColor,
                                          size: 200,
                                        ),
                                        const CustomText(
                                          text: 'Order Submitted',
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          alignment: Alignment.center,
                                        ),
                                        const SizedBox(height: 40),
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
