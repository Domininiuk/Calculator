/*
This model object represents a combination of all operands and operators
 */
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CalculationsModel extends ChangeNotifier {
  //
  double result = 0;
  double formerResult = 0;
  bool isSameNumber = false;


 // Add a a same number boolean
 // that is set to false when adding oeprator or deleting
 // and is set to true when adding a digit

  //add a double formerResult that stores the value of result before multiplication to 0. I think its going to be difficult to implement delete last


  final List<String> actions = [];
  String previousNum = "";
  String currentNum = "";
  String actionsString = "";
  String deleted = "";
  bool isFinished = false;

  void addOperand(String operand) {
    isSameNumber = true;
    if (_isOperandADot(operand) && !_isPreviousActionADigit()) {
    } else {
      if (_isOperandADot(operand) && currentNum.contains(".")) {
      } else {
        actionsString += operand;
        currentNum += operand;

        _addToActions(operand);
        notifyListeners();
      }
    }

    //if(previousNum.isNotEmpty && currentNum.isNotEmpty)
    if (currentNum.isNotEmpty) {
      // if(operator == "+")
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

    if (isFinished) {
      isFinished = false;
      _resetTexts();
    }
    if (!_wasPreviousActionAnOperator() &&
        (actions.isNotEmpty || currentNum.isNotEmpty)) {
      if (operator == "=") {
        _updateTexts();
        _clearCalculator();
        isFinished = true;
      } else {
        _updatePreviousNumber();
        _clearCurrentNumber();
        _addToActions(operator);
        actionsString += operator;

        notifyListeners();
      }
    }
  }

  void _resetTexts() {
    _resetResultText();
    _resetActionsText();
    notifyListeners();
  }

  void _resetResultText() {
    result = 0.0;
  }

  void _resetActionsText() {
    actionsString = "";
  }

  void _updateTexts() {
    actionsString = result.toString();
  }

  void _clearCalculator() {
    _clearNumbers();
    _clearActions();
    notifyListeners();
  }

  void _clearNumbers() {
    previousNum = "";
    currentNum = "";
  }

  void _clearActions() {
    actions.clear();
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
    if (currentNum.length >= 3) {
      result -=
          double.tryParse(currentNum.substring(0, currentNum.length - 1))!;
      result += double.tryParse(currentNum)!;
      notifyListeners();
    } else if (currentNum.length == 2) {
      result -= double.tryParse(currentNum[0])!;

      result += double.tryParse(currentNum)!;
      notifyListeners();
    } else if (currentNum.length == 1) {
      double? currNum = double.tryParse(currentNum);
      result += currNum!;
      notifyListeners();
    }
  }

  void _calculateTheDifference() {
    if (currentNum.length >= 3) {
      result +=
          double.tryParse(currentNum.substring(0, currentNum.length - 1))!;
      result -= double.tryParse(currentNum)!;
      notifyListeners();
    } else if (currentNum.length == 2) {
      result += double.tryParse(currentNum[0])!;

      result -= double.tryParse(currentNum)!;
      notifyListeners();
    } else if (currentNum.length == 1) {
      double? currNum = double.tryParse(currentNum);
      result -= currNum!;
      notifyListeners();
    }
  }

  bool _isCurrentNumAllZeroes()
  {
    return !currentNum.contains(RegExp(r'[1-9]')) && currentNum.contains("0");
  }
  // When dividing by zero give an error Division by zero is undefined
  void _calculateTheProduct() {
    if (currentNum.length >= 3) {
      if(currentNum.substring(0, currentNum.length - 1) == "0." && !_isCurrentNumAllZeroes())
      {
        result = formerResult;
      }
      else
        {
        result /= double.tryParse(currentNum.substring(0, currentNum.length - 1))!;
        }
      result *= double.tryParse(currentNum)!;
      notifyListeners();
    } else if (currentNum.length == 2) {
      if (currentNum[0] == "0") {
        // It already has been multiplied by 0. no need to do anything

      } else {
        result /= double.tryParse(currentNum[0])!;
        //formerResult = result;
        result *= double.tryParse(currentNum)!;
        notifyListeners();
      }
      result *= double.tryParse(currentNum)!;
      notifyListeners();
    } else if (currentNum.length == 1) {
      double? currNum = double.tryParse(currentNum);
      if(currNum == 0)
        {
          formerResult = result;
        }
      result *= currNum!;
      notifyListeners();
    }
  }

  //CANNOT DIVIDE BY 0
  void _calculateTheQuotient() {
    if (currentNum.length >= 3) {
      //if
      if(currentNum.substring(0, 2) == "0." && !_isCurrentNumAllZeroes())
        {
          result = formerResult;
          result /= double.tryParse(currentNum)!;
          notifyListeners();
        }
      else if(_isCurrentNumAllZeroes())
        {
         // result *= double.tryParse(currentNum.substring(0, currentNum.length - 1))!;
         // result /= double.tryParse(currentNum)!;
         // notifyListeners();
        }
      else{
         result *= double.tryParse(currentNum.substring(0, currentNum.length - 1))!;
         result /= double.tryParse(currentNum)!;
        notifyListeners();
      }
    } else if (currentNum.length == 2) {
      if(currentNum[0]== "0")
        {

        }
      else {
        result *= double.tryParse(currentNum[0])!;

        result /= double.tryParse(currentNum)!;
        notifyListeners();
      }
    } else if (currentNum.length == 1) {
      double? currNum = double.tryParse(currentNum);
      if(currNum == 0)
        {
          formerResult = result;
          //CANNOT DIVIDE BY 0 (HERE WOULD BE AN ERROR MESSAGE)
        }
      else
        {
          result /= currNum!;
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
    previousNum = currentNum;
  }

  void _clearCurrentNumber() {
    currentNum = "";
  }

  void _addToActions(String action) {
    actions.add(action);
  }

  // Basically to update the sum when deleting you have do calculations, kind of like the reverse of calculators

  void deleteLast() {
    if (actionsString.isNotEmpty) {
      _deleteLastFromActions();
      int index = actionsString.length - 1;

      if (_isActionADigit(actionsString[index]) && currentNum.isNotEmpty) {
        _deleteLastFromCurrentNumber();
      }
      if (index == 0) {
        actionsString = "";
      } else {
        actionsString = actionsString.substring(0, index);
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

  void _deleteLastFromCurrentNumber() {
    int index = currentNum.length - 1;

    currentNum = currentNum.substring(0, index);
  }

  // if the last cahracter is a digit, delete it also from the currentNumber
  void _deleteLastFromActions() {
    if (actions.isNotEmpty) {
      actions.removeLast();
    }
  }
}
