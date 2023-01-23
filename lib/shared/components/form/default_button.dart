import 'package:flutter/material.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/constants/styles/styles.dart';

class DefaultButton extends StatelessWidget {
  final double width;
  final Color background;
  final bool isUpperCase;
  final double radius;
  final Border? border;
  final VoidCallback function;
  final String text;
  final bool isText;
  final Color textColors;
  final double textFontSize;
  final FontWeight textFontWeight;
  const DefaultButton({
    Key? key,
    this.border,
    this.width = double.infinity,
    this.background = Colors.blue,
    this.radius = 0.0,
    this.isText = false,
    this.isUpperCase = true,
    this.textColors = Colors.black,
    this.textFontSize = 14,
    this.textFontWeight= FontWeight.normal,
    required this.function,
    required this.text
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return conditionalBuilder(
        condition: isText,
        builder: TextButton(
            onPressed: function,
            child: Text(
                text.toUpperCase(),
                style: TextStyle(
                  color: textColors,
                  fontSize: textFontSize,
                  fontWeight: textFontWeight
                ),
            )
        ),
        fallback: Container(
          width: width,
          height: height_40,
          decoration: BoxDecoration(
            border: border,
            borderRadius: BorderRadius.circular(radius),
            color: background,
          ),
          child: MaterialButton(
            onPressed: function,
            child: Text(
              isUpperCase ? text.toUpperCase() : text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        )
    );
  }
}



