import 'package:calculator/models/calculations.dart';
import 'package:calculator/models/processors/delete_processors/delete_processor.dart';

class DeleteAdditionProcessor implements DeleteCalculationProcessor {
  DeleteAdditionProcessor(this.calculations, this.collectedCurrentNumber);
  CalculationsModel calculations;
  String collectedCurrentNumber;

  @override
  CalculationsModel process() {
    if (collectedCurrentNumber.length > 2) {
      var newResult = calculations.resultOfCalculations -
          double.tryParse(collectedCurrentNumber)!;
      newResult += double.tryParse(collectedCurrentNumber.substring(
          0, collectedCurrentNumber.length - 1))!;
      //_calculateResultAfterDeletion();
      calculations.resultOfCalculations = newResult;
      // then remove the digit from currentNumber
      // add it to new result
      // and update resultOfCalculations
    } else if (collectedCurrentNumber.length == 2) {
      var newResult = calculations.resultOfCalculations -
          double.tryParse(collectedCurrentNumber)!;
      newResult += double.tryParse(collectedCurrentNumber[0])!;

      calculations.resultOfCalculations = newResult;
    } else if (collectedCurrentNumber.length == 1) {
      var newResult = calculations.resultOfCalculations -
          double.tryParse(collectedCurrentNumber)!;
      calculations.resultOfCalculations = newResult;
    }

    return calculations;
  }
}
