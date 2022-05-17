/*
This model object represents a combination of all operands and operators
 */
import 'package:calculator/models/calculations.dart';
import 'package:calculator/models/processors/delete_processors/delete_processor.dart';
import 'package:calculator/models/processors/calculation_processor.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rational/rational.dart';

class CalculatorModel extends ChangeNotifier {
  CalculationsModel calculations = CalculationsModel.createEmptyModel();
  // I could create an Actions class?
  bool isSameNumber = false;
  final List<String> actions = [];
  String deletedDigits = "";
  String previousNumber = "";
  String displayedActions = "";
  bool hasEqualButtonBeenPressed = false;

  // Calculate result instead?
  void addOperand(String operand) {
    isSameNumber = true;

    if (hasEqualButtonBeenPressed) {
      _clearResultOfCalculations();
      reverseHasEqualButtonBeenPressed();
      notifyListeners();
    }
    if (_isOperandNotAllowed(operand)) {
      doNothing();
    }
    else
      {
        addOperandToVariables(operand);
        _calculateNewResult();
      }
  }

  bool _isOperandNotAllowed(String operand)
  {
    return _isOperandADot(operand) && _isDotNotAllowed(operand);
  }
  bool _isOperandADot(String operand) {
    return operand == ".";
  }
  bool _isDotNotAllowed(String operand)
  {
    return _isCurrentNumberAFraction(operand)
        || !_isPreviousActionADigit();
  }
  bool _isCurrentNumberAFraction(String operand)
  {
    return calculations.currentNumber.contains(".");
  }
  void addOperandToVariables(String operand)
  {
    displayedActions += operand;
    calculations.currentNumber += operand;

    _addToActions(operand);
    notifyListeners();
  }


  void doNothing() {}
  void _clearResultOfCalculations() {
    calculations.resultOfCalculations = Rational.parse("0.0");
  }

  void _calculateNewResult() {
    if (calculations.currentNumber.isNotEmpty) {
      calculations =
          CalculationProcessor(_getLastOperator(), calculations).process();
      notifyListeners();
    }
  }

  bool _isActionAnOperator(String action) {
    return action == "+" || action == "-" || action == "x" || action == '÷';
  }



  bool _isPreviousActionADigit() {
    if (actions.isNotEmpty) {
      var index = actions.length - 1;
      return actions[index] == '1' ||
          actions[index] == '2' ||
          actions[index] == '3' ||
          actions[index] == '4' ||
          actions[index] == '5' ||
          actions[index] == '6' ||
          actions[index] == '7' ||
          actions[index] == '8' ||
          actions[index] == '9' ||
          actions[index] == '0';
    }
    return false;
  }

  void addOperator(String operator) {
    isSameNumber = false;
    calculations.formerResult = Rational.parse("0.0");

    // code is repeated here
    if (operator == "=") {
      _clearCalculator();
      reverseHasEqualButtonBeenPressed();
      notifyListeners();
    }
    if (!_wasPreviousActionAnOperator() &&
        (actions.isNotEmpty || calculations.currentNumber.isNotEmpty)) {
        _updatePreviousNumber();
        _clearCurrentNumber();
        _addToActions(operator);
        displayedActions += operator;

        notifyListeners();

    }
  }

  void _clearCalculator() {
    _clearNumbers();
    _clearActions();
    notifyListeners();
  }

  void _clearNumbers() {
    previousNumber = "";
    calculations.currentNumber = "";
  }

  void _clearActions() {
    actions.clear();
    displayedActions = "";
  }

  void reverseHasEqualButtonBeenPressed() {
    hasEqualButtonBeenPressed = !hasEqualButtonBeenPressed;
  }

  bool _wasPreviousActionAnOperator() {
    if (actions.isNotEmpty) {
      var previousAction = actions.last;
      if (previousAction == 'x' ||
          previousAction == '-' ||
          previousAction == '+' ||
          previousAction == '÷') {
        return true;
      }
    }
    return false;
  }

  String _getLastOperator() {
    for (var i = actions.length - 1; i >= 0; i--) {
      if (_isActionAnOperator(actions[i])) {
        return actions[i];
      }
    }
    return "";
  }

  void _updatePreviousNumber() {
    previousNumber = calculations.currentNumber;
  }

  void _clearCurrentNumber() {
    calculations.currentNumber = "";
  }

  void _addToActions(String action) {
    actions.add(action);
  }

  void deleteLast() {
    if (displayedActions.isNotEmpty) {
      int index = displayedActions.length - 1;

      if (_isActionADigit(displayedActions[index]) &&
          (calculations.currentNumber.isNotEmpty ||
              deletedDigits.isNotEmpty ||
              displayedActions.isNotEmpty)) {
        _calculateResultAfterDeletion();
        _deleteLastDigitFromCurrentNumber();
      } else if (_isActionAnOperator(displayedActions[index]) &&
          deletedDigits.isNotEmpty) {
        deletedDigits = "";
      }
      if (index == 0) {
        displayedActions = "";
      } else {
        displayedActions = displayedActions.substring(0, index);
      }

      _deleteLastAction();
      notifyListeners();
    }
  }

  void _calculateResultAfterDeletion() {
    calculations.resultOfCalculations = DeleteCalculationProcessor(
            _getLastOperator(), calculations, collectCurrentNumber())
        .process()
        .resultOfCalculations;
  }

// Collect number doesnt collect .
  String collectCurrentNumber() {
    String currentNumber = "";
    for (var i = displayedActions.length - 1; i >= 0; i--) {
      if (_isActionAnOperator(displayedActions[i])) {
        break;
      } else if (_isActionADigit(displayedActions[i]) ||
          displayedActions[i] == ".") {
        currentNumber += displayedActions[i];
      }
    }
    return String.fromCharCodes(currentNumber.runes.toList().reversed);
  }

//TODO
// Could also create a factory for here lol
  bool _isActionADigit(String action) {
    return action == '1' ||
        action == '2' ||
        action == '3' ||
        action == '4' ||
        action == '5' ||
        action == '6' ||
        action == '7' ||
        action == '8' ||
        action == '9' ||
        action == '0';
  }

  void _deleteLastDigitFromCurrentNumber() {
    if (calculations.currentNumber.isNotEmpty) {
      int index = calculations.currentNumber.length - 1;
      calculations.currentNumber =
          calculations.currentNumber.substring(0, index);
    }
  }

  // if the last character is a digit, delete it also from the currentNumber
  void _deleteLastAction() {
    if (actions.isNotEmpty) {
      actions.removeLast();
    }
  }
}
