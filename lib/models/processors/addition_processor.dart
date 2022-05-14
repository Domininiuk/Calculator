import '../calculations.dart';

class AdditionProcessor {
  AdditionProcessor(this._calculations);
  final CalculationsModel _calculations;

  CalculationsModel process() {
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
    if (_isCurrentNumberSmallerThanOne() && !_isCurrentNumberAllZeroes()) {
      _updateResultOfCalculations();
      subtractResultOfCalculations();
    } else if (_isCurrentNumberAllZeroes()) {
      _doNothing();
    } else {
      _reverseCalculationOfAllPreviousDigits();
      subtractResultOfCalculations();
    }
  }

  bool _isCurrentNumberAllZeroes() {
    return _calculations.isCurrentNumberAllZeroes();
  }

  void _updateResultOfCalculations() {
    _calculations.updateResultOfCalculations();
  }

  bool _isCurrentNumberDoubleDigit() {
    return _calculations.isCurrentNumberDoubleDigit();
  }

  void _reverseCalculationOfAllPreviousDigits() {
    _calculations.resultOfCalculations -= double.tryParse(_calculations
        .currentNumber
        .substring(0, _calculations.currentNumber.length - 1))!;
  }

  bool _isCurrentNumberSmallerThanOne() {
    return _calculations.isCurrentNumberSmallerThanOne();
  }

  void _processDoubleDigitNumber() {
    if (_isFirstDigitZero()) {
      _doNothing();
    } else {
      reverseCalculationOfFirstDigit();
      subtractResultOfCalculations();
    }
  }

  void reverseCalculationOfFirstDigit() {
    _calculations.resultOfCalculations -=
        double.tryParse(_calculations.currentNumber[0])!;
  }

  void _doNothing() {}

  bool _isFirstDigitZero() {
    return _calculations.isFirstDigitZero();
  }

  bool _isCurrentNumberSingleDigit() {
    return _calculations.isCurrentNumberSingleDigit();
  }

  void _processSingleDigitNumber() {
    if (_isCurrentNumberZero()) {
      _updateFormerResult();
    }
    subtractResultOfCalculations();
  }

  bool _isCurrentNumberZero() {
    return _calculations.isCurrentNumberZero();
  }

  void _updateFormerResult() {
    _calculations.updateFormerResult();
  }

  void subtractResultOfCalculations() {
    _calculations.resultOfCalculations +=
        double.tryParse(_calculations.currentNumber)!;
  }
}
