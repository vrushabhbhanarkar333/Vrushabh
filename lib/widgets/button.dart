import 'package:flutter/material.dart';
import 'package:ftfl_ui/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final double height;
  final double width;
  final double borderRadius;
  final Color textColor;
  final Color borderColor;

  const CustomButton({
    Key? key,
    required this.text,
    this.textColor = AppColors.primaryColor,
    this.color = AppColors.secondaryColor,
    this.height = 40,
    this.width = 100,
    this.borderRadius = 15,
    this.borderColor = Colors
        .transparent, // Default to transparent if no border color is provided
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: Colors.black45, // Border color
            width: 0.5, // Border width
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
