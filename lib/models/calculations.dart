/*
This model object represents a combination of all operands and operators
 */
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CalculationsModel extends ChangeNotifier {
  //
  double result = 0;
  final List<String> actions = [];
  String previousNum = "";
  String currentNum = "";
  String actionsString = "";

  void addOperand(String operand) {
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
      switch(_getLastOperator())
      {
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
    return action == "+" ||
        action == "-" ||
        action == "x" ||
        action == '÷';
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
    if (!_wasPreviousActionAnOperator() &&
        (actions.isNotEmpty || currentNum.isNotEmpty)) {
      _updatePreviousNumber();
      _clearCurrentNumber();
      _addToActions(operator);
      actionsString += operator;

      notifyListeners();
    }
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

  // DONT CLEAR NUMBERS WHEN CALCULATING THE SUM, INSTEAD DOING WHEN ADDING OPERATOR

  // I SHOULD SUM THE NUMBER THAT WAS ONLY RECENTLY ADDED, AND THE NUMBER THAT WAS PREVIOUSLY CALCULATED

  // I NEED TO FIND A WAY TO DISTINGUISH MULTI DIGIT NUMBERS FROM SINGLE DIGIT NUMBERS
  // THE WAY IT WORKS NOW IS THAT THE PROGRAM TREATS 99 AS 9+9
  // MAYBE I SHOULD EXTRACT SOME LOGIC INTO THE OPRAND CLASS TO REDUCE COMPLEXITY?
  //I COULD ADD A isSingleDigit property that would make it easier to work with?
  void _calculateTheSum() {
    if(currentNum.length >= 3)
      {

        result -= double.tryParse(currentNum.substring(0, currentNum.length - 1))!;
        result += double.tryParse(currentNum)!;
        notifyListeners();

      }
    else if(currentNum.length == 2)
      {
        result -=  double.tryParse(currentNum[0])!;

        result += double.tryParse(currentNum)!;
        notifyListeners();
      }
    else if(currentNum.length == 1)
      {
        double? currNum = double.tryParse(currentNum);
        result += currNum!;
        notifyListeners();

      }
  }
  void _calculateTheDifference()
  {
    if(currentNum.length >= 3)
    {

      result += double.tryParse(currentNum.substring(0, currentNum.length - 1))!;
      result -= double.tryParse(currentNum)!;
      notifyListeners();

    }
    else if(currentNum.length == 2)
    {
      result +=  double.tryParse(currentNum[0])!;

      result -= double.tryParse(currentNum)!;
      notifyListeners();
    }
    else if(currentNum.length == 1)
    {
      double? currNum = double.tryParse(currentNum);
      result -= currNum!;
      notifyListeners();

    }
  }
void _calculateTheProduct()
{

}
void _calculateTheQuotient()
{

}

  String _getLastOperator()
  {
    for(var i = actions.length - 1; i>= 0; i--)
      {
        if(_isActionAnOperator(actions[i]))
          {
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

  void deleteLast() {
    if (actionsString.isNotEmpty) {
      _deleteLastFromActions();
      int index = actionsString.length - 1;

      if (_isActionADigit(actionsString[index]) && currentNum.isNotEmpty) {
        _deleteLastFromCurrentNumber();
      }
      if(index == 0)
        {
          actionsString = "";
        }
      else
        {
          actionsString = actionsString.substring(0, index - 1);
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
