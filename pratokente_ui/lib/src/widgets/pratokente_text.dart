import 'package:flutter/material.dart';
import 'package:pratokente_ui/src/shared/app_colors.dart';
import 'package:pratokente_ui/src/shared/styles.dart';

class PratokenteText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign alignment;

  const PratokenteText.headingOne(this.text,
      {TextAlign align = TextAlign.start})
      : style = heading1Style,
        alignment = align;
  const PratokenteText.headingTwo(this.text,
      {TextAlign align = TextAlign.start})
      : style = heading2Style,
        alignment = align;
  const PratokenteText.headingThree(this.text,
      {TextAlign align = TextAlign.start})
      : style = heading3Style,
        alignment = align;

  const PratokenteText.headingLogin(this.text,
      {TextAlign align = TextAlign.left})
      : style = headingLogin,
        alignment = align;

  const PratokenteText.headline(this.text, {TextAlign align = TextAlign.start})
      : style = headlineStyle,
        alignment = align;
  const PratokenteText.subheading(this.text,
      {TextAlign align = TextAlign.start})
      : style = subheadingStyle,
        alignment = align;
  const PratokenteText.caption(this.text, {TextAlign align = TextAlign.start})
      : style = captionStyle,
        alignment = align;

  const PratokenteText.book(this.text, {TextAlign align = TextAlign.start})
      : style = bookStyle,
        alignment = align;

  PratokenteText.body(this.text,
      {Color color = kcMediumGreyColor, TextAlign align = TextAlign.start})
      : style = bodyStyleSofia.copyWith(color: color),
        alignment = align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: alignment,
    );
  }
}
