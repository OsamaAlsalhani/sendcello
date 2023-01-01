import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/icons/$image.png',
              fit: BoxFit.cover,
              height: 20,
              width: 20,
            ),
            CustomText(
              text: title,
              fontSize: 14,
            ),
            Container(width: 20),
          ],
        ),
      ),
    );
  }
}
