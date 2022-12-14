import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supercellostore/constance.dart';
import 'package:supercellostore/core/view&model/checkout_viewmodel.dart';
import 'package:supercellostore/view/widgets/custom_textfield.dart';
import 'package:supercellostore/view/widgets/list_product_cart.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_text.dart';

class CheckoutView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

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
                                          color: primaryColor,
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
}
