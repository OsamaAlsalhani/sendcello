import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomText extends StatefulWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final Alignment alignment;
  final int? maxLines;
  final double? height;

  const CustomText({
    Key? key,
    this.text = '',
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.color,
    this.alignment = Alignment.topLeft,
    this.maxLines,
    this.height,
  }) : super(key: key);

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: widget.alignment,
      child: Text(
        widget.text.tr,
        style: TextStyle(
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight,
          color: widget.color,
          height: widget.height,
        ),
        maxLines: widget.maxLines,
      ),
    );
  }
}
