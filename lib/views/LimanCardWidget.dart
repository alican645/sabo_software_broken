import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabo_software/const/AppColor.dart';
import 'package:sabo_software/const/extension.dart';
import 'package:sabo_software/const/strings.dart';

import '../provider/AnaLimanProvider.dart';
import '../provider/EkstraUcretLimanlarProvider.dart';


class LimanCardWidget extends StatefulWidget {
  String limanlar;
  Color color ;


  LimanCardWidget({super.key, required this.limanlar,required this.color});

  @override
  State<LimanCardWidget> createState() => _LimanCardWidgetState();
}

class _LimanCardWidgetState extends State<LimanCardWidget> {

  @override
  Widget build(BuildContext context) {
    Strings strings =Strings();


    return Container(
      decoration: BoxDecoration(
        color:widget.color,
        border: Border.all(
          color:  Color(0x0A000000),
          width: 1.5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          widget.limanlar.toString(),
          style: strings.cardWidgetStyle,
        ),
      ),
    );
  }
}

