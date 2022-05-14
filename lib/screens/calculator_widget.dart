import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator/models/calculator_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../common/theme.dart';

class CalculatorWidget extends StatelessWidget {
  const CalculatorWidget({Key? key}) : super(key: key);

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
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      Row(
        children: [
          Consumer<CalculatorModel>(builder: (context, calculations, child) {
            return Expanded(
              child: Visibility(
                visible: true,
                child: AutoSizeText(
                  context.read<CalculatorModel>().resultOfCalculations.toString(),
                  textScaleFactor: 3.3,
                  maxLines: 3,
                  minFontSize: 2.0,
                  style: const TextStyle(),
                ),
              ),
            );
          })
        ],
      ),
      const Visibility(
          visible: true,
          child: Divider(
            color: Colors.black,
          )),
      Consumer<CalculatorModel>(
          builder: (context, calculations, child) {
            return Expanded(
                child: AutoSizeText(
                  context.read<CalculatorModel>().displayedActions.toString(),
                  textScaleFactor: 3.0,
                  maxLines: 5,
                  minFontSize: 2.0,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ));
          }),
      Padding(
        padding: const EdgeInsets.only(left: 2.0),
        child: Row(
          children: [
            const Spacer(),
            const Spacer(

            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: OutlinedButton(
                  style: deleteButtonTheme,
                  child: const Text(
                    'DELETE',
                    textScaleFactor: 1.5,
                  ),
                  onPressed: () {
                    onDeletePressed(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 2.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: SizedBox(
                height: 90.0,
                width: 90.0,
                child: OutlinedButton(
                    style: operandButtonTheme,
                    child: const Text(
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
                  child: const Text(
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
                  child: const Text(
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
                  style: operatorButtonTheme,
                  child: const Text(
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
      ),
      Padding(
        padding: const EdgeInsets.only(left: 2.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: SizedBox(
                height: 90.0,
                width: 90.0,
                child: OutlinedButton(
                  style: operandButtonTheme,
                  child: const Text(
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
                  child: const Text(
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
                  child: const Text(
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
                  style: operatorButtonTheme,
                  child: const Text(
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
      ),
      Padding(
        padding: const EdgeInsets.only(left: 2.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: SizedBox(
                height: 90.0,
                width: 90.0,
                child: OutlinedButton(
                  style: operandButtonTheme,
                  child: const Text(
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
                  child: const Text(
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
                  child: const Text(
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
                  style: operatorButtonTheme,
                  child: const Text(
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
      ),
      Padding(
        padding: const EdgeInsets.only(left: 2.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: SizedBox(
                height: 90.0,
                width: 90.0,
                child: OutlinedButton(
                  style: operandButtonTheme,
                  child: const Text(
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
                  child: const Text(
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
                  style: operatorButtonTheme,
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
                  style: operatorButtonTheme,
                  child: const Text(
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
      ),
    ]);
  }

  void onOperandPressed(BuildContext context, String digit) {
    var calculations = context.read<CalculatorModel>();
    calculations.addOperand(digit);
  }

  void onOperatorPressed(BuildContext context, String operator) {
    var calculations = context.read<CalculatorModel>();
    calculations.addOperator(operator);
  }

  void onDeletePressed(BuildContext context) {
    var calculations = context.read<CalculatorModel>();
    calculations.deleteLast();
  }
}
