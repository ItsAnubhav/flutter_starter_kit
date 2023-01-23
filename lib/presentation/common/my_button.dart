import 'package:flutter/material.dart';
import 'package:flutter_starter/core/themes/palette.dart';
import 'package:flutter_starter/presentation/common/custom_container.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final EdgeInsets padding;
  final Color backgroundColor;
  final Color textColor;
  final Color? shadowColor;
  final double width;
  final EdgeInsets margin;
  final double borderRadius;

  MyButton({
    required this.text,
    required this.onTap,
    this.width = double.infinity,
    this.backgroundColor = Palette.primaryColor,
    this.textColor = Colors.white,
    this.padding = const EdgeInsets.all(10.0),
    this.margin = EdgeInsets.zero,
    this.shadowColor,
    this.borderRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 50,
        margin: margin,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius)
        ),
        child: Center(child: Text(text,style: TextStyle(
          color: textColor,
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),)),
      ),
    );
  }
}