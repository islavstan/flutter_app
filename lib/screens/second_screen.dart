import 'package:flutter/material.dart';
import 'package:flutter_app_bloc/utils/HexColor.dart';
import 'package:flutter_app_bloc/utils/IntervalProgressBar.dart';
import 'package:flutter_app_bloc/widgets/BottomSheetCustom.dart';
import 'package:flutter_app_bloc/widgets/SlidingUpPanel.dart';

class SecondRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SecondRouteState();
  }
}

class SecondRouteState extends State<SecondRoute> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey _listViewKey = GlobalKey();
  BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(12.0),
    topRight: Radius.circular(12.0),
  );
  double _minSlideHeight = 0.0;
  double _maxSlideHeight = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_onBuildCompleted);
  }

  _onBuildCompleted(_) {
    final RenderBox containerRenderBox =
        _listViewKey.currentContext.findRenderObject();
    final containerSize = containerRenderBox.size;
    setState(() {
      _minSlideHeight = MediaQuery.of(context).size.height - containerSize.height - 24;
      _maxSlideHeight = MediaQuery.of(context).size.height - 74;
    });
  }

  //DraggableScrollableSheet
//https://github.com/akshathjain/sliding_up_panel
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Stack(children: [
          ListView(shrinkWrap: true, key: _listViewKey, children: <Widget>[
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
                        fontWeight: FontWeight.bold))),
            Container(
                margin: EdgeInsets.only(left: 24.0, top: 8.0),
                child: Text("09.01.2019",
                    style: TextStyle(
                        color: HexColor("#000000"),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold))),
            Padding(
                padding: EdgeInsets.only(left: 24, top: 12, right: 24),
                child: IntervalProgressBar(
                    direction: IntervalProgressDirection.horizontal,
                    max: 25,
                    progress: 16,
                    size: Size(double.infinity, 8),
                    highlightColor: HexColor("#8dc641"),
                    defaultColor: HexColor("#1e000000"),
                    intervalSize: 2,
                    intervalColor: IntervalProgressBar.TRANSPARENT,
                    intervalHighlightColor: IntervalProgressBar.TRANSPARENT,
                    radius: 3,
                    reverse: false)),
            Padding(
                padding: EdgeInsets.only(left: 24, top: 8, right: 24),
                child: Stack(children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      child: Text("Залишок (9/25)",
                          style: TextStyle(
                              color: HexColor("#8a000000"),
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      child: Text("-9 000.00 UAH",
                          style: TextStyle(
                              color: HexColor("#de000000"),
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold)),
                    ),
                  )
                ])),
            Padding(
                padding: EdgeInsets.only(left: 24, top: 8, right: 24),
                child: Stack(children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      child: Text("Сума оплати частинами",
                          style: TextStyle(
                              color: HexColor("#8a000000"), fontSize: 14.0)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      child: Text("25 000.00 UAH",
                          style: TextStyle(
                              color: HexColor("#de000000"), fontSize: 14.0)),
                    ),
                  )
                ])),
            Padding(
                padding: EdgeInsets.only(left: 24, top: 8, right: 24),
                child: Stack(children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      child: Text("Наступний платіж (09.02.19)",
                          style: TextStyle(
                              color: HexColor("#8a000000"), fontSize: 14.0)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      child: Text("1 290.00 UAH",
                          style: TextStyle(
                              color: HexColor("#de000000"), fontSize: 14.0)),
                    ),
                  )
                ])),
            Padding(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: Stack(children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      child: Text("З комісією 2.9% - 290.00 UAH",
                          style: TextStyle(
                              color: HexColor("#8a000000"), fontSize: 12.0)),
                    ),
                  )
                ])),
          ]),
          SlidingUpPanel(
            borderRadius: radius,
            minHeight: _minSlideHeight,
            maxHeight: _maxSlideHeight,
            panel: Center(
              child: Text("This is the sliding Widget"),
            ),
          )
        ]));
  }

  //https://mightytechno.com/flutter-full-height-bottomsheet/
  void _settingModalBottomSheet(context) {
    showModalBottomSheetCustom(
        context: context,
        builder: (BuildContext bc) {
          return DraggableScrollableSheet(
              initialChildSize: 0.5,
              maxChildSize: 1,
              minChildSize: 0.25,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  child: new Wrap(
                    children: <Widget>[
                      new ListTile(
                          leading: new Icon(Icons.music_note),
                          title: new Text('Music'),
                          onTap: () => {}),
                      new ListTile(
                        leading: new Icon(Icons.videocam),
                        title: new Text('Video'),
                        onTap: () => {},
                      ),
                    ],
                  ),
                );
              });
        });
  }

  void morePressed() {}

  void backPressed(BuildContext context) {
    Navigator.pop(context);
  }
}
