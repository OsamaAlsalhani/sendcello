import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supercellostore/view/widgets/custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final VoidCallback onPressedFn;
  final String image;
  final String title;

  const CustomButtonSocial({
    Key? key,
    required this.onPressedFn,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressedFn,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 30.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/icons/$image.png',
              fit: BoxFit.cover,
              height: 20.h,
              width: 20.h,
            ),
            CustomText(
              text: title,
              fontSize: 14,
            ),
            Container(width: 20.h),
          ],
        ),
      ),
    );
  }
}
