

import 'package:flutter/material.dart';
import '../../const/AppColor.dart';
import '../../const/strings.dart';

class ServislerWidget extends StatefulWidget {
  ServislerWidget({
    super.key,
  });

  @override
  State<ServislerWidget> createState() => _ServislerWidgetState();
}

class _ServislerWidgetState extends State<ServislerWidget> {

  String imkanlarTitle="İmkanlar";
  bool imkanlarContent1 = false;
  bool imkanlarContent2 = false;
  bool imkanlarContent3 = false;
  List<bool> imkanlarContentValueList =[];
  List<String> imkannlarTexts = [
    "Dışarıdan catering firması getirilemez",
    "Mangal Yapılamaz",
    "Yüzme turları için yüzme turu seçeneğini seçmeniz gerekmektedir",
  ];

  String paketlerTitle ="Paketler";
  bool paketlerContent1 = false;
  bool paketlerContent2 = false;
  bool paketlerContent3 = false;
  bool paketlerContent4 = false;
  bool paketlerContent5 = false;
  List<bool> paketlerContentValueList =[];
  List<String> paketlerTexts = [
    "Dışarıdan catering firması getirilemez",
    "Mangal Yapılamaz",
    "Yüzme turları için yüzme turu seçeneğini seçmeniz gerekmektedir",
    "Mangal Yapılamaz 1 ",
    "Yüzme turları için yüzme turu seçeneğini seçmeniz gerekmektedir 1"
  ];

  String hizmetlerTitle = "Hizmetler";
  bool hizmetlerContent1 = false;
  bool hizmetlerContent2 = false;
  bool hizmetlerContent3 = false;
  List<bool> hizmetlerContentValueList =[];
  List<String> hizmetlerTexts = [
    "Dışarıdan catering firması getirilemez",
    "Mangal Yapılamaz",
    "Yüzme turları için yüzme turu seçeneğini seçmeniz gerekmektedir"
  ];

  @override
  void initState() {
    super.initState();
    hizmetlerContentValueList = [hizmetlerContent1, hizmetlerContent2, hizmetlerContent3];// Listeyi burada başlatıyoruz
    imkanlarContentValueList = [imkanlarContent1,imkanlarContent2,imkanlarContent3];
    paketlerContentValueList = [paketlerContent1,paketlerContent2,paketlerContent3,paketlerContent4,paketlerContent5];

  }

  @override
  Widget build(BuildContext context) {

    return Column(children:[
        buildCheckboxContainer(hizmetlerTitle, hizmetlerContentValueList, hizmetlerTexts),
      buildCheckboxContainer(paketlerTitle, paketlerContentValueList, paketlerTexts),
      buildCheckboxContainer(imkanlarTitle, imkanlarContentValueList, imkannlarTexts)
    ],);
  }



  Widget buildCheckboxContainer(String title, List<bool> checkboxValues,List<String> contentTexts) {
    return Container(
        padding: EdgeInsets.only(left: 19, right: 19, bottom: 10, top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.transparent,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColor.pageColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    title,
                    style: Strings()
                        .interTight
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                ),
                ...List.generate(
                  contentTexts.length,
                      (index) => CheckboxListTile(
                    title: Text(contentTexts[index]),
                    value: checkboxValues[index],
                    onChanged: (bool? value) {
                      setState(() {
                        checkboxValues[index] = value!;
                        print(title);
                        print(contentTexts[index]);
                        print(checkboxValues[index]);

                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
              ],
            ),
          ),
        ));
  }

}

