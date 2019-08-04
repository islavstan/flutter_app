import 'package:flutter/material.dart';
import 'package:flutter_app_bloc/utils/HexColor.dart';

class SecondRoute extends StatelessWidget {
  double _containerHeight = 56, _marginLeft = 16, _marginTop = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: <Widget>[
      Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              child: IconButton(
                  onPressed: () {
                    backPressed(context);
                  },
                  icon: Icon(Icons.arrow_back,
                      color: HexColor("#000000"), size: 24.0)),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              child: IconButton(
                  onPressed: () {
                    morePressed();
                  },
                  icon: Icon(Icons.more_vert,
                      color: HexColor("#000000"), size: 24.0)),
            ),
          )
        ],
      ),
      Container(
          margin: EdgeInsets.only(left: 24.0),
          child: Text("ОЧ: КОМФИ 132",
              style: TextStyle(
                  color: HexColor("#000000"),
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold))),
      Container(
          margin: EdgeInsets.only(left: 24.0, top: 8.0),
          child: Text("*173 14101352185448",
              style: TextStyle(
                  color: HexColor("#000000"),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold)))
    ]));
  }

  void morePressed() {}

  void backPressed(BuildContext context) {
    Navigator.pop(context);
  }
}
