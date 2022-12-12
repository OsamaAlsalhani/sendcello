// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;

  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(12), color: color),
      child: TextButton(
        onPressed: onPressed,
        child: CustomText(
          text: text,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
/*FlatButton(
        
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: primaryColor,
        child: 
      ),*/