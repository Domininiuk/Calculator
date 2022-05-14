import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/theme.dart';
import '../models/calculator_model.dart';

class OperatorButton extends StatefulWidget {

  const OperatorButton(this.operator, {Key? key}) : super(key: key);
  final String operator;
  @override
  State<StatefulWidget> createState() => OperatorButtonState();
}

class OperatorButtonState extends State<OperatorButton>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;
  @override
  Widget build(BuildContext context) {
    _scale = 1- _controller.value;

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
              style: operatorButtonTheme,
              child:  Text(
                widget.operator,
                textScaleFactor: 2.0,
              ),
              onPressed: () {
                onOperatorPressed(context, widget.operator);
              }),
        ),
      ),
    );
  }
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      lowerBound: 0.0,
      upperBound: 0.2,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onOperatorPressed(BuildContext context, String operator) {
    var calculations = context.read<CalculatorModel>();
    calculations.addOperator(operator);

    _controller.forward().whenComplete(() => _controller.reverse());
  }
}
