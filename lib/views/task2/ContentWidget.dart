

import 'package:flutter/material.dart';

import '../../const/strings.dart';

class ContentWidget extends StatefulWidget {
  void Function() onPressed;
  String content;
  ContentWidget({super.key, required this.content, required this.onPressed});
  bool isRun = false;
  @override
  State<ContentWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            widget.isRun = !widget.isRun;
            widget.isRun == true ? widget.onPressed.call() : null;
            setState(() {});
          },
          icon: widget.isRun == true
              ? Image(image: AssetImage("lib/assets/icons/seciliContent.png"))
              : Image(
              image:
              AssetImage("lib/assets/icons/seciliOlmayanContent.png")),
        ),
        Expanded(
          child: Text(
            widget.content,
            style: Strings()
                .inter
                .copyWith(fontWeight: FontWeight.w400, fontSize: 15),
          ),
        )
      ],
    );
  }
}