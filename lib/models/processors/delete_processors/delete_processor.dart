import 'package:calculator/models/calculations.dart';

import '../../../common/constants.dart';
import 'delete_addition_processor.dart';
import 'delete_division_processor.dart';
import 'delete_multiplication_processor.dart';
import 'delete_subtraction_processor.dart';

abstract class DeleteCalculationProcessor {
  factory DeleteCalculationProcessor(
      String type, CalculationsModel calculations, String collectedNumber) {
    switch (type) {
      case addition:
        return DeleteAdditionProcessor(calculations, collectedNumber);
      case subtraction:
        return DeleteSubtractionProcessor(calculations, collectedNumber);
      case multiplication:
        return DeleteMultiplicationProcessor(calculations, collectedNumber);
      case division:
        return DeleteDivisionProcessor(calculations, collectedNumber);
      default:
        return DeleteAdditionProcessor(calculations, collectedNumber);
    }
  }

  CalculationsModel process();
}
