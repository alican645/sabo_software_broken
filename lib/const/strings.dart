

import 'package:flutter/material.dart';

class Strings {
  TextStyle  cardWidgetStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 15,
    fontWeight: FontWeight.w500,
    height: 22 / 15,
    letterSpacing: -0.4,
    textBaseline: TextBaseline.alphabetic,
  );

  TextStyle mainTitleStyle = TextStyle(
    fontFamily: 'Inter Tight',
    fontSize: 17,
    fontWeight: FontWeight.w600,
    height: 22 / 17,
    textBaseline: TextBaseline.alphabetic,
  );

  TextStyle tasitlarimTextStyle = TextStyle(
    fontFamily: 'Inter Tight',
    fontSize: 19,
    fontWeight: FontWeight.w600,
    height: 1.26,
    letterSpacing: -0.4,
  );

  TextStyle sehirAdiTextStyle =  TextStyle(
    color: Colors.white,
    fontFamily: 'Inter Tight',
    fontSize: 25,
    fontWeight: FontWeight.w700,
    height: 30.25 / 25,
    letterSpacing: -0.02,
    textBaseline: TextBaseline.alphabetic,
  );

  TextStyle turkiyeTextStyle = const TextStyle(
    color: Colors.white,
    fontFamily: 'Inter Tight',
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 18.15 / 15,
    textBaseline: TextBaseline.alphabetic,
  );

  String tasitlarim = "Taşıtlarım";
  String anaLiman ="Ana Liman" ;
  String sehir="Şehir";
  String ucretOlmayanLimanlar = "Ekstra Ücret Uygulamayan Limanlar";
}