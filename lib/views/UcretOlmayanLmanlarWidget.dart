import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:sabo_software/const/strings.dart";
import "package:sabo_software/const/extension.dart";

import "../api_services/sehir_model.dart";
import "../const/AppColor.dart";
import "../provider/SehirProvider.dart";
import "LimanCardWidget.dart";


class UcretOlmayanLimanlarWidget extends StatefulWidget {
  List<SehirModel> sehirList;
 UcretOlmayanLimanlarWidget({
    super.key,required this.sehirList
  });

  @override
  State<UcretOlmayanLimanlarWidget> createState() => _UcretOlmayanLimanlarWidgetState();
}

class _UcretOlmayanLimanlarWidgetState extends State<UcretOlmayanLimanlarWidget> {
  Strings strings = Strings();



  @override
  Widget build(BuildContext context) {

    String sehir=Provider.of<SehirProvider>(context).sehir;

    List limanlar() {
      List limanlar = [];

      widget.sehirList.forEach((element) {
        if (element.il == sehir) {

          element.yerler?.forEach((element) {
            limanlar.add(element);
          });
        }
      });
      return limanlar;
    }

    List<String> ekstraUcretUygulamayanLimanlar() {
      List<String> ekstraUcretUygulamayanLimanlar =[];
      widget.sehirList.forEach((element) {
        if (element.il == sehir) {
          element.ekstraUcretUygulamayanLimanlar?.forEach((element) {
            ekstraUcretUygulamayanLimanlar.add(element);
          });
        }
      });
      return ekstraUcretUygulamayanLimanlar;
    }

    List<String>ekstraUcretUygulamayanLimanlarListesi=ekstraUcretUygulamayanLimanlar();
    setState(() {});

    return Padding(
      padding: EdgeInsets.only(left: 19,right: 19,bottom: 19),
      child: SizedBox(
        width: context.phoneSizeWidth(0.7),
        height: context.phoneSizeHeight(0.9),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          color: AppColor.pageColor,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Text(
                    strings.ucretOlmayanLimanlar,
                    style: context.mainTitleFont,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Wrap(
                    children: limanlar()
                        .map((liman) => LimanCardWidget(
                      limanAdi: liman,
                      limanlar: ekstraUcretUygulamayanLimanlarListesi,
                    ))
                        .toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}