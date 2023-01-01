import 'package:flutter/material.dart';

import '../model/my_model.dart';

class MyDetailMobile extends StatefulWidget {
  MyDetailMobile({super.key});

  @override
  State<MyDetailMobile> createState() => _MyDetailMobileState();
}

class _MyDetailMobileState extends State<MyDetailMobile> {
  final _scrollControl = ScrollController();

  @override
  void dispose() {
    _scrollControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _dataProj = ModalRoute.of(context)?.settings.arguments as ItemProject;
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),
                Hero(
                  tag: '${_dataProj.judul}',
                  child: Text(
                    '${_dataProj.judul}',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.green,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          '${_dataProj.year}',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, letterSpacing: 1.5),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        '${_dataProj.category}',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontSize: 16, overflow: TextOverflow.fade),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Hero(
                  tag: '${_dataProj.image}',
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/image_waiting.jpg',
                      imageErrorBuilder: (context, error, stackTrace) =>
                          Image.asset(
                        'assets/images/image_error.jpg',
                        fit: BoxFit.cover,
                      ),
                      height: 300,
                      image: '${_dataProj.image}',
                      fit: BoxFit.cover,
                      fadeInDuration: Duration(milliseconds: 200),
                      fadeOutDuration: Duration(milliseconds: 200),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  child: GridView.builder(
                      itemCount: _dataProj.using.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, mainAxisExtent: 30),
                      itemBuilder: (context, index) {
                        var usingData = _dataProj.using[index];
                        if (_dataProj.using.isEmpty) {
                          return Text('No Using Technolgi');
                        } else {
                          return Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Color(0xff37B75B),
                                minRadius: 3,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                usingData.tech == null
                                    ? '-'
                                    : '${usingData.tech}',
                                style: TextStyle(
                                    fontSize: 16, overflow: TextOverflow.clip),
                              ),
                            ],
                          );
                        }
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '${_dataProj.description}',
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1,
                    height: 180,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          scrollbarTheme: ScrollbarThemeData(
                              thumbColor:
                                  MaterialStateProperty.all(Colors.black),
                              crossAxisMargin: 8)),
                      child: Scrollbar(
                        thumbVisibility: true,
                        controller: _scrollControl,
                        child: ListView.builder(
                          controller: _scrollControl,
                          padding: EdgeInsets.only(left: 10),
                          scrollDirection: Axis.horizontal,
                          itemCount: _dataProj.detailImages.length,
                          itemBuilder: (context, index) {
                            var _detailImage = _dataProj.detailImages[index];
                            return InkWell(
                              onTap: () {
                                _costumeDialog(
                                    context, '${_detailImage.images}');
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 15),
                                height: 150,
                                width: MediaQuery.of(context).size.width / 2,
                                child: FadeInImage.assetNetwork(
                                  placeholder:
                                      'assets/images/image_waiting.jpg',
                                  imageErrorBuilder:
                                      (context, error, stackTrace) =>
                                          Image.asset(
                                    'assets/images/image_error.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                  height: 150,
                                  width: MediaQuery.of(context).size.width / 2,
                                  image: '${_detailImage.images}',
                                  fit: BoxFit.cover,
                                  fadeInDuration: Duration(milliseconds: 200),
                                  fadeOutDuration: Duration(milliseconds: 200),
                                ),
                                
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
        Container(
          color: Color(0xff201F1F),
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back),
              ),
              SizedBox(
                width: 15,
              ),
              Row(
                children: [
                  Container(
                    height: 40,
                    child: Image.asset(
                      'assets/images/logoportoweb.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    'Palimo R',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

void _costumeDialog(BuildContext context, String imageItem) => showDialog(
    context: context,
    builder: (context) => Dialog(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.5,
                child: Image.network(
                  imageItem,
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black.withOpacity(0.5),
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
              )
            ],
          ),
        ));
