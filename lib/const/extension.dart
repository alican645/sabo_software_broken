

import 'package:flutter/material.dart';

extension PhoneData on BuildContext {

  double  phoneSizeHeight(double fraction) => MediaQuery.of(this).size.height * fraction ;
  double  phoneSizeWidth(double fraction) => MediaQuery.of(this).size.height * fraction ;

  double get cardWidgetHeightInDesign => 48;
  double get responsiveWidth => 48*(phoneSizeWidth(1)/phoneSizeHeight(1));

}



