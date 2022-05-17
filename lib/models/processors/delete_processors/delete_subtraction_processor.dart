import '../../calculations.dart';
import 'delete_processor.dart';
import 'package:rational/rational.dart';
class DeleteSubtractionProcessor implements DeleteCalculationProcessor {
  DeleteSubtractionProcessor(this._calculations, this._collectedCurrentNumber);
  CalculationsModel _calculations;
  String _collectedCurrentNumber;

  @override
  CalculationsModel process() {
    if (_isCurrentNumberTripleDigitOrLonger()) {
      _calculations.addToResultOfCalculations(_collectedCurrentNumber);
      _calculations.subtractFromResultOfCalculations(_collectedCurrentNumber.substring(
          0, _collectedCurrentNumber.length - 1));
    } else if (_isCurrentNumberDoubleDigit()) {
      _calculations.addToResultOfCalculations(_collectedCurrentNumber);
      _calculations.subtractFromResultOfCalculations(_collectedCurrentNumber[0]);

    } else if (_isCurrentNumberSingleDigit()) {
      _calculations.addToResultOfCalculations(_collectedCurrentNumber);
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
