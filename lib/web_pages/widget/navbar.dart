import 'package:flutter/material.dart';
import 'package:palimo_portfolio_web/web_pages/widget/hoveref.dart';


class Navbar extends StatelessWidget {
  VoidCallback toProject;
  VoidCallback toTop;
  double padCostume;
  bool isMouse;
  Navbar({super.key, required this.toProject, required this.toTop,required this.padCostume,required this.isMouse});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff201F1F),
      padding: EdgeInsets.symmetric(horizontal: padCostume),
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: toTop,
            child: Row(
              children: [
                Container(
                  height: 40,
                  child: Image.asset(
                    'assets/images/logoportoweb.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Palimo R',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
         isMouse? HoverEf(
            builder: (isHovered) {
              final color = isHovered ? Colors.white : Colors.grey;
              return InkWell(
                onTap: toProject,
                child: Text(
                  'My Project',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: color),
                ),
              );
            }, 
          ):InkWell(
                onTap: toProject,
                child: Text(
                  'My Project',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.white),
                ),
              )
        ],
      ),
    );
  }
}
