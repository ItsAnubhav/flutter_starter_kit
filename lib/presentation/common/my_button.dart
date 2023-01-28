import 'package:flutter/material.dart';
import 'package:flutter_starter/core/themes/palette.dart';
import 'package:flutter_starter/core/utility/ColorUtils.dart';

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
  final int percentage;

  MyButton({
    required this.text,
    required this.onTap,
    this.width = double.infinity,
    this.backgroundColor = Palette.primaryColor,
    this.textColor = Colors.white,
    this.percentage = 100,
    this.padding = const EdgeInsets.all(10.0),
    this.margin = EdgeInsets.zero,
    this.shadowColor,
    this.borderRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        margin: margin,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: InkWell(
          onTap: (){
            if(percentage != 100){
              print("Please wait. Button is disabled while content is loading");
              return;
            }
            onTap();
            print("Click action");
          },
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child:
                TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  tween: Tween<double>(
                    begin: 0,
                    end: percentage/100,
                  ),
                  builder: (context, value, _) =>
                      LinearProgressIndicator(
                        minHeight: 50,
                        value: value,
                        color: Palette.primaryColor,
                        backgroundColor: ColorUtils.lighten(Palette.primaryColor),
                      ),
                ),
              ),
              Center(
                  child: Text(text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ))),
            ],
          ),
        ),
      );
  }
}
