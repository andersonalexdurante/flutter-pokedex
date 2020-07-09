import 'package:first_app/consts/consts.dart';
import 'package:first_app/screens/Home/Widgets/app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double statusBar = MediaQuery.of(context).padding.top;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(overflow: Overflow.visible, children: <Widget>[
          Positioned(
            top: -200 / 4.5,
            left: screenWidth - (200 / 1.5),
            child: Opacity(
              opacity: 0.1,
              child:
                  Image.asset(AppConsts.blackPokeball, height: 200, width: 200),
            ),
          ),
          Container(
            child: Column(children: <Widget>[
              Container(
                height: statusBar,
              ),
              AppHeader()
            ]),
          )
        ]));
  }
}
