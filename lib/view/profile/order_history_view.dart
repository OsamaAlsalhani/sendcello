import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supercellostore/constance.dart';
import 'package:supercellostore/core/view&model/checkout_viewmodel.dart';
import 'package:supercellostore/model/checkout_model.dart';
import '../widgets/custom_text.dart';

class OrderHistoryView extends StatelessWidget {
  OrderHistoryView({Key? key}) : super(key: key);
  final CheckoutViewModel controller = Get.put(CheckoutViewModel());

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
                    text: 'Order History',
                    fontSize: 20,
                    alignment: Alignment.bottomCenter,
                  ),
                  Container(
                    width: 24,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.separated(
                itemBuilder: (context, index) {
                  return OrderCard(
                    checkoutModel: controller.checkouts[index],
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  thickness: 1,
                  color: Colors.grey.shade200,
                ),
                itemCount: controller.checkouts.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final CheckoutModel checkoutModel;

  const OrderCard({super.key, required this.checkoutModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: checkoutModel.date,
                    color: Colors.grey,
                  ),
                  checkoutModel.isAccepted
                      ? CustomText(
                          text: 'Delivered',
                          color: Colors.green.shade300,
                        )
                      : CustomText(
                          text: 'Pending',
                          color: Colors.red.shade300,
                        ),
                ],
              ),
              Divider(
                thickness: 1,
                color: Colors.grey.shade200,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: checkoutModel.products.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.network(
                            checkoutModel.products[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text:
                                  '${checkoutModel.products[index].name} x ${checkoutModel.products[index].quantity}',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
              Divider(
                thickness: 1,
                color: Colors.grey.shade200,
              ),
              CustomText(
                text: checkoutModel.name,
                color: primaryColor,
              ),
              CustomText(
                text: checkoutModel.phone,
                color: primaryColor,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey.shade200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    text: 'Total Billed',
                    color: Colors.blueGrey,
                  ),
                  CustomText(
                    text: '${checkoutModel.totalPrice} S.P',
                    color: primaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
