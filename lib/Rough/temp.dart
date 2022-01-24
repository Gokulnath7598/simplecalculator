import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:simplecalculator/Rough/portrait.dart';

import 'landscape.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation){
        if(orientation == Orientation.portrait){
          return Portrait();
        }else{
          return Landscape();
        }
      },
    );
  }
}


//create
