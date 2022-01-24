import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late int first, second;
  late String opp, result, text = "";

  void btnvalue(String value) {
    if (value == 'C') {
      print('1');
      first = 0;
      second = 0;
      result = '';
      text = '';
    } else if (value == '+' || value == '-' || value == '/' || value == 'X') {
      print('2');
      first = int.parse(text);
      result = '';
      opp = value;
    } else if (value == '=') {
      print('3');
      second = int.parse(text);
      if (opp == '+') {
        result = (first + second).toString();
      } else if (opp == '-') {
        result = (first - second).toString();
      } else if (opp == 'X') {
        result = (first * second).toString();
      } else if (opp == '/') {
        result = (first / second).toString();
      }
    }
    else
    {
      print('4');
      result = int.parse(text+value).toString();
    }
    setState(() {
      text = result;
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
              fontSize: 25,
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
        body: Container(
          child: Column(
            children: [
              Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 50,
                      ),
                    ),
                  )),
              Row(
                children: [
                  custombutton('C'),
                  custombutton('<x'),
                ],
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
                  custombutton('.'),
                  custombutton('0'),
                  custombutton('='),
                  custombutton('/')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
