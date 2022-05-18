import 'package:calculator/models/calculations.dart';
import 'package:calculator/models/processors/delete_processors/delete_processor.dart';
import 'package:decimal/decimal.dart';
import 'package:rational/rational.dart';

class DeleteAdditionProcessor implements DeleteCalculationProcessor {
  DeleteAdditionProcessor(this._calculations, this._collectedCurrentNumber);
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
    _addBackRemainingDigitsToResultOfCalculations();
  }

  void _reverseCalculationOfCurrentNumber() {
    _calculations.subtractFromResultOfCalculations(_collectedCurrentNumber);
  }

  void _addBackRemainingDigitsToResultOfCalculations() {
    _calculations.addToResultOfCalculations(_collectedCurrentNumber.substring(
        0, _collectedCurrentNumber.length - 1));
  }

  bool _isCurrentNumberDoubleDigit() {
    return _calculations.isCurrentNumberDoubleDigit();
  }

  void _processDoubleDigitNumber() {
    _reverseCalculationOfCurrentNumber();
    _addBackFirstDigitToResult();
  }

  void _addBackFirstDigitToResult() {
    _calculations.addToResultOfCalculations(_collectedCurrentNumber[0]);
  }

  bool _isCurrentNumberSingleDigit() {
    return _calculations.isCurrentNumberSingleDigit();
  }

  void _processSingleDigitNumber() {
    _reverseCalculationOfCurrentNumber();
  }
}
