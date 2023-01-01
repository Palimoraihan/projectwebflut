import 'package:flutter/cupertino.dart';

class ProfileImage extends StatelessWidget {
  final double top;
  final double left;
  final double sizeHight;
  final double sizeWidth;

  final String image;
  const ProfileImage(
      {super.key,
      required this.top,
      required this.left,
      required this.sizeHight,
      
      required this.image, required this.sizeWidth});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(seconds: 1),
      top: top,
      left: left,
      child: Container(
        height: sizeHight,
        width: sizeWidth,
        child: ClipRRect(
            child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),borderRadius: BorderRadius.circular(10),),
      ),
    );
  }
}
