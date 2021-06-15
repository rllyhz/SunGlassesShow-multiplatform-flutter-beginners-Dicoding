import 'package:flutter/material.dart';

TextStyle getResponsiveTextStyle(fontSize) => TextStyle(
      fontSize: fontSize,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );

double getResponsiveDimension(BuildContext ctx, double initialValue) {
  final width = MediaQuery.of(ctx).size.width;

  if (width < 600) {
    return initialValue + 4.0;
  } else if (width < 900) {
    return initialValue + 8.0;
  } else {
    return initialValue + 12.0;
  }
}

double getResponsiveLongDimension(BuildContext ctx, double min, double max) {
  var actualWidth = (MediaQuery.of(ctx).size.width / 6.0) + 32.0;

  if (actualWidth < min) {
    actualWidth = min;
  } else if (actualWidth > max) {
    actualWidth = max;
  }

  return actualWidth;
}
