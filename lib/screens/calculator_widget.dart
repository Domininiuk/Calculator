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

class _OperandButton extends StatefulWidget {
  const _OperandButton(this.operand);

  final String operand;
  @override
  _OperandButtonState createState() => _OperandButtonState();
}

class _OperandButtonState extends State<_OperandButton>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 100),
        lowerBound: 0.0,
        upperBound: 0.1)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return _animatedButton();
  }

  Widget _animatedButton() {
    return Transform.scale(
      scale: _scale,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: SizedBox(
          height: 90.0,
          width: 90.0,
          child: OutlinedButton(
              style: operandButtonTheme,
              child:  Text(
                widget.operand,
                textScaleFactor: 2.0,
              ),
              onPressed: () {
                onOperandPressed(context, widget.operand);
              }),
        ),
      ),
    );
  }

  void onOperandPressed(BuildContext context, String digit) {
    var calculations = context.read<CalculatorModel>();
    calculations.addOperand(digit);

    _controller.forward().whenComplete(() => _controller.reverse());
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
                      .toString(),
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
          children: <Widget>[
            _OperandButton("1"),
            _OperandButton("2"),
            _OperandButton("3"),
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
            _OperandButton("4"),
            _OperandButton("5"),
            _OperandButton("6"),
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
            _OperandButton("7"),
            _OperandButton("8"),
            _OperandButton("9"),
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
            _OperandButton("."),
            _OperandButton("0"),
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
