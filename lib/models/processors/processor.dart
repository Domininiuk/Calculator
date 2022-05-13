abstract class Processor
{
   String _currentNumber = "";
  double _resultOfCalculations = 0.0;
  double _formerResult = 0.0;

   double process(
       String currentNumber, double resultOfCalculations, double formerResult) {
     _initializeVariables(currentNumber, resultOfCalculations, formerResult);

     if (_isCurrentNumberTripleDigitOrLonger()) {
       _processTripleDigitOrLongerNumber();
     } else if (_isCurrentNumberDoubleDigit()) {
       _processDoubleDigitNumber();
     } else if (_isCurrentNumberSingleDigit()) {
       _processSingleDigitNumber();
     }
     return _resultOfCalculations;
   }

   // They are initialized though. Maybe _update?
   void _initializeVariables(
       String currentNumber, double resultOfCalculations, double formerResult) {
     _initializeCurrentNumber(currentNumber);
     _initializeResultOfCalculations(resultOfCalculations);
     _initializeFormerResult(formerResult);
   }

   void _initializeCurrentNumber(String currentNumber) {
     _currentNumber = currentNumber;
   }

   void _initializeResultOfCalculations(double resultOfCalculations) {
     _resultOfCalculations = resultOfCalculations;
   }

   void _initializeFormerResult(double formerResult) {
     _formerResult = formerResult;
   }

   bool _isCurrentNumberTripleDigitOrLonger() {
     return _currentNumber.length >= 3;
   }

   void _processTripleDigitOrLongerNumber() {
     if (_isCurrentNumberSmallerThanOne() && !_isCurrentNumberAllZeroes()) {
       _updateResultOfCalculations();
       calculateResultOfCalculations();
     } else if (_isCurrentNumberAllZeroes()) {
       _doNothing();
     } else {
       _reverseCalculationOfAllPreviousDigits();
       calculateResultOfCalculations();
     }
   }

   bool _isCurrentNumberAllZeroes() {
     return !_currentNumber.contains(RegExp(r'[1-9]')) &&
         _currentNumber.contains("0");
   }

   void _updateResultOfCalculations() {
     _resultOfCalculations = _formerResult;
   }

   bool _isCurrentNumberDoubleDigit() {
     return _currentNumber.length == 2;
   }

   void _reverseCalculationOfAllPreviousDigits() {


   }

   bool _isCurrentNumberSmallerThanOne() {
     return _currentNumber.substring(0, 2) == "0.";
   }

   void _processDoubleDigitNumber() {
     if (_isFirstDigitZero()) {
       _doNothing();
     } else {
       reverseCalculationOfFirstDigit();
       calculateResultOfCalculations();
     }
     calculateResultOfCalculations();
   }

   void reverseCalculationOfFirstDigit() {
   }

   void _doNothing() {}

   bool _isFirstDigitZero() {
     return _currentNumber[0] == "0";
   }

   bool _isCurrentNumberSingleDigit() {
     return _currentNumber.length == 1;
   }

   void _processSingleDigitNumber() {
     if (_isCurrentNumberZero()) {
       _updateFormerResult();
     }
   }

   bool _isCurrentNumberZero() {
     return _currentNumber == "0";
   }

   void _updateFormerResult() {
     _formerResult = _resultOfCalculations;
   }

   void calculateResultOfCalculations() {
     _resultOfCalculations *= double.tryParse(_currentNumber)!;
   }
  
  
  
  
  
}