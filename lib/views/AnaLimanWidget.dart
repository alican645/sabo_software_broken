import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabo_software/const/AppColor.dart';
import 'package:sabo_software/const/extension.dart';
import '../api_services/sehir_model.dart';
import '../const/strings.dart';
import '../provider/SehirProvider.dart';
import 'LimanCardWidget.dart';

class AnaLimanWidget extends StatefulWidget {
  List<SehirModel> sehirList;

  AnaLimanWidget({super.key, required this.sehirList});

  @override
  State<AnaLimanWidget> createState() => _AnaLimanWidgetState();
}

class _AnaLimanWidgetState extends State<AnaLimanWidget> {
  Strings strings = Strings();



  @override
  Widget build(BuildContext context) {

    String sehir=Provider.of<SehirProvider>(context).sehir;
    List<String> limanlar() {
      List<String> limanlar = [];
      widget.sehirList.forEach((element) {
        if (element.il == sehir) {
          element.yerler?.forEach((element) {
            limanlar.add(element);
          });
        }
      });
      return limanlar;
    }

    List<String> anaLiman() {
      List<String> anaLiman = [];
      widget.sehirList.forEach((element) {
        if (element.il == sehir) {
          anaLiman.add(element.anaLiman.toString());
        }
      });
      return anaLiman;
    }
    List<String> limanlarListesi =anaLiman();
    setState(() {});

    return Padding(
      padding: EdgeInsets.only(left: 19,right: 19,bottom: 19),
      child: SizedBox(
        width: context.phoneSizeWidth(0.44),
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
                    strings.anaLiman.toString(),
                    style: strings.mainTitleStyle,
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
                              limanAdi: liman,limanlar: limanlarListesi,
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