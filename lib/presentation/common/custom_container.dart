import 'package:flutter/material.dart';
import 'package:flutter_starter/core/themes/palette.dart';

class CustomContainer extends StatelessWidget {

  final VoidCallback? onTap;
  final Widget child;
  final double padding;
  final double height;
  final double width;
  final EdgeInsets margin;
  final double borderWidth;
  final double elevation;
  final Color borderColor;
  final Color backgroundColor;
  final double borderRadius;
  final Color shadowColor;

  const CustomContainer({
    required this.child,
    this.onTap,
    this.height = 50,
    this.width = double.infinity,
    this.margin = EdgeInsets.zero,
    this.borderColor = Colors.transparent,
    this.elevation = 0,
    this.borderWidth = 1,
    this.shadowColor = Colors.transparent,
    this.padding = 10,
    this.borderRadius = 5,
    this.backgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Card(
        shape: RoundedRectangleBorder(
          side: borderColor != null
              ? BorderSide(color: borderColor,width: borderWidth)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        color: backgroundColor,
        elevation: elevation,
        margin: margin,
        shadowColor: shadowColor,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: child,
          ),
        ),
      ),
    );
  }
}