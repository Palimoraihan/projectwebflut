import 'package:flutter/material.dart';

class SkillInfoMobile extends StatelessWidget {
  final String title;
  final double top;
  final double opacity;
  final String text;
  final IconData icon;
  const SkillInfoMobile(
      {super.key, required this.title, required this.text, required this.icon, required this.top, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 700),
            top: top,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 700),
              opacity: opacity,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff323232),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 180,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        icon,
                        size: 22,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Text(text,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                color: Colors.grey,
                              )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
