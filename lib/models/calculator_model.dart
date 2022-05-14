/*
This model object represents a combination of all operands and operators
 */
import 'package:calculator/models/calculations.dart';
import 'package:calculator/models/processors/addition_processor.dart';
import 'package:calculator/models/processors/division_processor.dart';
import 'package:calculator/models/processors/multiplication_processor.dart';
import 'package:calculator/models/processors/subtraction_processor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CalculatorModel extends ChangeNotifier {
  //



  
  
  CalculationsModel calculations = CalculationsModel.createEmptyModel();
  bool isSameNumber = false;
  final List<String> actions = [];
  String previousNumber = "";
  String displayedActions = "";
  String deletedActions = "";
  bool hasEqualButtonBeenPressed = false;

  void addOperand(String operand) {
    isSameNumber = true;
    if(hasEqualButtonBeenPressed)
      {
        calculations.resultOfCalculations = 0.0;
        hasEqualButtonBeenPressed = false;
        notifyListeners();
      }
    if (_isOperandADot(operand) && !_isPreviousActionADigit()) {
    } else {
      if (_isOperandADot(operand) && calculations.currentNumber.contains(".")) {
      } else {
        displayedActions += operand;
        calculations.currentNumber += operand;

        _addToActions(operand);
        notifyListeners();
      }
    }

    if (calculations.currentNumber.isNotEmpty) {
      switch (_getLastOperator()) {
        case "+":
          _calculateTheSum();
          break;
        case "-":
          _calculateTheDifference();
          break;
        case "x":
          _calculateTheProduct();
          break;
        case "÷":
          _calculateTheQuotient();
          break;
        default:
          _calculateTheSum();
          break;
      }
      notifyListeners();

    }
  }

  bool _isActionAnOperator(String action) {
    return action == "+" || action == "-" || action == "x" || action == '÷';
  }

  bool _isOperandADot(String operand) {
    return operand == ".";
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
  //addAction

  // OPERAND OPERATOR OPERAND = RESULT SHOWN THEN OPERAND OPERATOR OPERAND

  void addOperator(String operator) {
    isSameNumber = false;
    calculations.formerResult = 0.0;

    if (operator == "=") {
      _clearCalculator();
      hasEqualButtonBeenPressed = true;
      notifyListeners();
    }
    if (!_wasPreviousActionAnOperator() &&
        (actions.isNotEmpty || calculations.currentNumber.isNotEmpty)) {
      if (operator == "=") {
        _clearCalculator();
        hasEqualButtonBeenPressed = true;
        notifyListeners();
      } else {
        _updatePreviousNumber();
        _clearCurrentNumber();
        _addToActions(operator);
        displayedActions += operator;

        notifyListeners();
      }
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


  void _calculateTheSum() {
    AdditionProcessor processor = AdditionProcessor(calculations.currentNumber, calculations.resultOfCalculations, calculations.formerResult);
    var newCalculations = processor.process();
    calculations.resultOfCalculations = newCalculations.resultOfCalculations;
    calculations.formerResult = newCalculations.formerResult;
    calculations.currentNumber = newCalculations.currentNumber;
  }

  void _calculateTheDifference() {
    SubtractionProcessor processor = SubtractionProcessor(calculations.currentNumber, calculations.resultOfCalculations, calculations.formerResult);
    var newCalculations = processor.process();
    calculations.resultOfCalculations = newCalculations.resultOfCalculations;
    calculations.formerResult = newCalculations.formerResult;
    calculations.currentNumber = newCalculations.currentNumber;
  }

  bool _isCurrentNumAllZeroes()
  {
    return !calculations.currentNumber.contains(RegExp(r'[1-9]')) && calculations.currentNumber.contains("0");
  }


//  I think I could extract the logic of the _calculate methods to a different class.
  // Calculations is already complicated enough, no need to make it even harder
  // I want the CalculationsModel class to only tell other objects what to do. I do not want it to do any processing of its own
  // Maybe a Calculator class? But there already is a calculator class. Some variation of "Processor"?

  void _calculateTheProduct() {
    MultiplicationProcessor processor = MultiplicationProcessor(calculations.currentNumber, calculations.resultOfCalculations, calculations.formerResult);
    var newCalculations = processor.process();
    calculations.resultOfCalculations = newCalculations.resultOfCalculations;
    calculations. formerResult = newCalculations.formerResult;
    calculations.currentNumber = newCalculations.currentNumber;
  }

  //CANNOT DIVIDE BY 0
  void _calculateTheQuotient() {
    DivisionProcessor processor = DivisionProcessor(calculations.currentNumber, calculations.resultOfCalculations, calculations.formerResult);
    var newCalculations = processor.process();
    calculations.resultOfCalculations = newCalculations.resultOfCalculations;
    calculations.formerResult = newCalculations.formerResult;
    calculations.currentNumber = newCalculations.currentNumber;
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
      _deleteLastAction();
      int index = displayedActions.length - 1;

      if (_isActionADigit(displayedActions[index]) && calculations.currentNumber.isNotEmpty) {
        _deleteLastDigitFromCurrentNumber();
      }
      if (index == 0) {
        displayedActions = "";
      } else {
        displayedActions = displayedActions.substring(0, index);
      }

      notifyListeners();
    }
  }

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
    int index = calculations.currentNumber.length - 1;

    calculations.currentNumber = calculations.currentNumber.substring(0, index);
  }

  // if the last character is a digit, delete it also from the currentNumber
  void _deleteLastAction() {
    if (actions.isNotEmpty) {
      actions.removeLast();
    }
  }
}
