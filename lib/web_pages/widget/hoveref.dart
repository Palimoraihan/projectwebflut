import 'package:flutter/cupertino.dart';

class HoverEf extends StatefulWidget {
  
  final Widget Function(bool isHovered) builder;
  HoverEf({super.key, required this.builder,});

  @override
  State<HoverEf> createState() => _HoverEfState();
}

class _HoverEfState extends State<HoverEf> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: widget.builder(isHover),
    );
  }

  void onEntered(bool isHover) {
    setState(() {
      this.isHover = isHover;
    });
  }
}
