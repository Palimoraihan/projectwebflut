import 'package:flutter/material.dart';
import 'package:palimo_portfolio_web/conection_error.dart';
import 'package:palimo_portfolio_web/model/my_model.dart';
import 'package:palimo_portfolio_web/provider/my_provider.dart';
import 'package:palimo_portfolio_web/web_pages/widget/my_decription.dart';
import 'package:palimo_portfolio_web/web_pages/widget/my_project.dart';
import 'package:palimo_portfolio_web/web_pages/widget/navbar.dart';
import 'package:palimo_portfolio_web/web_pages/widget/profile_image.dart';
import 'package:palimo_portfolio_web/web_pages/widget/skill_info.dart';

import 'package:provider/provider.dart';

class MyDashBoardWeb extends StatefulWidget {
  const MyDashBoardWeb({super.key});

  @override
  State<MyDashBoardWeb> createState() => _MyDashBoardWebState();
}

class _MyDashBoardWebState extends State<MyDashBoardWeb> {
  TextEditingController controllertxt = TextEditingController();
  final itemKey = GlobalKey();
  final itemKey2 = GlobalKey();
  ScrollController? _sControler;
  double pixel = 0.0;

  @override
  void initState() {
    super.initState();
    _sControler = ScrollController();
    _sControler!.addListener(() {
      setState(() {
        pixel = _sControler!.position.pixels;
        print(_sControler!.position.pixels);
      });
    });
  }

  Future scrollItem2() async {
    final context2 = itemKey2.currentContext;
    await Scrollable.ensureVisible(context2!,
        alignment: 0.5, duration: Duration(seconds: 5));
  }

  Future scrollItem() async {
    final context = itemKey.currentContext;

    final context2 = itemKey2.currentContext;
    await Scrollable.ensureVisible(context!,
        alignment: 0.2, duration: Duration(seconds: 5));
  }

