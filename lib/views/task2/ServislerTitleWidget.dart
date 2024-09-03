





import 'package:flutter/material.dart';

import '../../const/AppColor.dart';
import '../../const/strings.dart';
import 'ContentWidget.dart';

class ServislerTitleWidget extends StatelessWidget {
  String title;
  List<void Function()> functionList;
  List<String> contentList;
  ServislerTitleWidget(
      {super.key,
        required this.title,
        required this.functionList,
        required this.contentList});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: AppColor.pageColor),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 20),
            child: Text(
              title,
              style: Strings()
                  .interTight
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 17),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: contentList.length,
            itemBuilder: (context, index) => ContentWidget(
                content: contentList[index], onPressed: functionList[index]),
          )
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////

