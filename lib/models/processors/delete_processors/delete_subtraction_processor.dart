import '../../calculations.dart';
import 'delete_processor.dart';
import 'package:rational/rational.dart';

class DeleteSubtractionProcessor implements DeleteCalculationProcessor {
  DeleteSubtractionProcessor(this._calculations, this._collectedCurrentNumber);
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
    _addRemainingDigitsToResultOfCalculations();
  }

  void _reverseCalculationOfCurrentNumber() {
    _calculations.addToResultOfCalculations(_collectedCurrentNumber);
  }

  void _addRemainingDigitsToResultOfCalculations() {
    _calculations.subtractFromResultOfCalculations(_collectedCurrentNumber
        .substring(0, _collectedCurrentNumber.length - 1));
  }

  bool _isCurrentNumberDoubleDigit() {
    return _calculations.isCurrentNumberDoubleDigit();
  }

  void _processDoubleDigitNumber() {
    _reverseCalculationOfCurrentNumber();
    _subtractBackFirstDigitFromResult();
  }

  void _subtractBackFirstDigitFromResult() {
    _calculations.subtractFromResultOfCalculations(_collectedCurrentNumber[0]);
  }

  bool _isCurrentNumberSingleDigit() {
    return _calculations.isCurrentNumberSingleDigit();
  }

  void _processSingleDigitNumber() {
    _reverseCalculationOfCurrentNumber();
  }
}
