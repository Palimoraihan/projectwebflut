import 'package:flutter/material.dart';

import 'package:palimo_portfolio_web/mobile_pages/my_detail_mobile.dart';
import 'package:palimo_portfolio_web/web_pages/my_detail_web.dart';

class MainDetail extends StatelessWidget {
  static const routeNamed='detail-project';
  const MainDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff201F1F),
      body: SafeArea(child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
        if(constraints.maxWidth>= 800){
          return MyDetailWeb() ;
        }else{
          return MyDetailMobile();
        }
      })),
    );
  }
}