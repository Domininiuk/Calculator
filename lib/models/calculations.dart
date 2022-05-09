/*
This model object represents a combination of all operands and operators
 */
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CalculationsModel extends ChangeNotifier {
  //
  double sum = 0;
  final List<String> actions = [];
  String previousNum = "";
  String currentNum = "";
  String actionsString = "";

  // Numbers can only have one comma
  // i.e. 5.5.5 - NOT ALLOWED
  // 5.5 - ALLOWED
  // CANNOT ADD OPERATOR IF THE PREVIOUS ACTION WAS A DOT

  void addOperand(String operand) {
    if (_isOperandADot(operand) && !_isPreviousActionADigit())
    {
    }
    else
    {
      if (_isOperandADot(operand) && currentNum.contains(".")) {
      } else {
        actionsString += operand;
        currentNum += operand;

        //Hwo do I decide whether to append an operand to the last action or add a a new one?
        _addToActions(operand);
        notifyListeners();
      }
    }


    // If currentNum and previousNum are not empty
    // Find the latest operator
    //    And the the calculations
    //    Reset the currentNum and previousNum
    if(previousNum.isNotEmpty && currentNum.isNotEmpty)
    {
     // if(operator == "+")
      if(true)
      {
        _calculateTheSum();
      }
    }
  }

  bool _isPreviousActionAnOperator()
  {
    var previousAction = actions.last;
    return previousAction == "+" || previousAction == "-" || previousAction == "x"
        || previousAction == '÷';
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


    

    // somehow the third digit wasnt added to actions, because it was not in actions
    //     This is a result of only adding numbers to Actions after pressing an operator
    //     Here you press the operator, the number is stored correctly in currentNum,
    //     but it doesnt pass any of the checks because the previous stored action was an operator
    
    /* Commented out because I want the result to be calculate when adding the operator
    if(operator == "=" && (currentNumber.isNotEmpty|| actions.last == "="))
      {
        _addToActions(currentNumber);
       // _addToActions(operator);
        _calculateTheSum();
        _clearCurrentNumber();
        _updatePreviousNumber();
      }


     */


    // The fourth
    if (!_wasPreviousActionAnOperator() && (actions.isNotEmpty || currentNum.isNotEmpty))  {
      /*
        if(currentNum.isNotEmpty) {
          _addToActions(currentNum);
        }

       */

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

  void _calculateTheSum()
  {

    double? prevNum = double.tryParse(previousNum);
    double? currNum = double.tryParse(currentNum);
    _resetNumbers();

    sum += (currNum! + prevNum!);
    notifyListeners();
  }
// Its impossible to add operator after this because currentNumb

  void _resetNumbers()
  {
    currentNum = "";
    previousNum = "";
  }
  void _updatePreviousNumber()
  {
    previousNum = currentNum;
  }
  void _clearCurrentNumber() {
    currentNum = "";
  }

  void _addToActions(String action) {
    actions.add(action);
  }

  void removeLast() {
    if (actionsString.isNotEmpty) {
      _deleteLastFromActions();
      int index = actionsString.length - 1;

      if (_isActionADigit(actionsString[index]) && currentNum.isNotEmpty) {
        _deleteLastFromCurrentNumber();
      }
      actionsString = actionsString.substring(0, index);

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
    if(actions.isNotEmpty)
      {
        actions.removeLast();

      }
  }
}
