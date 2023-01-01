import 'package:flutter/material.dart';
import 'package:palimo_portfolio_web/mobile_pages/my_dashboard_mobile.dart';
import 'package:palimo_portfolio_web/web_pages/my_dashboard_web.dart';

class MainDashboard extends StatelessWidget {
  static const roteNamed = 'my-dashboard';
  const MainDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff201F1F),
      body: SafeArea(child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth >= 800) {
          return MyDashBoardWeb();
        } else {
          return  MyDashboardMobile();
        }
      })),
    );
  }
}
