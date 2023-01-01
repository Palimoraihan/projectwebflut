import 'dart:async';
import 'package:flutter/material.dart';
import 'package:palimo_portfolio_web/model/my_model.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDescriptionMobile extends StatelessWidget {
  MyModel descrip;
  MyDescriptionMobile({super.key,required this.descrip});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hi, I\'m',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Color(0xff37B75B))),
          Text(
            'Palimo Raihan Safaat',
            style: Theme.of(context).textTheme.headline4!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2.5),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
              '${descrip.mydesc}',
              style: Theme.of(context).textTheme.bodyText2,
              ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: ElevatedButton(
                  onPressed: () {
                     final Uri url3 =
                                  Uri.parse('mailto:palimosrehans@gmail.com?');
                              _openApp(url: url3);
                  },
                  child: Text(
                    'Contact Me',
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              ),
              SizedBox(
                width: 50,
              ),
              InkWell(
                onTap: () {
                  final Uri url2 =
                      Uri.parse('https://www.instagram.com/palimo_rs/');
                  _openApp(url: url2);
                },
                child: Container(
                  height: 25,
                  child: Image.asset('assets/icons/instagram_icon.png'),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  final Uri url1 = Uri.parse(
                      'https://www.linkedin.com/in/palimo-raihan-s-8a593120a/');
                  _openApp(url: url1);
                },
                child: Container(
                  height: 25,
                  child: Image.asset('assets/icons/linkedin_icon.png'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            '\" do anything you can\ "',
            style: TextStyle(fontSize: 14, color: Color(0xff37B75B)),
          ),
        ],
      ),
    );
  }
}

Future<void> _openApp({required Uri url}) async {
  if (!await launchUrl(url)) {
    throw 'eror';
  }
}
