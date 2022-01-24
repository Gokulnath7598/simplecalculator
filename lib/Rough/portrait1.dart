import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Portrait extends StatefulWidget {
  const Portrait({Key? key}) : super(key: key);

  @override
  _PortraitState createState() => _PortraitState();
}

class _PortraitState extends State<Portrait> {
  String equation = "0";
  String result = "0";
  String expression = "";

  calcualtion(String buttonText) {
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
        expression = expression.replaceAll('x', '*');

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

  Widget textview(double i, double j) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(i),
        alignment: Alignment.bottomRight,
        child: Text(
          equation,
          style: TextStyle(fontSize: j),
        ),
      ),
    );
  }

  Widget custombutton(String value) {
    return Expanded(
      child: FlatButton(
          padding: const EdgeInsets.all(20),
          onPressed: () => calcualtion(value),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 30,
            ),
          )),
    );
  }

  Widget custombutton1(String value) {
    return Expanded(
      child: FlatButton(
          padding: const EdgeInsets.all(10),
          onPressed: () => calcualtion(value),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 20,
            ),
          )),
    );
  }

  Widget portraitbutton() {
    return Column(
      children: [
        Row(
          children: [
            custombutton('C'),
            custombutton('⌫'),
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
            custombutton('x')
          ],
        ),
        Row(
          children: [
            custombutton('.'),
            custombutton('0'),
            custombutton('/'),
            custombutton('='),
          ],
        )
      ],
    );
  }

  Widget landscapebutton() {
    return Column(
      children: [
        Row(
          children: [
            custombutton1('1'),
            custombutton1('2'),
            custombutton1('3'),
            custombutton1('.'),
            custombutton1('+'),
            custombutton1('C'),
          ],
        ),
        Row(
          children: [
            custombutton1('4'),
            custombutton1('5'),
            custombutton1('6'),
            custombutton1('0'),
            custombutton1('-'),
            custombutton1('⌫'),
          ],
        ),
        Row(
          children: [
            custombutton1('7'),
            custombutton1('8'),
            custombutton1('9'),
            custombutton1('/'),
            custombutton1('x'),
            custombutton1('='),
          ],
        ),
      ],
    );
  }

  Widget landscapecolumn() {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              // textview(10,30),
              // textview(10,50),
              textview(5, 20),
              textview(5, 25),
            ],
          ),
        ),
        // portraitbutton(),
        landscapebutton(),
      ],
    );
  }

  Widget portraitcolumn() {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              textview(10, 30),
              textview(10, 50),
            ],
          ),
        ),
        portraitbutton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calcualtor'),
        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return portraitcolumn();
            } else {
              return landscapecolumn();
            }
          },
        ),
      ),
    );
  }
}
