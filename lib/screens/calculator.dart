import 'package:calculator/main.dart';
import 'package:calculator/models/calculations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

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
        body: _Operands());
  }
}

class _Operands extends StatelessWidget {
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
                child: Text(context.read<CalculationsModel>().sum.toString(),
                textScaleFactor: 3,),
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
              ));
            }),
            SizedBox(
              height: 60.0,
              width: 120.0,
              child: OutlinedButton(
                child: Text(
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
            SizedBox(
              height: 90.0,
              width: 90.0,
              child: OutlinedButton(
                  child: Text(
                    '1',
                    textScaleFactor: 2.0,
                  ),
                  onPressed: () {
                    onOperandPressed(context, '1');
                  }),
            ),
            SizedBox(
              height: 90.0,
              width: 90.0,
              child: OutlinedButton(
                child: Text(
                  '2',
                  textScaleFactor: 2.0,
                ),
                onPressed: () {
                  onOperandPressed(context, '2');
                },
              ),
            ),
            SizedBox(
              height: 90.0,
              width: 90.0,
              child: OutlinedButton(
                child: Text(
                  '3',
                  textScaleFactor: 2.0,
                ),
                onPressed: () {
                  onOperandPressed(context, '3');
                },
              ),
            ),
            SizedBox(
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
          ],
        ),
        Row(
          children: <Widget>[
            SizedBox(
              height: 90.0,
              width: 90.0,
              child: OutlinedButton(
                child: Text(
                  '4',
                  textScaleFactor: 2.0,
                ),
                onPressed: () {
                  onOperandPressed(context, '4');
                },
              ),
            ),
            SizedBox(
              height: 90.0,
              width: 90.0,
              child: OutlinedButton(
                child: Text(
                  '5',
                  textScaleFactor: 2.0,
                ),
                onPressed: () {
                  onOperandPressed(context, '5');
                },
              ),
            ),
            SizedBox(
              height: 90.0,
              width: 90.0,
              child: OutlinedButton(
                child: Text(
                  '6',
                  textScaleFactor: 2.0,
                ),
                onPressed: () {
                  onOperandPressed(context, '6');
                },
              ),
            ),
            SizedBox(
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
          ],
        ),
        Row(
          children: <Widget>[
            SizedBox(
              height: 90.0,
              width: 90.0,
              child: OutlinedButton(
                child: Text(
                  '7',
                  textScaleFactor: 2.0,
                ),
                onPressed: () {
                  onOperandPressed(context, '7');
                },
              ),
            ),
            SizedBox(
              height: 90.0,
              width: 90.0,
              child: OutlinedButton(
                child: Text(
                  '8',
                  textScaleFactor: 2.0,
                ),
                onPressed: () {
                  onOperandPressed(context, '8');
                },
              ),
            ),
            SizedBox(
              height: 90.0,
              width: 90.0,
              child: OutlinedButton(
                child: Text(
                  '9',
                  textScaleFactor: 2.0,
                ),
                onPressed: () {
                  onOperandPressed(context, '9');
                },
              ),
            ),
            SizedBox(
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
          ],
        ),
        Row(
          children: <Widget>[
            SizedBox(
              height: 90.0,
              width: 90.0,
              child: OutlinedButton(
                child: Text(
                  '.',
                  textScaleFactor: 2.0,
                ),
                onPressed: () {
                  onOperandPressed(context, '.');
                },
              ),
            ),
            SizedBox(
              height: 90.0,
              width: 90.0,
              child: OutlinedButton(
                child: Text(
                  '0',
                  textScaleFactor: 2.0,
                ),
                onPressed: () {
                  onOperandPressed(context, '0');
                },
              ),
            ),
            SizedBox(
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
            SizedBox(
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
    calculations.removeLast();
  }
}
