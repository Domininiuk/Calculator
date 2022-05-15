import 'package:calculator/models/calculator_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main()
{

  test('Counter value should be incremented', () {
     var counter = 0;

    counter++;

    expect(counter, 1);
  });




    var calculator = CalculatorModel();
    setUp((){

    //  calculator = CalculatorModel();
    }
    );
    tearDown((){
      calculator = CalculatorModel();//
    });


    group('addition', (){

      test('5', ()
      {
        calculator.addOperand('5');


        expect(calculator.actions.length, 1);
        expect(calculator.isSameNumber, true);
        expect(calculator.deletedDigits, "");
        expect(calculator.displayedActions,  "5");
        expect(calculator.calculations.resultOfCalculations, 5.00);
      });
      test('55', ()
      {
        calculator.addOperand('5');
        calculator.addOperand('5');

        expect(calculator.actions.length, 2);
        expect(calculator.isSameNumber, true);
        expect(calculator.deletedDigits, "");
        expect(calculator.displayedActions,  "55");
        expect(calculator.calculations.resultOfCalculations, 55.00);
      });

      test('55.02', ()
      {
        calculator.addOperand('5');
        calculator.addOperand('5');
        calculator.addOperand('.');
        calculator.addOperand('0');
        calculator.addOperand('2');

        expect(calculator.actions.length, 5);
        expect(calculator.isSameNumber, true);
        expect(calculator.deletedDigits, "");
        expect(calculator.displayedActions,  "55.02");
        expect(calculator.calculations.resultOfCalculations, 55.02);
      });

      test('5 + 0.5', ()
      {
        calculator.addOperand('5');
        calculator.addOperator('+');
        calculator.addOperand('0');
        calculator.addOperand('.');
        calculator.addOperand('5');

        expect(calculator.actions.length, 5);
        expect(calculator.isSameNumber, true);
        expect(calculator.deletedDigits, "");
        expect(calculator.displayedActions,  "5+0.5");
        expect(calculator.calculations.resultOfCalculations, 5.5);
      });
      test('5 + 0.05', ()
      {
        calculator.addOperand('5');
        calculator.addOperator('+');
        calculator.addOperand('0');
        calculator.addOperand('.');
        calculator.addOperand('0');
        calculator.addOperand('5');

        expect(calculator.actions.length, 6);
        expect(calculator.isSameNumber, true);
        expect(calculator.deletedDigits, "");
        expect(calculator.displayedActions,  "5+0.05");
        expect(calculator.calculations.resultOfCalculations, 5.05);
      });
      test('5 + 0.005', ()
      {
        calculator.addOperand('5');
        calculator.addOperator('+');
        calculator.addOperand('0');
        calculator.addOperand('.');
        calculator.addOperand('0');
        calculator.addOperand('0');
        calculator.addOperand('5');

        expect(calculator.actions.length, 7);
        expect(calculator.isSameNumber, true);
        expect(calculator.deletedDigits, "");
        expect(calculator.displayedActions,  "5+0.005");
        expect(calculator.calculations.resultOfCalculations, 5.005);
      });

      test('5 + 5.555', ()
      {
        calculator.addOperand('5');
        calculator.addOperator('+');
        calculator.addOperand('5');
        calculator.addOperand('.');
        calculator.addOperand('5');
        calculator.addOperand('5');
        calculator.addOperand('5');

        expect(calculator.actions.length, 7);
        expect(calculator.isSameNumber, true);
        expect(calculator.deletedDigits, "");
        expect(calculator.displayedActions,  "5+5.555");
        expect(calculator.calculations.resultOfCalculations, 10.555);
      });
      test('5 + 55', ()
      {
        calculator.addOperand('5');
        calculator.addOperator('+');
        calculator.addOperand('5');
        calculator.addOperand('5');

        expect(calculator.actions.length, 4);
        expect(calculator.isSameNumber, true);
        expect(calculator.deletedDigits, "");
        expect(calculator.displayedActions,  "5+55");
        expect(calculator.calculations.resultOfCalculations, 60.00);
      });
      test('5 + 5567890', ()
      {
        calculator.addOperand('5');
        calculator.addOperator('+');
        calculator.addOperand('5');
        calculator.addOperand('5');
        calculator.addOperand('6');
        calculator.addOperand('7');
        calculator.addOperand('8');
        calculator.addOperand('9');
        calculator.addOperand('0');






        expect(calculator.actions.length, 9);
        expect(calculator.isSameNumber, true);
        expect(calculator.deletedDigits, "");
        expect(calculator.displayedActions,  "5+5567890");
        expect(calculator.calculations.resultOfCalculations, 5567895.00);
      });
    });

    group('subtraction', (){
      test('5 - 0.5', ()
      {
        calculator.addOperand('5');
        calculator.addOperator('-');
        calculator.addOperand('0');
        calculator.addOperand('.');
        calculator.addOperand('5');

        expect(calculator.actions.length, 5);
        expect(calculator.isSameNumber, true);
        expect(calculator.deletedDigits, "");
        expect(calculator.displayedActions,  "5-0.5");
        expect(calculator.calculations.resultOfCalculations, 4.5);
      });
      test('5 - 0.05', ()
      {
        calculator.addOperand('5');
        calculator.addOperator('-');
        calculator.addOperand('0');
        calculator.addOperand('.');
        calculator.addOperand('0');
        calculator.addOperand('5');

        expect(calculator.actions.length, 6);
        expect(calculator.isSameNumber, true);
        expect(calculator.deletedDigits, "");
        expect(calculator.displayedActions,  "5-0.05");
        expect(calculator.calculations.resultOfCalculations, 4.95);
      });
      test('5 + 0.005', ()
      {
        calculator.addOperand('5');
        calculator.addOperator('+');
        calculator.addOperand('0');
        calculator.addOperand('.');
        calculator.addOperand('0');
        calculator.addOperand('0');
        calculator.addOperand('5');

        expect(calculator.actions.length, 7);
        expect(calculator.isSameNumber, true);
        expect(calculator.deletedDigits, "");
        expect(calculator.displayedActions,  "5+0.005");
        expect(calculator.calculations.resultOfCalculations, 5.005);
      });

      test('5 - 5.555', ()
      {
        calculator.addOperand('5');
        calculator.addOperator('-');
        calculator.addOperand('5');
        calculator.addOperand('.');
        calculator.addOperand('5');
        calculator.addOperand('5');
        calculator.addOperand('5');

        expect(calculator.actions.length, 7);
        expect(calculator.isSameNumber, true);
        expect(calculator.deletedDigits, "");
        expect(calculator.displayedActions,  "5-5.555");
        expect(calculator.calculations.resultOfCalculations.toStringAsFixed(3), (-0.555).toString());
      });
      test('5 - 55', ()
      {
        calculator.addOperand('5');
        calculator.addOperator('-');
        calculator.addOperand('5');
        calculator.addOperand('5');

        expect(calculator.actions.length, 4);
        expect(calculator.isSameNumber, true);
        expect(calculator.deletedDigits, "");
        expect(calculator.displayedActions,  "5-55");
        expect(calculator.calculations.resultOfCalculations.
        toStringAsFixed(3), (-50.000).toStringAsFixed(3));
      });
      test('5 - 5567890', ()
      {
        calculator.addOperand('5');
        calculator.addOperator('-');
        calculator.addOperand('5');
        calculator.addOperand('5');
        calculator.addOperand('6');
        calculator.addOperand('7');
        calculator.addOperand('8');
        calculator.addOperand('9');
        calculator.addOperand('0');






        expect(calculator.actions.length, 9);
        expect(calculator.isSameNumber, true);
        expect(calculator.deletedDigits, "");
        expect(calculator.displayedActions,  "5-5567890");
        expect(calculator.calculations.resultOfCalculations.
            toStringAsFixed(3), (-5567885.000).toStringAsFixed(3));
      });
    });
  group('division', (){
    test('5 ÷ 0.5', ()
    {
      calculator.addOperand('5');
      calculator.addOperator('÷');
      calculator.addOperand('0');
      calculator.addOperand('.');
      calculator.addOperand('5');

      expect(calculator.actions.length, 5);
      expect(calculator.isSameNumber, true);
      expect(calculator.deletedDigits, "");
      expect(calculator.displayedActions,  "5÷0.5");
      expect(calculator.calculations.resultOfCalculations, 10);
    });
    test('5 ÷ 0.05', ()
    {
      calculator.addOperand('5');
      calculator.addOperator('÷');
      calculator.addOperand('0');
      calculator.addOperand('.');
      calculator.addOperand('0');
      calculator.addOperand('5');

      expect(calculator.actions.length, 6);
      expect(calculator.isSameNumber, true);
      expect(calculator.deletedDigits, "");
      expect(calculator.displayedActions,  "5÷0.05");
      expect(calculator.calculations.resultOfCalculations, 100);
    });
    test('5 ÷ 0.005', ()
    {
      calculator.addOperand('5');
      calculator.addOperator('÷');
      calculator.addOperand('0');
      calculator.addOperand('.');
      calculator.addOperand('0');
      calculator.addOperand('0');
      calculator.addOperand('5');

      expect(calculator.actions.length, 7);
      expect(calculator.isSameNumber, true);
      expect(calculator.deletedDigits, "");
      expect(calculator.displayedActions,  "5÷0.005");
      expect(calculator.calculations.resultOfCalculations, 1000);
    });

    test('5 ÷ 5.555', ()
    {
      calculator.addOperand('5');
      calculator.addOperator('÷');
      calculator.addOperand('5');
      calculator.addOperand('.');
      calculator.addOperand('5');
      calculator.addOperand('5');
      calculator.addOperand('5');

      expect(calculator.actions.length, 7);
      expect(calculator.isSameNumber, true);
      expect(calculator.deletedDigits, "");
      expect(calculator.displayedActions,  "5÷5.555");
      expect(calculator.calculations.resultOfCalculations.
      toStringAsFixed(3), (0.900).toStringAsFixed(3));
    });
    test('5 ÷ 55', ()
    {
      calculator.addOperand('5');
      calculator.addOperator('÷');
      calculator.addOperand('5');
      calculator.addOperand('5');

      expect(calculator.actions.length, 4);
      expect(calculator.isSameNumber, true);
      expect(calculator.deletedDigits, "");
      expect(calculator.displayedActions,  "5÷55");
      expect(calculator.calculations.resultOfCalculations.
      toStringAsFixed(3), (0.091).toStringAsFixed(3));
    });
    test('5 ÷ 5567890', ()
    {
      calculator.addOperand('5');
      calculator.addOperator('÷');
      calculator.addOperand('5');
      calculator.addOperand('5');
      calculator.addOperand('6');
      calculator.addOperand('7');
      calculator.addOperand('8');
      calculator.addOperand('9');
      calculator.addOperand('0');






      expect(calculator.actions.length, 9);
      expect(calculator.isSameNumber, true);
      expect(calculator.deletedDigits, "");
      expect(calculator.displayedActions,  "5÷5567890");
      expect(calculator.calculations.resultOfCalculations.
      toStringAsFixed(3), (0.000).toStringAsFixed(3));
    });
  });
  group('multiplication', (){
    test('5 * 0.5', ()
    {
      calculator.addOperand('5');
      calculator.addOperator('x');
      calculator.addOperand('0');
      calculator.addOperand('.');
      calculator.addOperand('5');

      expect(calculator.actions.length, 5);
      expect(calculator.isSameNumber, true);
      expect(calculator.deletedDigits, "");
      expect(calculator.displayedActions,  "5x0.5");
      expect(calculator.calculations.resultOfCalculations, 2.5);
    });
    test('5 x 0.05', ()
    {
      calculator.addOperand('5');
      calculator.addOperator('x');
      calculator.addOperand('0');
      calculator.addOperand('.');
      calculator.addOperand('0');
      calculator.addOperand('5');

      expect(calculator.actions.length, 6);
      expect(calculator.isSameNumber, true);
      expect(calculator.deletedDigits, "");
      expect(calculator.displayedActions,  "5x0.05");
      expect(calculator.calculations.resultOfCalculations, 0.25);
    });
    test('5 x 0.005', ()
    {
      calculator.addOperand('5');
      calculator.addOperator('x');
      calculator.addOperand('0');
      calculator.addOperand('.');
      calculator.addOperand('0');
      calculator.addOperand('0');
      calculator.addOperand('5');

      expect(calculator.actions.length, 7);
      expect(calculator.isSameNumber, true);
      expect(calculator.deletedDigits, "");
      expect(calculator.displayedActions,  "5x0.005");
      expect(calculator.calculations.resultOfCalculations, 0.025);
    });

    test('5 x 5.555', ()
    {
      calculator.addOperand('5');
      calculator.addOperator('x');
      calculator.addOperand('5');
      calculator.addOperand('.');
      calculator.addOperand('5');
      calculator.addOperand('5');
      calculator.addOperand('5');

      expect(calculator.actions.length, 7);
      expect(calculator.isSameNumber, true);
      expect(calculator.deletedDigits, "");
      expect(calculator.displayedActions,  "5x5.555");
      expect(calculator.calculations.resultOfCalculations.
      toStringAsFixed(3), (27.775).toString());
    });
    test('5 x 55', ()
    {
      calculator.addOperand('5');
      calculator.addOperator('x');
      calculator.addOperand('5');
      calculator.addOperand('5');

      expect(calculator.actions.length, 4);
      expect(calculator.isSameNumber, true);
      expect(calculator.deletedDigits, "");
      expect(calculator.displayedActions,  "5x55");
      expect(calculator.calculations.resultOfCalculations.
      toStringAsFixed(3), (275).toStringAsFixed(3));
    });
    test('5 x 5567890', ()
    {
      calculator.addOperand('5');
      calculator.addOperator('x');
      calculator.addOperand('5');
      calculator.addOperand('5');
      calculator.addOperand('6');
      calculator.addOperand('7');
      calculator.addOperand('8');
      calculator.addOperand('9');
      calculator.addOperand('0');






      expect(calculator.actions.length, 9);
      expect(calculator.isSameNumber, true);
      expect(calculator.deletedDigits, "");
      expect(calculator.displayedActions,  "5x5567890");
      expect(calculator.calculations.resultOfCalculations.
      toStringAsFixed(3), (27839450).toStringAsFixed(3));
    });
  });

  group('mixed calculations', (){

    test('4+4x4÷4-4', ()
    {
      calculator.addOperand('4');
      calculator.addOperator('+');
      calculator.addOperand('4');
      calculator.addOperator('x');
      calculator.addOperand('4');
      calculator.addOperator('÷');
      calculator.addOperand('4');
      calculator.addOperator('-');
      calculator.addOperand('4');


      expect(calculator.actions.length, 9);
      expect(calculator.isSameNumber, true);
      expect(calculator.deletedDigits, "");
      expect(calculator.displayedActions,  "4+4x4÷4-4");
      expect(calculator.calculations.resultOfCalculations.
      toStringAsFixed(3), (4).toStringAsFixed(3));
    });

    test('40+40x40÷40-40', ()
    {
      calculator.addOperand('4');
      calculator.addOperand('0');
      calculator.addOperator('+');
      calculator.addOperand('4');
      calculator.addOperand('0');
      calculator.addOperator('x');
      calculator.addOperand('4');
      calculator.addOperand('0');
      calculator.addOperator('÷');
      calculator.addOperand('4');
      calculator.addOperand('0');
      calculator.addOperator('-');
      calculator.addOperand('4');
      calculator.addOperand('0');

      expect(calculator.actions.length, 14);
      expect(calculator.isSameNumber, true);
      expect(calculator.deletedDigits, "");
      expect(calculator.displayedActions,  "40+40x40÷40-40");
      expect(calculator.calculations.resultOfCalculations.
      toStringAsFixed(3), (40).toStringAsFixed(3));
    });

    test('40+40x40÷40-40', ()
    {
      calculator.addOperand('4');
      calculator.addOperand('0');
      calculator.addOperator('+');
      calculator.addOperand('4');
      calculator.addOperand('0');
      calculator.addOperator('x');
      calculator.addOperand('4');
      calculator.addOperand('0');
      calculator.addOperator('÷');
      calculator.addOperand('4');
      calculator.addOperand('0');
      calculator.addOperator('-');
      calculator.addOperand('4');
      calculator.addOperand('0');

      expect(calculator.actions.length, 14);
      expect(calculator.isSameNumber, true);
      expect(calculator.deletedDigits, "");
      expect(calculator.displayedActions,  "40+40x40÷40-40");
      expect(calculator.calculations.resultOfCalculations.
      toStringAsFixed(3), (40).toStringAsFixed(3));
    });
    test('41+42x43÷44-45', ()
    {
      calculator.addOperand('4');
      calculator.addOperand('1');
      calculator.addOperator('+');
      calculator.addOperand('4');
      calculator.addOperand('2');
      calculator.addOperator('x');
      calculator.addOperand('4');
      calculator.addOperand('3');
      calculator.addOperator('÷');
      calculator.addOperand('4');
      calculator.addOperand('4');
      calculator.addOperator('-');
      calculator.addOperand('4');
      calculator.addOperand('5');

      expect(calculator.actions.length, 14);
      expect(calculator.isSameNumber, true);
      expect(calculator.deletedDigits, "");
      expect(calculator.displayedActions,  "41+42x43÷44-45");
      expect(calculator.calculations.resultOfCalculations.
      toStringAsFixed(3), (37.045).toStringAsFixed(3));
    });
  });








}