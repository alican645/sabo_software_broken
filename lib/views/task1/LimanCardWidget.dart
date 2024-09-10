import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




class LimanCardWidget extends StatefulWidget {
  String limanlar;
  Color selectedWidgetColor ;
  Color selectedWidgetTextColor ;


  LimanCardWidget({super.key, required this.limanlar,required this.selectedWidgetColor,required this.selectedWidgetTextColor});

  @override
  State<LimanCardWidget> createState() => _LimanCardWidgetState();
}

class _LimanCardWidgetState extends State<LimanCardWidget> {

  @override
  Widget build(BuildContext context) {



    return Container(
      height: 48,
      decoration: BoxDecoration(
        color:widget.selectedWidgetColor,
        border: Border.all(
          color:  Colors.grey.shade200,
          width: 1.5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Text(
        widget.limanlar.toString(),
        style:GoogleFonts.interTight().copyWith(fontWeight: FontWeight.w500,fontSize: 15,color: widget.selectedWidgetTextColor),
      ),
    );
  }
}

