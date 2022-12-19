import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supercellostore/constance.dart';
import 'package:supercellostore/core/view&model/cart_viewmodel.dart';

import 'checkout_view.dart';

import 'widgets/custom_text.dart';
import 'widgets/custom_button.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CartViewModel>(
        builder: (controller) => controller.cartProducts.isEmpty
            ? const Center(
                child: Text('Empty Cart..'),
              )
            : Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 16.h, right: 16.w, left: 16.w),
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: Image.network(
                                  controller.cartProducts[index].image,
                                  height: 120.h,
                                  width: 120.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: controller.cartProducts[index].name,
                                    fontSize: 16,
                                  ),
                                  CustomText(
                                    text:
                                        '${controller.cartProducts[index].price} S.P',
                                    fontSize: 16,
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  Container(
                                    height: 30.h,
                                    width: 95.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.r),
                                      color: Colors.grey.shade300,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            child: const Icon(
                                              Icons.add,
                                              size: 20,
                                            ),
                                            onTap: () {
                                              controller
                                                  .increaseQuantity(index);
                                            },
                                          ),
                                          CustomText(
                                            text: controller
                                                .cartProducts[index].quantity
                                                .toString(),
                                            fontSize: 16,
                                            alignment: Alignment.center,
                                          ),
                                          GestureDetector(
                                            child: const Icon(
                                              Icons.remove,
                                              size: 20,
                                            ),
                                            onTap: () {
                                              controller.decreaseQuantity(
                                                  index,
                                                  controller.cartProducts[index]
                                                      .image);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 16.h,
                        ),
                        itemCount: controller.cartProducts.length,
                      ),
                    ),
                  ),
                  Material(
                    elevation: 12,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 17.h),
                      height: 84.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                text: 'TOTAL',
                                fontSize: 12,
                              ),
                              CustomText(
                                text: '${controller.totalPrice.toString()} S.P',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50.h,
                            width: 146.w,
                            child: CustomButton(
                              text: 'CHECKOUT',
                              onPressed: () {
                                Get.to(() => CheckoutView());
                              },
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
