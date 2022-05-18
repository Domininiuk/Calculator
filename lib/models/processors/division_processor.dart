import 'package:calculator/models/processors/calculation_processor.dart';

import '../calculations.dart';
import 'package:rational/rational.dart';

class DivisionProcessor implements CalculationProcessor {
  DivisionProcessor(this._calculations);
  final CalculationsModel _calculations;

  @override
  CalculationsModel process() {
    if (_isLastDigitInCurrentNumberAZero()) {
      return _calculations;
    }
    if (_isCurrentNumberTripleDigitOrLonger()) {
      _processTripleDigitOrLongerNumber();
    } else if (_isCurrentNumberDoubleDigit()) {
      _processDoubleDigitNumber();
    } else if (_isCurrentNumberSingleDigit()) {
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
    if (_isCurrentNumberSmallerThanOne() && !_isCurrentNumberAllZeroes()) {
      //_updateResultOfCalculations();
      divideResultOfCalculations();
    } else if (_isCurrentNumberAllZeroes()) {
      _doNothing();
    } else {
      _reverseCalculationOfAllPreviousDigits();
      divideResultOfCalculations();
    }
  }

  bool _isCurrentNumberAllZeroes() {
    return _calculations.isCurrentNumberAllZeroes();
  }

  // It displays zero because this method changes the value of resultOfCalculations to 0?
  void _updateResultOfCalculations() {
    _calculations.updateResultOfCalculations();
  }

  bool _isCurrentNumberDoubleDigit() {
    return _calculations.isCurrentNumberDoubleDigit();
  }

  void _reverseCalculationOfAllPreviousDigits() {
    _calculations.resultOfCalculations *= Rational.tryParse(_calculations
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
      divideResultOfCalculations();
    }
  }

  void reverseCalculationOfFirstDigit() {
    _calculations.resultOfCalculations *=
        Rational.tryParse(_calculations.currentNumber[0])!;
  }

  void _doNothing() {}

  bool _isFirstDigitZero() {
    return _calculations.isFirstDigitZero();
  }

  bool _isCurrentNumberSingleDigit() {
    return _calculations.isCurrentNumberSingleDigit();
  }

  void _processSingleDigitNumber() {
    if (!_isCurrentNumberZero()) {
      _updateFormerResult();
      divideResultOfCalculations();
    }
  }

  bool _isCurrentNumberZero() {
    return _calculations.isCurrentNumberZero();
  }

  void _updateFormerResult() {
    _calculations.updateFormerResult();
  }

  void divideResultOfCalculations() {
    _calculations.resultOfCalculations /=
        Rational.tryParse(_calculations.currentNumber)!;
  }
}
