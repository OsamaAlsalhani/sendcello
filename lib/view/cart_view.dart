import 'package:flutter/material.dart';
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
            ? const CustomText(
                text: 'Empty Cart',
                alignment: Alignment.center,
              )
            : Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 16, right: 16, left: 16),
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  controller.cartProducts[index].image,
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 30),
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
                                  const SizedBox(height: 16),
                                  Container(
                                    height: 30,
                                    width: 95,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Colors.grey.shade300,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
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
                                            color: Colors.amber,
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
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 16,
                        ),
                        itemCount: controller.cartProducts.length,
                      ),
                    ),
                  ),
                  Material(
                    elevation: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 17),
                      height: 84,
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
                            height: 50,
                            width: 146,
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
