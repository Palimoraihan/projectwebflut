
import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  final double marginTop;
  final double top;
  final double left;
  final double sizeHight;
  final double sizeWidth;
  final double circle;
  final int colorNum;
  final Color colors;
  final double opacity;

  const CircleContainer(
      {super.key,
      required this.top,
      required this.left,
      required this.sizeHight,
      required this.sizeWidth,
      required this.circle, required this.colors, required this.colorNum, required this.opacity, required this.marginTop});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(seconds: 2),
      top: top,
      left: left,
      child: Container(
        margin: EdgeInsets.only(top: marginTop),
        height: sizeHight,
        width: sizeWidth,
        decoration: BoxDecoration(
          color: Colors.green[colorNum]!.withOpacity(opacity),
          borderRadius: BorderRadius.circular(circle),
        ),
      ),
    );
  }
}
