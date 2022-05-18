import '../../calculations.dart';
import 'delete_processor.dart';

class DeleteDivisionProcessor implements DeleteCalculationProcessor {
  DeleteDivisionProcessor(this._calculations, this._collectedCurrentNumber);
  final CalculationsModel _calculations;
  final String _collectedCurrentNumber;

  @override
  CalculationsModel process() {
    _calculations.currentNumber = _collectedCurrentNumber;
    if (_isLastDigitInCurrentNumberAZero()) {
      return _calculations;
    }
    if (_isCurrentNumberTripleDigitOrLonger()) {
      _processTripleDigitOrLongerNumber();
    } else if (_isCurrentNumberDoubleDigit()) {
      _processDoubleDigitNumber();
    } else if (_isCurrentNumberSingleDigit() &&
        !_calculations.isCurrentNumberZero()) {
      _processSingleDigitNumber();
    }

    return _calculations;
  }

  bool _isLastDigitInCurrentNumberAZero() {
    return _calculations.isLastDigitInCurrentNumberAZero();
  }

  bool _isCurrentNumberTripleDigitOrLonger() {
    return _calculations.isCurrentNumberTripleDigitOrLonger();
  }

  void _processTripleDigitOrLongerNumber() {
    if (_isCurrentNumberADecimal() &&
        _calculations.isCurrentNumberSmallerThanOne() &&
        _calculations.currentNumberHasOnlyOneDigitDifferentToZero()) {
      _reverseCalculationOfCurrentNumber();
    } else {
      _reverseCalculationOfCurrentNumber();
      _divideBackTheRemainingDigits();
    }
  }

  void _reverseCalculationOfCurrentNumber() {
    _calculations.multiplyResultOfCalculations(_collectedCurrentNumber);
  }

  void _divideBackTheRemainingDigits() {
    _calculations.divideResultOfCalculations(_collectedCurrentNumber.substring(
        0, _collectedCurrentNumber.length - 1));
  }

  void _processDoubleDigitNumber() {
    _reverseCalculationOfCurrentNumber();
    _divideBackTheFirstDigit();
  }

  void _divideBackTheFirstDigit() {
    _calculations.divideResultOfCalculations(_collectedCurrentNumber[0]);
  }

  void _processSingleDigitNumber() {
    _reverseCalculationOfCurrentNumber();
  }

  bool _isCurrentNumberADecimal() {
    return _calculations.isCurrentNumberADecimal();
  }

  bool _isCurrentNumberDoubleDigit() {
    return _calculations.isCurrentNumberDoubleDigit();
  }

  bool _isCurrentNumberSingleDigit() {
    return _calculations.isCurrentNumberSingleDigit();
  }
}
