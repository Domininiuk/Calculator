import 'package:calculator/common/constants.dart';
import 'package:calculator/models/calculations.dart';
import 'package:calculator/models/processors/addition_processor.dart';
import 'package:calculator/models/processors/division_processor.dart';
import 'package:calculator/models/processors/multiplication_processor.dart';
import 'package:calculator/models/processors/subtraction_processor.dart';


abstract class CalculationProcessor
{
  factory CalculationProcessor(String type, CalculationsModel calculations)
  {
    switch (type){
      case addition: return AdditionProcessor(calculations);
      case subtraction: return SubtractionProcessor(calculations);
      case multiplication: return MultiplicationProcessor(calculations);
      case division: return DivisionProcessor(calculations);
      default:
        return AdditionProcessor(calculations);
    }
  }

  CalculationsModel process();

  
}