import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabo_software/const/AppColor.dart';
import 'package:sabo_software/const/extension.dart';
import 'package:sabo_software/provider/AnaLimanProvider.dart';
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
  @override
  Widget build(BuildContext context) {
    String sehir = Provider.of<SehirProvider>(context).sehir;
    List<String> secilenLimanlar =
        Provider.of<AnaLimanProvider>(context).seciliLimanlar;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings().anaLiman,
                style: Strings()
                    .interTight
                    .copyWith(fontSize: 17, fontWeight: FontWeight.w600),
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
                                setState(() {
                                  Provider.of<AnaLimanProvider>(context,
                                          listen: false)
                                      .toggleStringInList(liman);
                                });
                              },
                              child: LimanCardWidget(
                                limanlar: liman,
                                selectedWidgetColor:
                                    containsString(secilenLimanlar, liman)
                                        ? AppColor.cardColor
                                        : Colors.white,
                                selectedWidgetTextColor:
                                    containsString(secilenLimanlar, liman)
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
