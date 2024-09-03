import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sabo_software/const/extension.dart';
import '../const/AppColor.dart';
import '../const/strings.dart';

class TasitlariAppBarWidget extends StatelessWidget {
  const TasitlariAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.phoneSizeHeight(0.1),
        width: context.phoneSizeWidth(0.44),
        child: Card(
          color: AppColor.pageColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(onPressed: (){}, icon: Image(image: AssetImage("lib/assets/icons/arrow_left.png")),),
                Text(Strings().tasitlarim,style: GoogleFonts.interTight().copyWith(fontWeight:FontWeight.w500,fontSize: 13,))
              ],
            ),
          ),
        ));
  }
}