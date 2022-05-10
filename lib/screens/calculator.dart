import 'package:calculator/main.dart';
import 'package:calculator/models/calculations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

import '../common/theme.dart';

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          'Calculator',
          style: Theme.of(context).textTheme.headline1,
        )),
        body: _Calculator());
  }
}

class _Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        Row(
          children: [
            Consumer<CalculationsModel>(
                builder: (context, calculations, child) {
              return Expanded(
                child: Visibility(
                  visible: !context.read<CalculationsModel>().isFinished,
                  child: Text(
                    context.read<CalculationsModel>().result.toString(),
                    textScaleFactor: 3.3,
                    style: TextStyle(),
                  ),
                ),
              );
            })
          ],
        ),
        Row(
          children: [
            Consumer<CalculationsModel>(
                builder: (context, calculations, child) {
              return Expanded(
                  child: Text(
                context.read<CalculationsModel>().actionsString.toString(),
                textScaleFactor: 3.0,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                ),
              ));
            }),
            SizedBox(
              height: 60.0,
              width: 120.0,
              child: OutlinedButton(
                child: const Text(
                  'DELETE',
                  textScaleFactor: 1.5,
                ),
                onPressed: () {
                  onDeletePressed(context);
                },
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: SizedBox(
                height: 90.0,
                width: 90.0,
                child: OutlinedButton(
                    style: operandButtonTheme,
                    child: Text(
                      '1',
                      textScaleFactor: 2.0,
                    ),
                    onPressed: () {
                      onOperandPressed(context, '1');
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: SizedBox(
                height: 90.0,
                width: 90.0,
                child: OutlinedButton(
                  style: operandButtonTheme,
                  child: Text(
                    '2',
                    textScaleFactor: 2.0,
                  ),
                  onPressed: () {
                    onOperandPressed(context, '2');
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: SizedBox(
                height: 90.0,
                width: 90.0,
                child: OutlinedButton(
                  style: operandButtonTheme,
                  child: Text(
                    '3',
                    textScaleFactor: 2.0,
                  ),
                  onPressed: () {
                    onOperandPressed(context, '3');
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: SizedBox(
                height: 90.0,
                width: 90.0,
                child: OutlinedButton(
                  child: Text(
                    '÷',
                    textScaleFactor: 2.0,
                  ),
                  onPressed: () {
                    onOperatorPressed(context, '÷');
                  },
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: SizedBox(
                height: 90.0,
                width: 90.0,
                child: OutlinedButton(
                  style: operandButtonTheme,
                  child: Text(
                    '4',
                    textScaleFactor: 2.0,
                  ),
                  onPressed: () {
                    onOperandPressed(context, '4');
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: SizedBox(
                height: 90.0,
                width: 90.0,
                child: OutlinedButton(
                  style: operandButtonTheme,
                  child: Text(
                    '5',
                    textScaleFactor: 2.0,
                  ),
                  onPressed: () {
                    onOperandPressed(context, '5');
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: SizedBox(
                height: 90.0,
                width: 90.0,
                child: OutlinedButton(
                  style: operandButtonTheme,
                  child: Text(
                    '6',
                    textScaleFactor: 2.0,
                  ),
                  onPressed: () {
                    onOperandPressed(context, '6');
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: SizedBox(
                height: 90.0,
                width: 90.0,
                child: OutlinedButton(
                  child: Text(
                    'x',
                    textScaleFactor: 2.0,
                  ),
                  onPressed: () {
                    onOperatorPressed(context, 'x');
                  },
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: SizedBox(
                height: 90.0,
                width: 90.0,
                child: OutlinedButton(
                  style: operandButtonTheme,
                  child: Text(
                    '7',
                    textScaleFactor: 2.0,
                  ),
                  onPressed: () {
                    onOperandPressed(context, '7');
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: SizedBox(
                height: 90.0,
                width: 90.0,
                child: OutlinedButton(
                  style: operandButtonTheme,
                  child: Text(
                    '8',
                    textScaleFactor: 2.0,
                  ),
                  onPressed: () {
                    onOperandPressed(context, '8');
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: SizedBox(
                height: 90.0,
                width: 90.0,
                child: OutlinedButton(
                  style: operandButtonTheme,
                  child: Text(
                    '9',
                    textScaleFactor: 2.0,
                  ),
                  onPressed: () {
                    onOperandPressed(context, '9');
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: SizedBox(
                height: 90.0,
                width: 90.0,
                child: OutlinedButton(
                  child: Text(
                    '-',
                    textScaleFactor: 2.0,
                  ),
                  onPressed: () {
                    onOperatorPressed(context, '-');
                  },
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: SizedBox(
                height: 90.0,
                width: 90.0,
                child: OutlinedButton(
                  style: operandButtonTheme,
                  child: Text(
                    '.',
                    textScaleFactor: 2.0,
                  ),
                  onPressed: () {
                    onOperandPressed(context, '.');
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: SizedBox(
                height: 90.0,
                width: 90.0,
                child: OutlinedButton(
                  style: operandButtonTheme,
                  child: Text(
                    '0',
                    textScaleFactor: 2.0,
                  ),
                  onPressed: () {
                    onOperandPressed(context, '0');
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: SizedBox(
                height: 90.0,
                width: 90.0,
                child: OutlinedButton(
                  child: const Text(
                    '=',
                    textScaleFactor: 2.0,
                  ),
                  onPressed: () {
                    onOperatorPressed(context, '=');
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: SizedBox(
                height: 90.0,
                width: 90.0,
                child: OutlinedButton(
                  child: Text(
                    '+',
                    textScaleFactor: 2.0,
                  ),
                  onPressed: () {
                    onOperatorPressed(context, '+');
                  },
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }

  void onOperandPressed(BuildContext context, String digit) {
    var calculations = context.read<CalculationsModel>();
    calculations.addOperand(digit);
  }

  void onOperatorPressed(BuildContext context, String operator) {
    var calculations = context.read<CalculationsModel>();
    calculations.addOperator(operator);
  }

  void onDeletePressed(BuildContext context) {
    var calculations = context.read<CalculationsModel>();
    calculations.deleteLast();
  }
}
