import 'package:flutter/material.dart';
import 'package:flutter_starter/core/themes/palette.dart';

class NText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign alignment;
  final int lines;

  const NText.headingOne(this.text,
      {super.key, TextAlign align = TextAlign.start, int maxLines = 2})
      : style = heading1Style,
        lines = maxLines,
        alignment = align;
  const NText.headingTwo(this.text,
      {super.key, TextAlign align = TextAlign.start, int maxLines = 2})
      : style = heading2Style,
        lines = maxLines,
        alignment = align;
  const NText.headingThree(this.text,
      {super.key, TextAlign align = TextAlign.start, int maxLines = 2})
      : style = heading3Style,
        lines = maxLines,
        alignment = align;
  const NText.headline(this.text,
      {super.key, TextAlign align = TextAlign.start, int maxLines = 2})
      : style = headlineStyle,
        lines = maxLines,
        alignment = align;
  const NText.subheading(this.text,
      {super.key, TextAlign align = TextAlign.start, int maxLines = 2})
      : style = subheadingStyle,
        lines = maxLines,
        alignment = align;
  const NText.caption(this.text,
      {super.key,
      TextAlign align = TextAlign.start,
      int maxLines = 2,
      Color color = Palette.kcMediumGreyColor})
      : style = captionStyle,
        lines = maxLines,
        alignment = align;
  const NText.custom(this.text,
      {super.key,
      TextStyle textStyle = bodyStyle,
      alignment = TextAlign.start,
      int maxLines = 2})
      : style = textStyle,
        lines = maxLines,
        alignment = alignment ?? TextAlign.start;

  NText.boldCaption(this.text,
      {super.key,
      TextAlign align = TextAlign.start,
      Color color = Palette.kcMediumGreyColor,
      int maxLines = 2,
      double fontSize = 12})
      : style = TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: FontWeight.w700,
        ),
        lines = maxLines,
        alignment = align;

  NText.body(this.text,
      {super.key,
      Color color = Palette.kcMediumGreyColor,
      int maxLines = 2,
      TextAlign align = TextAlign.start})
      : style = bodyStyle.copyWith(color: color),
        lines = maxLines,
        alignment = align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      textAlign: alignment,
    );
  }
}

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

const TextStyle bodyStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

const TextStyle subheadingStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w400,
);

const TextStyle captionStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
);

const TextStyle boldCaptionStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w700,
);
