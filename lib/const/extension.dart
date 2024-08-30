

import 'package:flutter/material.dart';

extension PhoneData on BuildContext {
  double  phoneSizeHeight(double fraction) => MediaQuery.of(this).size.height * fraction ;
  double  phoneSizeWidth(double fraction) => MediaQuery.of(this).size.height * fraction ;

  TextStyle? get textStyleLarge => Theme.of(this).textTheme.headlineLarge ;
  TextStyle? get textStyleMedium => Theme.of(this).textTheme.headlineMedium ; //17px
  TextStyle? get mainTitleFont => Theme.of(this).textTheme.headlineMedium?.copyWith(fontSize: 17) ;
  TextStyle? get cardTextFont => Theme.of(this).textTheme.headlineMedium?.copyWith(fontSize: 15) ;
}

