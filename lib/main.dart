import 'package:flutter/material.dart';
import 'package:palimo_portfolio_web/conection_error.dart';
import 'package:palimo_portfolio_web/detail_error.dart';
import 'package:palimo_portfolio_web/main_dashboard.dart';
import 'package:palimo_portfolio_web/main_detail.dart';
import 'package:palimo_portfolio_web/mobile_pages/my_dashboard_mobile.dart';
import 'package:palimo_portfolio_web/provider/my_provider.dart';
import 'package:palimo_portfolio_web/services/api_services.dart';
import 'package:palimo_portfolio_web/web_pages/my_dashboard_web.dart';
import 'package:palimo_portfolio_web/web_pages/my_detail_web.dart';
import 'package:palimo_portfolio_web/web_pages/widget/costume_transition.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyProvider>(
            create: (_) => MyProvider(apiService: ApiService()))
      ],
      child: MaterialApp(
        builder: (context, widget) {
          Widget error =  DetailError();
          if (widget is Scaffold || widget is Navigator) {
            error = Scaffold(body: Center(child: error));
          }
          ErrorWidget.builder = (errorDetails) => error;
          if (widget != null) return widget;
          throw ('widget is null');
        },
        title: 'Palimo R',
        theme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Poppins',
            primarySwatch: Colors.green,
            primaryColor: Color(0xff37B75B),
            accentColor: Color(0xff37B75B)),
        initialRoute: 
        MainDashboard.roteNamed,
        // MyDashBoardWeb.roteNamed,
        onGenerateRoute: (routes) => onGanereteRutes(routes),
      ),
    );
  }

  static Route onGanereteRutes(RouteSettings settings) {
    switch (settings.name) {
      case MainDetail.routeNamed:
        return CostumeTransition(child: MainDetail(), settings: settings);
      case MainDashboard.roteNamed:
      default:
        return MaterialPageRoute(
            builder: (context) => MainDashboard(), settings: settings);
    }
  }
}
