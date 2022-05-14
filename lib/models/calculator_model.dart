/*
This model object represents a combination of all operands and operators
 */
import 'package:calculator/models/processors/division_processor.dart';
import 'package:calculator/models/processors/multiplication_processor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CalculatorModel extends ChangeNotifier {
  //
  double resultOfCalculations = 0;
  double formerResult = 0;
  
  
  
  bool isSameNumber = false;
  final List<String> actions = [];
  String previousNumber = "";
  String currentNumber = "";
  String displayedActions = "";
  String deletedActions = "";
  bool hasEqualButtonBeenPressed = false;

  void addOperand(String operand) {
    isSameNumber = true;
    if(hasEqualButtonBeenPressed)
      {
        resultOfCalculations = 0.0;
        hasEqualButtonBeenPressed = false;
        notifyListeners();
      }
    if (_isOperandADot(operand) && !_isPreviousActionADigit()) {
    } else {
      if (_isOperandADot(operand) && currentNumber.contains(".")) {
      } else {
        displayedActions += operand;
        currentNumber += operand;

        _addToActions(operand);
        notifyListeners();
      }
    }

    if (currentNumber.isNotEmpty) {
      // if(operator == "+")
      switch (_getLastOperator()) {
        case "+":
          _calculateTheSum();
          break;
        case "-":
          _calculateTheDifference();
          break;
        case "x":
          MultiplicationProcessor processor = MultiplicationProcessor(currentNumber, resultOfCalculations, formerResult);
          resultOfCalculations = processor.process();
          break;
        case "÷":
          DivisionProcessor processor = DivisionProcessor();
          resultOfCalculations = processor.process(currentNumber, resultOfCalculations, formerResult);
          notifyListeners();
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
    formerResult = 0.0;

    if (operator == "=") {
      _clearCalculator();
      hasEqualButtonBeenPressed = true;
      notifyListeners();
    }
    if (!_wasPreviousActionAnOperator() &&
        (actions.isNotEmpty || currentNumber.isNotEmpty)) {
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
    currentNumber = "";
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
    if (currentNumber.length >= 3) {
      resultOfCalculations -=
          double.tryParse(currentNumber.substring(0, currentNumber.length - 1))!;
      resultOfCalculations += double.tryParse(currentNumber)!;
      notifyListeners();
    } else if (currentNumber.length == 2) {
      resultOfCalculations -= double.tryParse(currentNumber[0])!;

      resultOfCalculations += double.tryParse(currentNumber)!;
      notifyListeners();
    } else if (currentNumber.length == 1) {
      double? currNum = double.tryParse(currentNumber);
      resultOfCalculations += currNum!;
      notifyListeners();
    }
  }

  void _calculateTheDifference() {
    if (currentNumber.length >= 3) {
      resultOfCalculations +=
          double.tryParse(currentNumber.substring(0, currentNumber.length - 1))!;
      resultOfCalculations -= double.tryParse(currentNumber)!;
      notifyListeners();
    } else if (currentNumber.length == 2) {
      resultOfCalculations += double.tryParse(currentNumber[0])!;

      resultOfCalculations -= double.tryParse(currentNumber)!;
      notifyListeners();
    } else if (currentNumber.length == 1) {
      double? currNum = double.tryParse(currentNumber);
      resultOfCalculations -= currNum!;
      notifyListeners();
    }
  }

  bool _isCurrentNumAllZeroes()
  {
    return !currentNumber.contains(RegExp(r'[1-9]')) && currentNumber.contains("0");
  }


//  I think I could extract the logic of the _calculate methods to a different class.
  // Calculations is already complicated enough, no need to make it even harder
  // I want the CalculationsModel class to only tell other objects what to do. I do not want it to do any processing of its own
  // Maybe a Calculator class? But there already is a calculator class. Some variation of "Processor"?

  void _calculateTheProduct() {
    if (currentNumber.length >= 3) {
      if(currentNumber.substring(0, 2) == "0." && !_isCurrentNumAllZeroes())
      {
        resultOfCalculations = formerResult;
        resultOfCalculations *= double.tryParse(currentNumber)!;
        notifyListeners();
      }
      else if(_isCurrentNumAllZeroes())
      {
      }
      else
        {
        resultOfCalculations /= double.tryParse(currentNumber.substring(0, currentNumber.length - 1))!;
        resultOfCalculations *= double.tryParse(currentNumber)!;
        notifyListeners();
        }
    } else if (currentNumber.length == 2) {
      if (currentNumber[0] == "0") {
        // It already has been multiplied by 0. no need to do anything

      } else {
        resultOfCalculations /= double.tryParse(currentNumber[0])!;
        //formerResult = result;
        resultOfCalculations *= double.tryParse(currentNumber)!;
        notifyListeners();
      }
      resultOfCalculations *= double.tryParse(currentNumber)!;
      notifyListeners();
    } else if (currentNumber.length == 1) {
      double? parsedCurrentNumber = double.tryParse(currentNumber);
      if(parsedCurrentNumber == 0)
        {
          formerResult = resultOfCalculations;
        }
      resultOfCalculations *= parsedCurrentNumber!;
      notifyListeners();
    }
  }

  //CANNOT DIVIDE BY 0
  void _calculateTheQuotient() {
    if (currentNumber.length >= 3) {
      //if
      if(currentNumber.substring(0, 2) == "0." && !_isCurrentNumAllZeroes())
        {
          resultOfCalculations = formerResult;
          resultOfCalculations /= double.tryParse(currentNumber)!;
          notifyListeners();
        }
      else if(_isCurrentNumAllZeroes())
        {

        }
      else{
         resultOfCalculations *= double.tryParse(currentNumber.substring(0, currentNumber.length - 1))!;
         resultOfCalculations /= double.tryParse(currentNumber)!;
        notifyListeners();
      }
    } else if (currentNumber.length == 2) {
      if(currentNumber[0]== "0")
        {

        }
      else {
        resultOfCalculations *= double.tryParse(currentNumber[0])!;

        resultOfCalculations /= double.tryParse(currentNumber)!;
        notifyListeners();
      }
    } else if (currentNumber.length == 1) {
      double? currNum = double.tryParse(currentNumber);
      if(currNum == 0)
        {
          formerResult = resultOfCalculations;
        }
      else
        {
          resultOfCalculations /= currNum!;
        }
      notifyListeners();
    }
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
    previousNumber = currentNumber;
  }

  void _clearCurrentNumber() {
    currentNumber = "";
  }

  void _addToActions(String action) {
    actions.add(action);
  }

  void deleteLast() {
    if (displayedActions.isNotEmpty) {
      _deleteLastAction();
      int index = displayedActions.length - 1;

      if (_isActionADigit(displayedActions[index]) && currentNumber.isNotEmpty) {
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
    int index = currentNumber.length - 1;

    currentNumber = currentNumber.substring(0, index);
  }

  // if the last character is a digit, delete it also from the currentNumber
  void _deleteLastAction() {
    if (actions.isNotEmpty) {
      actions.removeLast();
    }
  }
}
