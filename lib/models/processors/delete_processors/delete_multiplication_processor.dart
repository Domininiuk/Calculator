import '../../calculations.dart';
import 'delete_processor.dart';
import 'package:rational/rational.dart';

class DeleteMultiplicationProcessor implements DeleteCalculationProcessor {
  DeleteMultiplicationProcessor(
      this._calculations, this._collectedCurrentNumber);
  CalculationsModel _calculations;
  String _collectedCurrentNumber;

  @override
  CalculationsModel process() {
    _calculations.currentNumber = _collectedCurrentNumber;

    if (_isCurrentNumberTripleDigitOrLonger()) {
      _processTripleDigitOrLongerNumber();
    } else if (_isCurrentNumberDoubleDigit()) {
      _processDoubleDigitNumber();
    } else if (_isCurrentNumberSingleDigit()) {
      _processSingleDigitNumber();
    }

    return _calculations;
  }

  bool _isCurrentNumberTripleDigitOrLonger() {
    return _calculations.isCurrentNumberTripleDigitOrLonger();
  }

  void _processTripleDigitOrLongerNumber() {
    _reverseCalculationOfCurrentNumber();
    _multiplyBackTheRemainingDigits();
  }

  void _reverseCalculationOfCurrentNumber() {
    _calculations.divideResultOfCalculations(_collectedCurrentNumber);
  }

  void _multiplyBackTheRemainingDigits() {
    _calculations.multiplyResultOfCalculations(_collectedCurrentNumber
        .substring(0, _collectedCurrentNumber.length - 1));
  }

  bool _isCurrentNumberDoubleDigit() {
    return _calculations.isCurrentNumberDoubleDigit();
  }

  void _processDoubleDigitNumber() {
    _reverseCalculationOfCurrentNumber();
    _multiplyBackTheFirstDigit();
  }

  void _multiplyBackTheFirstDigit() {
    _calculations.multiplyResultOfCalculations(_collectedCurrentNumber[0]);
  }

  bool _isCurrentNumberSingleDigit() {
    return _calculations.isCurrentNumberSingleDigit();
  }

  void _processSingleDigitNumber() {
    _reverseCalculationOfCurrentNumber();
  }
}
