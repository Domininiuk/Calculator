import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator/models/calculator_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/theme.dart';
import 'operand_button.dart';
import 'operator_button.dart';

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
                  context
                      .read<CalculatorModel>()
                      .calculations
                      .resultOfCalculations
                      .toStringAsFixed(5),
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
      Consumer<CalculatorModel>(builder: (context, calculations, child) {
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
            const Spacer(),
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
          children: const <Widget>[
            OperandButton("1"),
            OperandButton("2"),
            OperandButton("3"),
            OperatorButton("÷"),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 2.0),
        child: Row(
          children: const <Widget>[
            OperandButton("4"),
            OperandButton("5"),
            OperandButton("6"),
            OperatorButton("x")
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 2.0),
        child: Row(
          children: const <Widget>[
            OperandButton("7"),
            OperandButton("8"),
            OperandButton("9"),
            OperatorButton("-")
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 2.0),
        child: Row(
          children: const <Widget>[
            OperandButton("."),
            OperandButton("0"),
            OperatorButton("="),
            OperatorButton("+"),
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
