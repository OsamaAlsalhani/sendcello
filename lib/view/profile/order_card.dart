import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supercellostore/model/checkout_model.dart';
import 'package:supercellostore/view/widgets/custom_text.dart';

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
                  ),
                  checkoutModel.isAccepted
                      ? const CustomText(
                          text: 'Delivered',
                        )
                      : const CustomText(
                          text: 'Pending',
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
              ),
              CustomText(
                text: checkoutModel.phone,
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
                  ),
                  CustomText(
                    text: '${checkoutModel.totalPrice} S.P',
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
