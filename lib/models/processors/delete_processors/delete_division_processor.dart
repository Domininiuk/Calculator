import '../../calculations.dart';
import 'delete_processor.dart';
class DeleteDivisionProcessor implements DeleteCalculationProcessor {
  DeleteDivisionProcessor(this._calculations, this._collectedCurrentNumber);
  final CalculationsModel _calculations;
  final String _collectedCurrentNumber;


  // Zeroes after the . in decimal numbers dont matter e.g .90000040004
  // But they do matter in the numbers before them e.g. 900000000.44444

  // CURRENT BUG
  // 0.9 / 0.3 = with each new 0 added to 0.3 it will divided again by 0.30, 0.300 etc
  @override
  CalculationsModel process() {
    _calculations.currentNumber = _collectedCurrentNumber;
    if(_isLastDigitInCurrentNumberAZero())
    {
      return _calculations;
    }
    if (_isCurrentNumberTripleDigitOrLonger()) {

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
  bool _isLastDigitInCurrentNumberAZero()
  {
    return _calculations.isLastDigitInCurrentNumberAZero();
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
