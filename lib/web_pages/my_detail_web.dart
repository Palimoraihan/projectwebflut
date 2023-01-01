import 'package:flutter/material.dart';
import 'package:palimo_portfolio_web/model/my_model.dart';
import 'package:palimo_portfolio_web/web_pages/widget/circle_container.dart';

class MyDetailWeb extends StatefulWidget {
  const MyDetailWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<MyDetailWeb> createState() => _MyDetailWebState();
}

class _MyDetailWebState extends State<MyDetailWeb> {
  final _scrollControl = ScrollController();
  double topBacground1 = 0;
  double topBacground2 = 0;
  double topBacground3 = 0;

  @override
  void dispose() {
    _scrollControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dataProj = ModalRoute.of(context)?.settings.arguments as ItemProject;
    return NotificationListener(
      onNotification: (notif) {
        if (notif is ScrollUpdateNotification) {
          if (notif.scrollDelta == null) return true;
          setState(() {
            topBacground1 -= notif.scrollDelta! / 5;
            topBacground2 -= notif.scrollDelta! / 3;
            topBacground3 -= notif.scrollDelta! / 7;
          });
        }
        return true;
      },
      child: Stack(
        children: [
          CircleContainer(
              marginTop: 200,
              opacity: 1.0,
              colorNum: 500,
              colors: Colors.green,
              top: topBacground1,
              left: 1000,
              sizeHight: 25,
              sizeWidth: 25,
              circle: 40),
          CircleContainer(
              marginTop: 400,
              opacity: 1,
              colorNum: 400,
              colors: Colors.green,
              top: topBacground2,
              left: 1000,
              sizeHight: 65,
              sizeWidth: 65,
              circle: 40),
          CircleContainer(
              marginTop: 300,
              opacity: 0.8,
              colorNum: 300,
              colors: Colors.green,
              top: topBacground3,
              left: 1200,
              sizeHight: 120,
              sizeWidth: 120,
              circle: 60),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Hero(
                    tag: '${dataProj.judul}',
                    child: Text(
                      '${dataProj.judul}',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.green,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          '${dataProj.year}',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, letterSpacing: 1.5),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        '${dataProj.category}',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Hero(
                    tag: '${dataProj.image}',
                    child: Container(
                      height: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: FadeInImage.assetNetwork(
                        height: 400,
                        placeholder: 'assets/images/adds_waiting.jpg',
                        image: '${dataProj.image}',
                        fadeInDuration: Duration(milliseconds: 200),
                        fadeOutDuration: Duration(milliseconds: 200),
                        fit: BoxFit.cover,
                        imageErrorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                          'assets/images/adds_error.jpg',
                          height: 400,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: GridView.builder(
                        itemCount: dataProj.using.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, mainAxisExtent: 30),
                        itemBuilder: (context, index) {
                          var usingData = dataProj.using[index];
                          if (dataProj.using.isEmpty) {
                            return Text('No Using Technolgi');
                          } else {
                            return Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color(0xff37B75B),
                                  minRadius: 5,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  usingData.tech == null
                                      ? '-'
                                      : '${usingData.tech}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      overflow: TextOverflow.clip),
                                ),
                              ],
                            );
                          }
                        }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Hero(
                    tag: '${dataProj.description}',
                    child: Text(
                      '${dataProj.description}',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  SizedBox(height: 50),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
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
                            itemCount: dataProj.detailImages.length,
                            itemBuilder: (context, index) {
                              var detailImege = dataProj.detailImages[index];
                              return Container(
                                margin: EdgeInsets.only(left: 15),
                                height: 150,
                                child: InkWell(
                                  onTap: () {
                                    _costumeDialog(
                                        context, '${detailImege.images}');
                                  },
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
                                    image: '${detailImege.images}',
                                    fit: BoxFit.cover,
                                    fadeInDuration: Duration(milliseconds: 200),
                                    fadeOutDuration:
                                        Duration(milliseconds: 200),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 300,
                  )
                ],
              ),
            ),
          ),
          Container(
            color: Color(0xff201F1F),
            padding: const EdgeInsets.only(
              bottom: 10,
              left: 50,
              top: 10,
            ),
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
      ),
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
                  fit: BoxFit.cover,
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
