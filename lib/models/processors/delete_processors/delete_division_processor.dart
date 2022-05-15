import '../../calculations.dart';
import 'delete_processor.dart';

class DeleteDivisionProcessor implements DeleteCalculationProcessor {
  DeleteDivisionProcessor(this.calculations, this.collectedCurrentNumber);
  CalculationsModel calculations;
  String collectedCurrentNumber;

  @override
  CalculationsModel process() {
    var currentNumber = collectedCurrentNumber;
    if (currentNumber.length > 2) {
      var newResult =
          calculations.resultOfCalculations * double.tryParse(currentNumber)!;
      newResult /= double.tryParse(
          currentNumber.substring(0, currentNumber.length - 1))!;
      calculations.resultOfCalculations = newResult;
    } else if (currentNumber.length == 2) {
      var newResult =
          calculations.resultOfCalculations * double.tryParse(currentNumber)!;
      newResult /= double.tryParse(currentNumber[0])!;

      calculations.resultOfCalculations = newResult;
    } else if (currentNumber.length == 1) {
      var newResult =
          calculations.resultOfCalculations / double.tryParse(currentNumber)!;
      calculations.resultOfCalculations = newResult;
    }

    return calculations;
  }
}
