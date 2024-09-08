import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:sabo_software/const/strings.dart";
import "package:sabo_software/provider/EkstraUcretLimanlarProvider.dart";

import "../../api_services/sehir_model.dart";
import "../../const/AppColor.dart";
import "../../provider/SehirProvider.dart";
import "LimanCardWidget.dart";

class UcretOlmayanLimanlarWidget extends StatefulWidget {
  List<SehirModel> sehirList;
  UcretOlmayanLimanlarWidget({super.key, required this.sehirList});

  @override
  State<UcretOlmayanLimanlarWidget> createState() =>
      _UcretOlmayanLimanlarWidgetState();
}

class _UcretOlmayanLimanlarWidgetState
    extends State<UcretOlmayanLimanlarWidget> {
  Strings strings = Strings();

  @override
  Widget build(BuildContext context) {
    String sehir = Provider.of<SehirProvider>(context).sehir;
    List<String> secilenLimanlar=Provider.of<EkstraUcretLimanlarProvider>(context).seciliLimanlar;

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

    bool containsString(List<String> list, String searchString) {
      return list.contains(searchString);
    }




    return Padding(
      padding: EdgeInsets.only(left: 19, right: 19, bottom: 19),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColor.pageColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  strings.ucretOlmayanLimanlar,
                  style: Strings().interTight.copyWith(fontSize: 17,fontWeight: FontWeight.w600,),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  children: limanlar()
                      .map((liman) => Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GestureDetector(
                              onTap: () {
                                Provider.of<EkstraUcretLimanlarProvider>(context,listen: false).toggleStringInList(liman);
                              },
                              child: LimanCardWidget(
                                limanlar: liman,
                                selectedWidgetColor: containsString(secilenLimanlar, liman)?AppColor.cardColor:Colors.white,
                                selectedWidgetTextColor: containsString(secilenLimanlar, liman)
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                      ))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
