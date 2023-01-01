import 'package:flutter/material.dart';
import 'package:palimo_portfolio_web/main_detail.dart';
import 'package:palimo_portfolio_web/model/my_model.dart';

import '../my_detail_web.dart';

class MyProject extends StatefulWidget {
  final double opacity;
  final double padding;
  ItemProject itemProject;
  MyProject(
      {super.key,
      required this.opacity,
      required this.padding,
      // required this.iconButtom,
      required this.itemProject});

  @override
  State<MyProject> createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  bool? isRead ;
  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: Duration(milliseconds: 700),
      padding: EdgeInsets.symmetric(horizontal: widget.padding),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 700),
        opacity: widget.opacity,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 200, vertical: 20),
          child: InkWell(
            onTap: () {
              setState(() {
                 isRead = false;
              });
             
              Navigator.pushNamed(context, MainDetail.routeNamed,
                  arguments: widget.itemProject);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Hero(
                  tag: '${widget.itemProject.image}',
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // image:DecorationImage(image: NetworkImage('${itemProject.image}',),fit: BoxFit.cover)
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    height: MediaQuery.of(context).size.width * 0.15,
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/image_waiting.jpg',
                      imageErrorBuilder: (context, error, stackTrace) =>
                          Image.asset(
                        'assets/images/image_error.jpg',
                        fit: BoxFit.cover,
                      ),
                      height: MediaQuery.of(context).size.width * 0.15,
                      width: MediaQuery.of(context).size.width * 0.15,
                      image: '${widget.itemProject.image}',
                      fit: BoxFit.cover,
                      fadeInDuration: Duration(milliseconds: 200),
                      fadeOutDuration: Duration(milliseconds: 200),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Hero(
                        tag: '${widget.itemProject.judul}',
                        child: Text(
                          '${widget.itemProject.judul}',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontWeight: FontWeight.bold),
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
                              '${widget.itemProject.year}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.5),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: Text(
                              '${widget.itemProject.category}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                      fontSize: 16,
                                      overflow: TextOverflow.fade),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          
                             CircleAvatar(
                                  backgroundColor:isRead == false?Colors.red :Colors.green,
                                  minRadius: 5,
                                ),
                          
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Hero(
                        tag: '${widget.itemProject.description}',
                        child: Text(
                          '${widget.itemProject.description}',
                          style: Theme.of(context).textTheme.subtitle1,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
