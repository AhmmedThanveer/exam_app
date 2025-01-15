import 'package:flutter/material.dart';
import 'package:sample_quiz/Utill/colors.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;

  const MyButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textStyle,
    this.padding,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenW = MediaQuery.of(context).size.width;
    final double screenH = MediaQuery.of(context).size.height;

    return SizedBox(
      width: screenW,
      child: FilledButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              backgroundColor ?? Theme.of(context).primaryColor),
          padding: MaterialStateProperty.all(padding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
            ),
          ),
        ),
        child: Text(
          text,
          style: textStyle ??
              TextStyle(
                color: Util().whiteColor,
                fontFamily: "Baloo Semibold",
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
