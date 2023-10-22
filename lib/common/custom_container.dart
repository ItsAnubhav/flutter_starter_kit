import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  final double padding;
  final double minHeight;
  final double width;
  final double margin;
  final double borderWidth;
  final double elevation;
  final Color borderColor;
  final Color backgroundColor;
  final double borderRadius;
  final Color shadowColor;

  const CustomContainer({
    super.key,
    required this.child,
    this.onTap,
    this.minHeight = 0,
    this.width = double.infinity,
    this.margin = 12,
    this.borderColor = Colors.transparent,
    this.elevation = 0,
    this.borderWidth = 0,
    this.shadowColor = Colors.grey,
    this.padding = 10,
    this.borderRadius = 5,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      constraints: BoxConstraints(
        minHeight: minHeight,
      ),
      margin: EdgeInsets.all(margin),
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: padding == 0 ? Colors.transparent : backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: borderWidth != 0
              ? Border.all(color: borderColor, width: borderWidth)
              : null,
          boxShadow: shadowColor == Colors.transparent
              ? []
              : [
                  BoxShadow(
                    color: shadowColor.withOpacity(0.5),
                    blurRadius: 20,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ]),
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
