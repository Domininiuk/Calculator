import 'package:flutter/material.dart';


Map<int, Color> color ={50:Color.fromRGBO(136,14,79, .1),100:Color.fromRGBO(136,14,79, .2),200:Color.fromRGBO(136,14,79, .3),300:Color.fromRGBO(136,14,79, .4),400:Color.fromRGBO(136,14,79, .5),500:Color.fromRGBO(136,14,79, .6),600:Color.fromRGBO(136,14,79, .7),700:Color.fromRGBO(136,14,79, .8),800:Color.fromRGBO(136,14,79, .9),900:Color.fromRGBO(136,14,79, 1),};
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
  borderRadius: BorderRadius.circular(50)
),
    textStyle: TextStyle(
      color: Colors.grey
    ),
    backgroundColor: color[300]);