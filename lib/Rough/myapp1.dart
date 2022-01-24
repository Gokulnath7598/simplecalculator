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
class MyApp1 extends StatefulWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  _MyApp1State createState() => _MyApp1State();
}

class _MyApp1State extends State<MyApp1> {
  String equation = "0";
  String result = "0";
  String expression = "";

  btnvalue(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";

      } else if (buttonText == "⌫") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {

        expression = equation;
        expression = expression.replaceAll('X', '*');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget custombutton(String value) {
    return Expanded(
      child: FlatButton(
          padding: EdgeInsets.all(10),
          onPressed: () => btnvalue(value),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 20,
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
        appBar: AppBar(title: Text('Calcualtor'),),
        body: Container(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.bottomRight,
                        child: Text(
                          equation,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.bottomRight,
                        child: Text(
                          result,
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  custombutton('1'),
                  custombutton('2'),
                  custombutton('3'),
                  custombutton('+')
                ],
              ),
              Row(
                children: [
                  custombutton('4'),
                  custombutton('5'),
                  custombutton('6'),
                  custombutton('-')
                ],
              ),
              Row(
                children: [
                  custombutton('7'),
                  custombutton('8'),
                  custombutton('9'),
                  custombutton('X')
                ],
              ),
              Row(
                children: [
                  custombutton('0'),
                  custombutton('.'),
                  custombutton('/'),
                  custombutton('C'),
                  custombutton('='),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
