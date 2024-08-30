
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabo_software/const/extension.dart';
import 'package:sabo_software/provider/SeciliWidgetProvider.dart';

import '../const/AppColor.dart';
class ScroolHorizontalWidget extends StatelessWidget {
  const ScroolHorizontalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      "Taşıt Detayları",
      "Organizasyonlar",
      "Açıklamlar",
      "Fotoğraflar",
      "Lokasyon",
      "Servisler",
      "Şartlar"
    ];
    String seciliWidget=Provider.of<SeciliWidgetProvider>(context).seciliWidget;

    return SizedBox(
        height: context.phoneSizeHeight(0.1),
        width: context.phoneSizeWidth(0.44),
        child: Card(
          color: AppColor.pageColor,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Provider.of<SeciliWidgetProvider>(context,listen: false).changeSeciliWidget(list[index]);
                },
                child: Card(
                  color: list[index]==seciliWidget?AppColor.cardColor:null,
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(45)),
                  ) ,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                          list[index]
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}