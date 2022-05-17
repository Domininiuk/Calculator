import 'package:decimal/decimal.dart';
import 'package:rational/rational.dart';

class CalculationsModel {
  CalculationsModel(
      this.currentNumber, this.resultOfCalculations, this.formerResult);

  CalculationsModel.createEmptyModel();
  String currentNumber = "";
  Rational resultOfCalculations = Rational.parse("0.0");
  Rational formerResult = Rational.parse("0.0");

  
  void multiplyResultOfCalculations(String number)
  {
    resultOfCalculations *= Rational.parse(number);
  }
  void divideResultOfCalculations(String number)
  {
    resultOfCalculations /= Rational.parse(number);
  }
  void subtractFromResultOfCalculations(String number)
  {
    resultOfCalculations -= Rational.parse(number);
  }
  void addToResultOfCalculations(String number)
  {
    resultOfCalculations += Rational.parse(number);
  }
  void updateResultOfCalculations()
  {
    
    resultOfCalculations = formerResult;
  }
  void updateFormerResult()
  {
    formerResult = resultOfCalculations;
  }
  bool isCurrentNumberTripleDigitOrLonger() {
    return currentNumber.length >= 3;
  }

  bool isCurrentNumberAllZeroes() {
    return !currentNumber.contains(RegExp(r'[1-9]')) &&
        currentNumber.contains("0");
  }

  bool isCurrentNumberDoubleDigit() {
    return currentNumber.length == 2;
  }

  bool isCurrentNumberSmallerThanOne() {
    return currentNumber.substring(0, 2) == "0.";
  }

  bool isFirstDigitZero() {
    return currentNumber[0] == "0";
  }

  bool isCurrentNumberSingleDigit() {
    return currentNumber.length == 1;
  }

  bool isCurrentNumberZero() {
    return currentNumber == "0";
  }
}
