

/*
This model object represents a combination of all operands and operators
 */
import 'package:calculator/models/action.dart';
import 'package:flutter/foundation.dart';

class CalculationsModel extends ChangeNotifier
{

  //
  int sum = 0;
  final List<Action> actions = [];


  void addDigit(int digit)
  {
    sum += digit;
    notifyListeners();
  }
  //addAction
}

// Press the button
//     // Add the action to the calculcations
//         If the action is