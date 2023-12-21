import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextAlign alignment;

  const MyText.headingOne(this.text,
      {super.key, TextAlign align = TextAlign.start, this.color})
      : style = heading1Style,
        alignment = align;
  const MyText.headingTwo(this.text,
      {super.key, TextAlign align = TextAlign.start, this.color})
      : style = heading2Style,
        alignment = align;
  const MyText.headingThree(this.text,
      {super.key, TextAlign align = TextAlign.start, this.color})
      : style = heading3Style,
        alignment = align;
  const MyText.headline(this.text,
      {super.key, TextAlign align = TextAlign.start, this.color})
      : style = headlineStyle,
        alignment = align;
  const MyText.subheading(this.text,
      {super.key, TextAlign align = TextAlign.start, this.color})
      : style = subheadingStyle,
        alignment = align;
  const MyText.caption(this.text,
      {super.key, TextAlign align = TextAlign.start, this.color})
      : style = captionStyle,
        alignment = align;
  const MyText.largeCaption(this.text,
      {super.key, TextAlign align = TextAlign.start, this.color})
      : style = largeCaptionStyle,
        alignment = align;
  const MyText.smallCaption(this.text,
      {super.key, TextAlign align = TextAlign.start, this.color})
      : style = smallCaptionStyle,
        alignment = align;

  MyText.body(this.text,
      {super.key, TextAlign align = TextAlign.start, this.color})
      : style = bodyStyle.copyWith(color: color),
        alignment = align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(color: color),
      textAlign: alignment,
    );
  }
}

// To make it clear which weight we are using, we'll define the weight even for regular
// fonts
const TextStyle heading1Style = TextStyle(
  fontSize: 34,
  fontWeight: FontWeight.w400,
);

const TextStyle heading2Style = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.w600,
);

const TextStyle heading3Style = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w600,
);

const TextStyle headlineStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.w700,
);

const TextStyle subheadingStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w400,
);

const TextStyle bodyStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

const TextStyle largeCaptionStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
);

const TextStyle captionStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
);

const TextStyle smallCaptionStyle = TextStyle(
  fontSize: 10,
  fontWeight: FontWeight.w400,
);