  @override
  Widget build(BuildContext context) {
    final serchProvider = Provider.of<MyProvider>(context);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Stack(
        children: [
          SingleChildScrollView(
            controller: _sControler,
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      margin: EdgeInsets.only(left: 100),
                      child: TextField(
                        controller: controllertxt,
                        onChanged: serchProvider.searchData,
                        decoration: InputDecoration(

                            hintText: 'Search Project'),
                      ),
                    ),
                  ],
                ),
                if (serchProvider.search.length != 0 ||
                    controllertxt.text.isNotEmpty)
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: serchProvider.search.length,
                    itemBuilder: (context, index) {
                      ItemProject dataItem = serchProvider.search[index];
                      return MyProject(
                        itemProject: dataItem,
                        padding: pixel >= 10 ? 0 : 0,
                        opacity: pixel >= 10 ? 1.0 : 1,
                      );
                    },
                  )
                else
                  Consumer<MyProvider>(
                    builder: (context, value, _) {
                      if (value.state == ResultState.Loading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (value.state == ResultState.HasData) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    key: itemKey2,
                                    child: MyDescription(desc: value.result)),
                                Container(
                                  height: 600,
                                  width:
                                      MediaQuery.of(context).size.width * 0.50,
                                  child: Stack(
                                    children: [
                                      ProfileImage(
                                          top: pixel >= 20 ? 30 : 100,
                                          left: 100,
                                          sizeHight: 200,
                                          image:
                                              'assets/images/imageBacground1.png',
                                          sizeWidth: 200),
                                      ProfileImage(
                                          top: 150,
                                          left: 160,
                                          image: 'assets/images/profilemo.png',
                                          sizeHight: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.70,
                                          sizeWidth: 270),
                                      ProfileImage(
                                          top: pixel >= 20 ? 100 : 180,
                                          left: 350,
                                          sizeHight: 130,
                                          image: 'assets/images/rak.png',
                                          sizeWidth: 140),
                                      ProfileImage(
                                          top: pixel >= 60 ? 400 : 460,
                                          left: 100,
                                          sizeHight: 130,
                                          image:
                                              'assets/images/imageBacground1.png',
                                          sizeWidth: 130),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 130,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 500.0,
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        AnimatedPositioned(
                                          duration: Duration(milliseconds: 700),
                                          top: pixel >= 300 ? 20 : 80,
                                          left: pixel >= 300 ? 100.0 : 0.0,
                                          child: Container(
                                            height: 400.0,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.50,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            child: FadeInImage.assetNetwork(
                                              height: 400,
                                              placeholder:
                                                  'assets/images/adds_waiting.jpg',
                                              image: '${value.result.myAds}',
                                              fadeInDuration:
                                                  Duration(milliseconds: 200),
                                              fadeOutDuration:
                                                  Duration(milliseconds: 200),
                                              fit: BoxFit.cover,
                                              imageErrorBuilder: (context,
                                                      error, stackTrace) =>
                                                  Image.asset(
                                                'assets/images/adds_error.jpg',
                                                height: 400,
                                                fit: BoxFit.cover,
                                              ),
                                            ),

                                            // Image.network(
                                            //   '${value.result.myAds}',
                                            //   fit: BoxFit.cover,
                                            // ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 300,
                                  width:
                                      MediaQuery.of(context).size.width * 0.40,
                                  child: Stack(
                                    children: [
                                      AnimatedPositioned(
                                        duration: Duration(milliseconds: 700),
                                        top: pixel >= 300 ? 80 : 180,
                                        left: pixel >= 300 ? 0 : 200,
                                        child: AnimatedOpacity(
                                          duration: Duration(milliseconds: 700),
                                          opacity: pixel >= 300 ? 1.0 : 00,
                                          child: Text(
                                            'Design & Build',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3!
                                                .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      AnimatedPositioned(
                                        duration: Duration(milliseconds: 700),
                                        top: pixel >= 380 ? 150 : 250,
                                        left: pixel >= 380 ? 0 : 200,
                                        child: AnimatedOpacity(
                                          duration: Duration(milliseconds: 700),
                                          opacity: pixel >= 380 ? 1.0 : 00,
                                          child: Text(
                                              'Make some app from design to build and testing app',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(
                                                      color: Colors.grey)),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 100,
                            ),
                            Column(
                              children: [
                                Text(
                                  'What I Can Do',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  height: 400,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      AnimatedOpacity(
                                        opacity: pixel >= 900 ? 1.0 : 0.0,
                                        duration: Duration(milliseconds: 900),
                                        child: AnimatedPadding(
                                          padding: EdgeInsets.only(
                                              top: pixel >= 900 ? 0.0 : 100),
                                          duration: Duration(milliseconds: 900),
                                          child: SkillInfo(
                                              title: 'Design',
                                              text:
                                                  '${value.result.skillDesain}',
                                              icon: Icons.design_services),
                                        ),
                                      ),
                                      AnimatedOpacity(
                                        opacity: pixel >= 1000 ? 1.0 : 0.0,
                                        duration: Duration(milliseconds: 900),
                                        child: AnimatedPadding(
                                          padding: EdgeInsets.only(
                                              top: pixel >= 1000 ? 0.0 : 150),
                                          duration: Duration(milliseconds: 900),
                                          child: SkillInfo(
                                              title: 'Mobile & Web Development',
                                              text: '${value.result.skillDev}',
                                              icon: Icons.devices_outlined),
                                        ),
                                      ),
                                      AnimatedOpacity(
                                        opacity: pixel >= 1100 ? 1.0 : 0.0,
                                        duration: Duration(milliseconds: 900),
                                        child: AnimatedPadding(
                                          padding: EdgeInsets.only(
                                              top: pixel >= 1100 ? 0.0 : 200),
                                          duration: Duration(milliseconds: 900),
                                          child: SkillInfo(
                                              title: 'Database Management',
                                              text: '${value.result.skillDb}',
                                              icon: Icons.data_object),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 100,
                                ),
                                Container(
                                  key: itemKey,
                                  child: Text(
                                    'My Own Project',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ),
                                SizedBox(
                                  height: 80,
                                ),
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: value.result.projects.length,
                                  itemBuilder: (context, index) {
                                    ItemProject dataItem =
                                        value.result.projects[index];
                                    return MyProject(
                                      itemProject: dataItem,
                                      padding: pixel >= 1450 ? 0 : 100,
                                      opacity: pixel >= 1450 ? 1.0 : 0.0,
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 100,
                                )
                              ],
                            )
                          ],
                        );
                      } else if (value.state == ResultState.NoData) {
                        return Center(child: Text(value.massage));
                      } else if (value.state == ResultState.error) {
                        return ConnectionError();
                      } else {
                        return Center(child: Text(''));
                      }
                    },
                  ),
              ],
            ),
          ),
          Navbar(
            padCostume: 100,
            toTop: () {
              scrollItem2();
            },
            toProject: () {
              scrollItem();
            },
            isMouse: true,
          ),
        ],
      ),
    );
  }
}
