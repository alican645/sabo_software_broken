import 'package:flutter/material.dart';
import 'package:sabo_software/const/AppColor.dart';
import 'package:sabo_software/const/extension.dart';
import 'package:sabo_software/const/strings.dart';


class LimanCardWidget extends StatefulWidget {
  String limanAdi;
  List<String> limanlar ;
  LimanCardWidget({super.key, required this.limanAdi,required this.limanlar});

  @override
  State<LimanCardWidget> createState() => _LimanCardWidgetState();
}

class _LimanCardWidgetState extends State<LimanCardWidget> {
  @override
  Widget build(BuildContext context) {
    Strings strings =Strings();
    return Card(
      color: widget.limanlar.contains(widget.limanAdi)?AppColor.cardColor:Colors.white ,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          widget.limanAdi.toString(),
          style: strings.cardWidgetStyle,
        ),
      ),
    );
  }
}

