import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supercellostore/core/view&model/checkout_viewmodel.dart';
import 'package:supercellostore/core/view&model/profile_viewmodel.dart';
import 'package:supercellostore/view/profile/order_card.dart';
import '../widgets/custom_text.dart';

class OrderHistoryView extends StatelessWidget {
  OrderHistoryView({Key? key}) : super(key: key);
  final CheckoutViewModel controller = Get.put(CheckoutViewModel());
  final String userId = Get.find<ProfileViewModel>().currentUser!.userId;

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
            child: GetBuilder<CheckoutViewModel>(
              init: CheckoutViewModel(),
              builder: (controller) => ListView.builder(
                itemCount: controller.checkouts
                    .where((order) => order.userId == userId)
                    .length,
                itemBuilder: (context, index) => OrderCard(
                    checkoutModel: controller.checkouts
                        .where((order) => order.userId == userId)
                        .toList()[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
