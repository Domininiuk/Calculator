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
    if (_isCurrentNumberTripleDigitOrLonger()) {
      _calculations.subtractFromResultOfCalculations(_collectedCurrentNumber);
      _calculations.addToResultOfCalculations(_collectedCurrentNumber.substring(
          0, _collectedCurrentNumber.length - 1));
    } else if (_isCurrentNumberDoubleDigit()) {
      _calculations.subtractFromResultOfCalculations(_collectedCurrentNumber);
      _calculations.addToResultOfCalculations(_collectedCurrentNumber[0]);

    } else if (_isCurrentNumberSingleDigit()) {
      _calculations.subtractFromResultOfCalculations(_collectedCurrentNumber);
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
