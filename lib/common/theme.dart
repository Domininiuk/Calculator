import 'package:flutter/material.dart';


Map<int, Color> color ={50:const Color.fromRGBO(136,14,79, .1),100:const Color.fromRGBO(136,14,79, .2),200:const Color.fromRGBO(136,14,79, .3),300:const Color.fromRGBO(136,14,79, .4),400:const Color.fromRGBO(136,14,79, .5),500:const Color.fromRGBO(136,14,79, .6),600:const Color.fromRGBO(136,14,79, .7),700:const Color.fromRGBO(136,14,79, .8),800:const Color.fromRGBO(136,14,79, .9),900:const Color.fromRGBO(136,14,79, 1),};
MaterialColor colorCustom = MaterialColor(0xFF880E4F, color);
final appTheme = ThemeData(
    primarySwatch: colorCustom,
    textTheme: const TextTheme(
        headline1: TextStyle(
            fontFamily: 'Corben',
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Colors.black)));


final operandButtonTheme = OutlinedButton.styleFrom( shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(40)

),
    textStyle: const TextStyle(
      color: Colors.grey
    ),
    backgroundColor: color[300]);
final operatorButtonTheme = OutlinedButton.styleFrom( shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20)

),
    textStyle: const TextStyle(
        color: Colors.grey
    ),
    backgroundColor: color[600]);

final deleteButtonTheme = OutlinedButton.styleFrom( shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20)

),
    textStyle: const TextStyle(
        color: Colors.grey
    ),
    backgroundColor: color[600]);