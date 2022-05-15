import 'package:calculator/models/calculator_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main()
{

  test('Counter value should be incremented', () {
     var counter = 0;

    counter++;

    expect(counter, 1);
  });



  group('addOperand', ()
  {
    var calculator = CalculatorModel();
    setUp((){

    //  calculator = CalculatorModel();
    }
    );
    tearDown((){
      calculator = CalculatorModel();//
    });

    // Its difficult to test this function because it does so amany things
    // It checks if the equalButtonWasPressed
    //     if it was it resets resultofCalculations and set the e
    test('add Operand when equal button was pressed ', (){
      calculator.hasEqualButtonBeenPressed = true;
      calculator.calculations.resultOfCalculations = 55.5;

    });





  });


}