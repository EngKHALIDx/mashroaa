import 'package:flutter/material.dart';
import 'package:mashroaa/NAVIGATION/size_config.dart';

double animatedPositionedLEftValue(int currentIndex) {
  switch (currentIndex) {
    case 0:
      return AppSizes.blockSizeHorizontal * 5.5;
    case 1:
      return AppSizes.blockSizeHorizontal * 22.5;
    case 2:
      return AppSizes.blockSizeHorizontal * 39.5;
    case 3:
      return AppSizes.blockSizeHorizontal * 56.5;
    case 4:
      return AppSizes.blockSizeHorizontal * 73.5;
    default:
      return 0;
  }
}

final List<Color> gradient = [
  Color.fromARGB(255, 85, 42, 123).withOpacity(0.8),
  Color.fromARGB(255, 143, 72, 174).withOpacity(0.5),
  Colors.deepPurpleAccent
];
