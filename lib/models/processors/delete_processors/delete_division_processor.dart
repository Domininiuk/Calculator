import 'package:decimal/decimal.dart';

import '../../calculations.dart';
import 'delete_processor.dart';
import 'package:rational/rational.dart';
class DeleteDivisionProcessor implements DeleteCalculationProcessor {
  DeleteDivisionProcessor(this._calculations, this._collectedCurrentNumber);
  CalculationsModel _calculations;
  String _collectedCurrentNumber;


  // Zeroes after the . in decimal numbers dont matter e.g .90000040004
  // But they do matter in the numbers before them e.g. 900000000.44444

  // It works fine when the number before the . is not 0
  @override
  CalculationsModel process() {
    _calculations.currentNumber = _collectedCurrentNumber;

    if (_isCurrentNumberTripleDigitOrLonger()) {
      /*

      IF YOU MULTIPLE A FRACTION SMALLER THAN 1
      THEN ALL YOURE REALLY DOING IS DIVISION
      BECAUSE THE NUMBER WILL BE SMALLER
       */
      // If the number contains only one digit except for zeroes? but then what if
      // e.g. 0.009, 0.1, 0.000000000010


      //
      if(_isCurrentNumberADecimal() && _calculations.isCurrentNumberSmallerThanOne() &&
          _calculations.currentNumberHasOnlyOneDigitDifferentToZero())
        {
          _calculations.multiplyResultOfCalculations(_collectedCurrentNumber);
        }
      else
        {
          _calculations.multiplyResultOfCalculations(_collectedCurrentNumber);
          _calculations.divideResultOfCalculations(_collectedCurrentNumber.substring(
              0, _collectedCurrentNumber.length - 1));
        }
    } else if (_isCurrentNumberDoubleDigit()) {
      _calculations.multiplyResultOfCalculations(_collectedCurrentNumber);
      _calculations.divideResultOfCalculations(_collectedCurrentNumber[0]);

    } else if (_isCurrentNumberSingleDigit() && !_calculations.isCurrentNumberZero()) {
      _calculations.multiplyResultOfCalculations(_collectedCurrentNumber);
    }

    return _calculations;
  }
  bool _isCurrentNumberTripleDigitOrLonger() {
    return _calculations.isCurrentNumberTripleDigitOrLonger();
  }

  bool _isCurrentNumberADecimal()
  {
    return _calculations.isCurrentNumberADecimal();
  }
  void _processTripleDigitOrLongerNumber() {}
  bool _isCurrentNumberDoubleDigit() {
    return _calculations.isCurrentNumberDoubleDigit();
  }
  bool _isCurrentNumberSingleDigit() {
    return _calculations.isCurrentNumberSingleDigit();
  }

}
