import 'package:flutter/material.dart';
import 'package:palimo_portfolio_web/main_dashboard.dart';


class DetailError extends StatelessWidget {
  const DetailError({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(margin: EdgeInsets.only(top: 230),alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              height: 150,
              child: Image.asset('assets/images/vectorsignal.png')),
            SizedBox(
              height: 10,
            ),
            Text('Oops sorry, check your connection'),
            SizedBox(height: 10,),
            IconButton(onPressed: (){
              Navigator.pushNamed(context, MainDashboard.roteNamed);
            }, icon: Icon(Icons.refresh))
          ],
        ),
      ),
    );
  }
}
