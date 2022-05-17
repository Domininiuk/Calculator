import 'package:decimal/decimal.dart';

import '../../calculations.dart';
import 'delete_processor.dart';
import 'package:rational/rational.dart';
class DeleteDivisionProcessor implements DeleteCalculationProcessor {
  DeleteDivisionProcessor(this._calculations, this._collectedCurrentNumber);
  CalculationsModel _calculations;
  String _collectedCurrentNumber;

  @override
  CalculationsModel process() {
    _calculations.currentNumber = _collectedCurrentNumber;

    if (_isCurrentNumberTripleDigitOrLonger()) {
      _calculations.multiplyResultOfCalculations(_collectedCurrentNumber);
      _calculations.divideResultOfCalculations(_collectedCurrentNumber.substring(
          0, _collectedCurrentNumber.length - 1));
    } else if (_isCurrentNumberDoubleDigit()) {
      _calculations.multiplyResultOfCalculations(_collectedCurrentNumber);
      _calculations.divideResultOfCalculations(_collectedCurrentNumber[0]);

    } else if (_isCurrentNumberSingleDigit()) {
      _calculations.multiplyResultOfCalculations(_collectedCurrentNumber);
    }

    return _calculations;
  }
  bool _isCurrentNumberTripleDigitOrLonger() {
    return _calculations.isCurrentNumberTripleDigitOrLonger();
  }

  void _processTripleDigitOrLongerNumber() {}
  bool _isCurrentNumberDoubleDigit() {
    return _calculations.isCurrentNumberDoubleDigit();
  }
  bool _isCurrentNumberSingleDigit() {
    return _calculations.isCurrentNumberSingleDigit();
  }

}
