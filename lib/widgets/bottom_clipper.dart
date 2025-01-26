import 'package:flutter/material.dart';

class BottomRightClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const double clipHeight = 50;
    const double clipWidth = 120;
    const double cornerRadius = 20;

    final Path path = Path();

    // Start at the top-left corner
    path.moveTo(cornerRadius, 0);

    // Top-left rounded corner
    path.arcToPoint(
      Offset(0, cornerRadius),
      radius: const Radius.circular(cornerRadius),
      clockwise: false,
    );

    // Left edge
    path.lineTo(0, size.height - cornerRadius);

    // Bottom-left rounded corner
    path.arcToPoint(
      Offset(cornerRadius, size.height),
      radius: const Radius.circular(cornerRadius),
      clockwise: false,
    );

    // Bottom edge until the clipped area
    path.lineTo(size.width - clipWidth - 30, size.height);

    // Top of the bottom-right rounded edge
    path.arcToPoint(
      Offset(size.width - clipWidth, size.height - cornerRadius),
      radius: const Radius.circular(cornerRadius),
      clockwise: false,
    );

    // **Concave curve for the third edge of the clip (opposite direction)**
    path.arcToPoint(
      Offset(size.width - clipWidth + cornerRadius, size.height - clipHeight),
      radius: const Radius.circular(cornerRadius),
      clockwise: true,
    );

    // Right side of the clipped area
    path.lineTo(size.width - cornerRadius, size.height - clipHeight);

    // Bottom-right rounded corner
    path.arcToPoint(
      Offset(size.width, size.height - clipHeight - cornerRadius),
      radius: const Radius.circular(cornerRadius),
      clockwise: false,
    );

    // Right edge
    path.lineTo(size.width, cornerRadius);

    // Top-right rounded corner
    path.arcToPoint(
      Offset(size.width - cornerRadius, 0),
      radius: const Radius.circular(cornerRadius),
      clockwise: false,
    );

    // Top edge
    path.lineTo(cornerRadius, 0);

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
