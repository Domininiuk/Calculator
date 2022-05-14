import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/theme.dart';
import '../models/calculator_model.dart';

class OperandButton extends StatefulWidget {
  const OperandButton(this.operand, {Key? key}) : super(key: key);

  final String operand;
  @override
  _OperandButtonState createState() => _OperandButtonState();
}

class _OperandButtonState extends State<OperandButton>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 150),
        lowerBound: 0.0,
        upperBound: 0.2)
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