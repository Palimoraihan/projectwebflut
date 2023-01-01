import 'package:flutter/material.dart';
import 'package:palimo_portfolio_web/main_dashboard.dart';
import 'package:palimo_portfolio_web/provider/my_provider.dart';
import 'package:palimo_portfolio_web/services/api_services.dart';
import 'package:provider/provider.dart';

class ConnectionError extends StatelessWidget {
  const ConnectionError({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 230),
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
                height: 150,
                child: Image.asset('assets/images/vectorsignal.png')),
            SizedBox(
              height: 10,
            ),
            Text('Oops sorry, check your connection'),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
