import 'package:flutter/material.dart';


//Stateless widget are useful when the part of the user interface you are describing does not depend on anything other
//For compositions that can change dynamically, e.g. due to having an internal clock-driven state, or depending on some system state, consider using StatefulWidget
class LoadingProgress extends StatelessWidget {
  LoadingProgress({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
