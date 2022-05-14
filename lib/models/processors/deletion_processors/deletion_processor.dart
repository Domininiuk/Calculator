import 'package:calculator/models/calculations.dart';

import '../../../common/constants.dart';
import '../addition_processor.dart';

abstract class DeletionProcessor
{

  /*
  factory DeletionProcessor(String type, CalculationsModel calculations)
  {
    switch (type){
      case addition: return DeletionAdditionProcessor(calculations);
      case subtraction: return DeletionSubtractionProcessor(calculations);
      case multiplication: return DeletionMultiplicationProcessor(calculations);
      case division: return DivisionProcessor(calculations);
      default:
        return DeletionAdditionProcessor(calculations);
    }
  }



   */

  CalculationsModel process();
}