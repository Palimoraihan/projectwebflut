
import 'package:flutter/material.dart';
import 'package:palimo_portfolio_web/main_detail.dart';
import 'package:palimo_portfolio_web/model/my_model.dart';


class MyProjectMobole extends StatelessWidget {
   final double opacity;
  final double padding;
  ItemProject dataProject;
   MyProjectMobole({super.key,required this.dataProject, required this.opacity, required this.padding});

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding:  EdgeInsets.only(top: padding,left:10, right:10,bottom: 20),
      duration: Duration(milliseconds: 700),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 700),
        opacity: opacity,
        child: InkWell(
          onTap: (){
            Navigator.pushNamed(context, MainDetail.routeNamed,arguments: dataProject);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: '${dataProject.image}',
                child: Container(
                  
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    
                    borderRadius: BorderRadius.circular(10),
                    // image: DecorationImage(image: NetworkImage('${dataProject.image}',),fit: BoxFit.cover,)
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child:  FadeInImage.assetNetwork(
                      placeholder: 'assets/images/image_waiting.jpg',
                      imageErrorBuilder: (context, error, stackTrace) =>
                          Image.asset(
                        'assets/images/image_error.jpg',
                        fit: BoxFit.cover,
                      ),
                      height: 200,
                      width: double.infinity,
                      image: '${dataProject.image}',
                      fit: BoxFit.cover,
                      fadeInDuration: Duration(milliseconds: 200),
                      fadeOutDuration: Duration(milliseconds: 200),
                    ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Hero(
                tag:'${dataProject.judul}' ,
                child: Text(
                  '${dataProject.judul}',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontWeight: FontWeight.bold),
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
                        '${dataProject.year}',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, letterSpacing: 1.5),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      '${dataProject.category}',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(fontSize: 16, overflow: TextOverflow.fade),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                '${dataProject.description}',
                style: Theme.of(context).textTheme.bodyText2,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
