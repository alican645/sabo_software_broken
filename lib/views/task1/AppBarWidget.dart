import 'package:flutter/material.dart';
import 'package:sabo_software/const/extension.dart';
import '../../const/AppColor.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(image: AssetImage("lib/assets/images/group.png")),
                Row(
                  children: [
                    IconButton(icon: Image(image: AssetImage('lib/assets/icons/notification.png')), onPressed: () {},),
                    IconButton(onPressed: (){}, icon: Image.asset("lib/assets/icons/hamburger_menu.png"))
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}