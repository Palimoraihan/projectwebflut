import 'package:flutter/material.dart';
import 'package:palimo_portfolio_web/conection_error.dart';
import 'package:palimo_portfolio_web/mobile_pages/widget/my_decription.dart';
import 'package:palimo_portfolio_web/mobile_pages/widget/my_project_mobile.dart';
import 'package:palimo_portfolio_web/mobile_pages/widget/skill_info.dart';
import 'package:palimo_portfolio_web/model/my_model.dart';
import 'package:palimo_portfolio_web/provider/my_provider.dart';
import 'package:palimo_portfolio_web/web_pages/widget/navbar.dart';
import 'package:provider/provider.dart';

class MyDashboardMobile extends StatefulWidget {
  static const roteNamed = 'My-Dashboard-Mobile';
  const MyDashboardMobile({super.key});

  @override
  State<MyDashboardMobile> createState() => _MyDashboardMobileState();
}

class _MyDashboardMobileState extends State<MyDashboardMobile> {
  TextEditingController controllerText = TextEditingController();
  final _itemKey = GlobalKey();
  final _itemKey2 = GlobalKey();
  ScrollController? _sControler;
  double _pixel = 0.0;
  @override
  void initState() {
    super.initState();
    _sControler = ScrollController();
    _sControler!.addListener(() {
      setState(() {
        _pixel = _sControler!.position.pixels;
        print(_sControler!.position.pixels);
      });
    });
  }

  Future _scrollItem2() async {
    final context2 = _itemKey2.currentContext;
    await Scrollable.ensureVisible(context2!,
        alignment: 0.5, duration: Duration(seconds: 5));
  }

  Future _scrollItem() async {
    final context = _itemKey.currentContext;

    await Scrollable.ensureVisible(context!,
        alignment: 0.2, duration: Duration(seconds: 5));
  }

  @override
  Widget build(BuildContext context) {
    final serchProviderMob = Provider.of<MyProvider>(context);
    return Stack(
      children: [
        SingleChildScrollView(
          controller: _sControler,
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                child: TextField(
                  controller: controllerText,
                  onChanged: serchProviderMob.searchData,
                  decoration: InputDecoration(hintText: 'Search Project'),
                ),
              ),
              serchProviderMob.search.length != 0 || controllerText.text.isNotEmpty
                  ? ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: serchProviderMob.search.length,
                      itemBuilder: (context, index) {
                        ItemProject dataMob = serchProviderMob.search[index];
                        return MyProjectMobole(
                          dataProject: dataMob,
                          padding: _pixel >= 0 ? 0 : 0,
                          opacity: _pixel >= 0 ? 1 : 1,
                        );
                      },
                    )
                  : Consumer<MyProvider>(
                      builder: (context, value, child) {
                        if (value.state == ResultState.Loading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (value.state == ResultState.HasData) {
                          return Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.50,
                                child: Stack(
                                  children: [
                                    AnimatedPositioned(
                                      duration: Duration(seconds: 1),
                                      top: _pixel >= 20 ? -60 : 0,
                                      right: 230,
                                      left: 0,
                                      child: Container(
                                        key: _itemKey2,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(
                                          top: 60,
                                        ),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.20,
                                        width: 100,
                                        child: Image.asset(
                                          'assets/images/imageBacground1.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      left: 0,
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(
                                          top: 40,
                                        ),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.45,
                                        child: Image.asset(
                                          'assets/images/profilemo.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    AnimatedPositioned(
                                      duration: Duration(seconds: 1),
                                      top: _pixel >= 20 ? -120 : 0,
                                      right: 200,
                                      left: 0,
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(
                                          top: 270,
                                        ),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        child: Image.asset(
                                          'assets/images/imageBacground1.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    AnimatedPositioned(
                                      duration: Duration(seconds: 1),
                                      top: _pixel >= 30 ? -40 : 0,
                                      right: 0,
                                      left: 110,
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(
                                          top: 120,
                                        ),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.10,
                                        width: 100,
                                        child: Image.asset(
                                          'assets/images/rak.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              MyDescriptionMobile(
                                descrip: value.result,
                              ),
                              SizedBox(
                                height: 130,
                              ),
                              Container(
                                height: 280.0,
                                width: double.infinity,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    AnimatedPositioned(
                                      duration: Duration(milliseconds: 700),
                                      top: 0,
                                      left: _pixel >= 200 ? 0.0 : -80.0,
                                      child: AnimatedOpacity(
                                        duration: Duration(milliseconds: 700),
                                        opacity: _pixel >= 200 ? 1.0 : 0.0,
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            height: 250.0,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            child: FadeInImage.assetNetwork(
                                              height: 250,
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
                                                height: 250,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                            //  Image.network(
                                            //   '${value.result.myAds}',
                                            //   fit: BoxFit.cover,
                                            // ),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                height: 120,
                                child: Stack(
                                  children: [
                                    AnimatedPositioned(
                                      duration: Duration(milliseconds: 700),
                                      top: 0,
                                      right: 0,
                                      left: _pixel >= 500 ? 0.0 : 80.0,
                                      child: AnimatedOpacity(
                                        duration: Duration(milliseconds: 700),
                                        opacity: _pixel >= 500 ? 1.0 : 0.0,
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Design & Build',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline4!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white),
                                              ),
                                              Text(
                                                'Make some app from design to build and testing app',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .copyWith(
                                                        color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 100,
                              ),
                              Text(
                                'What I Can Do',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              SkillInfoMobile(
                                title: 'Design',
                                text: '${value.result.skillDesain}',
                                icon: Icons.design_services,
                                top: _pixel >= 800 ? 0 : 80,
                                opacity: _pixel >= 800 ? 1.0 : 0.0,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              SkillInfoMobile(
                                title: 'Mobile & Web Development',
                                text: '${value.result.skillDev}',
                                icon: Icons.devices_outlined,
                                top: _pixel >= 1000 ? 0 : 80,
                                opacity: _pixel >= 1000 ? 1.0 : 0.0,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              SkillInfoMobile(
                                title: 'Database Management',
                                text: '${value.result.skillDb}',
                                icon: Icons.data_object,
                                top: _pixel >= 1200 ? 0 : 80,
                                opacity: _pixel >= 1200 ? 1.0 : 0.0,
                              ),
                              SizedBox(
                                height: 100,
                              ),
                              //my project
                              Container(
                                key: _itemKey,
                                child: Text(
                                  'My Own Project',
                                  style: Theme.of(context).textTheme.headline6,
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
                                  ItemProject dataMob =
                                      value.result.projects[index];
                                  return MyProjectMobole(
                                    dataProject: dataMob,
                                    padding: _pixel >= 1700 ? 20 : 80,
                                    opacity: _pixel >= 1700 ? 1 : 0,
                                  );
                                },
                              ),

                              SizedBox(
                                height: 100,
                              ),
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
          toProject: () {
            _scrollItem();
          },
          toTop: () {
            _scrollItem2();
          },
          padCostume: 10,
          isMouse: false,
        ),
      ],
    );
  }
}
