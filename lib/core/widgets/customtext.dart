import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textalign;

  const CommonText(
    this.text, {
    super.key,
    this.style,
    this.textalign
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign:textalign,
      style: style,
    );
  }
}