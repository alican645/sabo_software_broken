import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:sabo_software/HomePage.dart';
import 'package:sabo_software/provider/AnaLimanProvider.dart';
import 'package:sabo_software/provider/EkstraUcretLimanlarProvider.dart';
import 'package:sabo_software/provider/SeciliWidgetProvider.dart';
import 'package:sabo_software/provider/SehirProvider.dart';



void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => SehirProvider(),),
    ChangeNotifierProvider(create: (context) => SeciliWidgetProvider(),),
    ChangeNotifierProvider(create: (context) => AnaLimanProvider(),),
    ChangeNotifierProvider(create: (context) => EkstraUcretLimanlarProvider(),),

  ],
  child: MyApp(),));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.interTightTextTheme(),
      ),
      home: SafeArea(child: HomePage())
    );
  }
}


