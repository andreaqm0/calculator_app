import 'package:calculator_app/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String equation = '0';
  String result = '0';
  String expression = '0';

  buttonPressed(String text) {
    switch (text) {
      case "C":
        equation = "0";
        result = "0";
        break;
      case "Del":
        equation = equation.substring(0, equation.length - 1);
        break;
      case "+/-":
        break;
      case "=":
        expression = equation;
        expression = expression.replaceAll("x", "*");
        expression = expression.replaceAll("/", "/");

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (error) {
          result = "Error";
        }
        break;
      default:
        if (equation == "0") {
          equation = text;
        } else {
          equation += text;
        }
        break;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(children: <Widget>[
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Text(
            equation,
            style: const TextStyle(fontSize: 38),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
          child: Text(
            result,
            style: const TextStyle(fontSize: 48),
          ),
        ),
        const Expanded(child: Divider()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Table(
                children: [
                  TableRow(children: [
                    button("C", 1, Colors.orange[700]!, context, buttonPressed),
                    button("Del", 1, Colors.black38, context, buttonPressed),
                    button("+/-", 1, Colors.black38, context, buttonPressed),
                  ]),
                  TableRow(children: [
                    button("7", 1, Colors.black26, context, buttonPressed),
                    button("8", 1, Colors.black26, context, buttonPressed),
                    button("9", 1, Colors.black26, context, buttonPressed),
                  ]),
                  TableRow(children: [
                    button("4", 1, Colors.black26, context, buttonPressed),
                    button("5", 1, Colors.black26, context, buttonPressed),
                    button("6", 1, Colors.black26, context, buttonPressed),
                  ]),
                  TableRow(children: [
                    button("1", 1, Colors.black26, context, buttonPressed),
                    button("2", 1, Colors.black26, context, buttonPressed),
                    button("3", 1, Colors.black26, context, buttonPressed),
                  ]),
                  TableRow(children: [
                    button(".", 1, Colors.black26, context, buttonPressed),
                    button("0", 1, Colors.black26, context, buttonPressed),
                    button("00", 1, Colors.black26, context, buttonPressed),
                  ]),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.25,
              child: Table(
                children: [
                  TableRow(children: [
                    button("*", 1, Colors.blueAccent, context, buttonPressed)
                  ]),
                  TableRow(children: [
                    button("-", 1, Colors.blueAccent, context, buttonPressed)
                  ]),
                  TableRow(children: [
                    button("+", 1, Colors.blueAccent, context, buttonPressed)
                  ]),
                  TableRow(children: [
                    button("/", 1, Colors.blueAccent, context, buttonPressed)
                  ]),
                  TableRow(children: [
                    button("=", 1, Colors.blueAccent, context, buttonPressed)
                  ]),
                ],
              ),
            )
          ],
        )
      ]),
    );
  }
}
