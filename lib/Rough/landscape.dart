import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Landscape extends StatefulWidget {
  const Landscape({Key? key}) : super(key: key);

  @override
  _LandscapeState createState() => _LandscapeState();
}

class _LandscapeState extends State<Landscape> {
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
  Widget custombutton(String value) {
    return Expanded(
      child: FlatButton(
          padding: const EdgeInsets.all(10),
          onPressed: () => btnvalue(value),
          child: Text(
            value,
            style: const TextStyle(
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
        appBar: AppBar(title: const Text('Calcualtor'),),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.bottomRight,
                      child: Text(
                        equation,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.bottomRight,
                      child: Text(
                        result,
                        style: const TextStyle(fontSize: 25),
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
                custombutton('.'),
                custombutton('+'),
                custombutton('C'),
              ],
            ),
            Row(
              children: [
                custombutton('4'),
                custombutton('5'),
                custombutton('6'),
                custombutton('0'),
                custombutton('-'),
                custombutton('⌫'),
              ],
            ),
            Row(
              children: [
                custombutton('7'),
                custombutton('8'),
                custombutton('9'),
                custombutton('/'),
                custombutton('x'),
                custombutton('='),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
