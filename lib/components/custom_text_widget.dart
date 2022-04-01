import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(
      {Key? key,
      required this.message,
      required this.property,
      required this.style})
      : super(key: key);

  final String? message;
  final String? property;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      property == null ? "Loading..." : "$message",
      style: style,
    );
  }
}
