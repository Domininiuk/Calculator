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

  // You get sum by calcualting doing (current result - previous result = the difference)
  CalculationsModel calculations = CalculationsModel.createEmptyModel();
  bool isSameNumber = false;
  final List<String> actions = [];
  String deletedDigits = "";
  String previousNumber = "";
  String displayedActions = "";
  //String lastOperator = "";
  bool hasEqualButtonBeenPressed = false;

  void addOperand(String operand) {
    isSameNumber = true;
    if (hasEqualButtonBeenPressed) {
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
    AdditionProcessor processor = AdditionProcessor(calculations.currentNumber,
        calculations.resultOfCalculations, calculations.formerResult);
    var newCalculations = processor.process();
    calculations.resultOfCalculations = newCalculations.resultOfCalculations;
    calculations.formerResult = newCalculations.formerResult;
    calculations.currentNumber = newCalculations.currentNumber;
  }

  void _calculateTheDifference() {
    SubtractionProcessor processor = SubtractionProcessor(
        calculations.currentNumber,
        calculations.resultOfCalculations,
        calculations.formerResult);
    var newCalculations = processor.process();
    calculations.resultOfCalculations = newCalculations.resultOfCalculations;
    calculations.formerResult = newCalculations.formerResult;
    calculations.currentNumber = newCalculations.currentNumber;
  }

  void _calculateTheProduct() {
    MultiplicationProcessor processor = MultiplicationProcessor(
        calculations.currentNumber,
        calculations.resultOfCalculations,
        calculations.formerResult);
    var newCalculations = processor.process();
    calculations.resultOfCalculations = newCalculations.resultOfCalculations;
    calculations.formerResult = newCalculations.formerResult;
    calculations.currentNumber = newCalculations.currentNumber;
  }

  //CANNOT DIVIDE BY 0
  void _calculateTheQuotient() {
    DivisionProcessor processor = DivisionProcessor(calculations.currentNumber,
        calculations.resultOfCalculations, calculations.formerResult);
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
      int index = displayedActions.length - 1;

      if (_isActionADigit(displayedActions[index]) &&
          (calculations.currentNumber.isNotEmpty || deletedDigits.isNotEmpty)) {
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
    switch (_getLastOperator()) {
      case "+":
        var currentNumber = collectCurrentNumber();
        if (currentNumber.length > 2) {
          var newResult = calculations.resultOfCalculations -
              double.tryParse(currentNumber)!;
          newResult += double.tryParse(
              currentNumber.substring(0, currentNumber.length - 1))!;
          //_calculateResultAfterDeletion();
          calculations.resultOfCalculations = newResult;
          // then remove the digit from currentNumber
          // add it to new result
          // and update resultOfCalculations
        } else if (currentNumber.length == 2) {
          var newResult = calculations.resultOfCalculations -
              double.tryParse(currentNumber)!;
          newResult += double.tryParse(currentNumber[0])!;

          calculations.resultOfCalculations = newResult;
        } else if (currentNumber.length == 1) {
          var newResult = calculations.resultOfCalculations -
              double.tryParse(currentNumber)!;
          calculations.resultOfCalculations = newResult;
        }
        break;
      case "-":
        var currentNumber = collectCurrentNumber();
        if (currentNumber.length > 2) {
          var newResult = calculations.resultOfCalculations +
              double.tryParse(currentNumber)!;
          newResult -= double.tryParse(
              currentNumber.substring(0, currentNumber.length - 1))!;
          //_calculateResultAfterDeletion();
          calculations.resultOfCalculations = newResult;
          // then remove the digit from currentNumber
          // add it to new result
          // and update resultOfCalculations
        } else if (currentNumber.length == 2) {
          var newResult = calculations.resultOfCalculations +
              double.tryParse(currentNumber)!;
          newResult -= double.tryParse(currentNumber[0])!;

          calculations.resultOfCalculations = newResult;
        } else if (currentNumber.length == 1) {
          var newResult = calculations.resultOfCalculations +
              double.tryParse(currentNumber)!;
          calculations.resultOfCalculations = newResult;
        }
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
  }

  String collectCurrentNumber() {
    String currentNumber = "";
    for (var i = displayedActions.length - 1; i >= 0; i--) {
      if (_isActionAnOperator(displayedActions[i])) {
        break;
      } else if (_isActionADigit(displayedActions[i])) {
        currentNumber += displayedActions[i];
      }
    }
    return String.fromCharCodes(currentNumber.runes.toList().reversed);
  }

// Store all full numbers in a list, and then after deleting an operator delete the corresponding number that was created by the operator?
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
