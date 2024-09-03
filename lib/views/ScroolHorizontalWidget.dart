import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabo_software/const/extension.dart';
import 'package:sabo_software/provider/SeciliWidgetProvider.dart';

import '../const/AppColor.dart';
import '../const/strings.dart';

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
    String seciliWidget =
        Provider.of<SeciliWidgetProvider>(context).seciliWidget;

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
                  Provider.of<SeciliWidgetProvider>(context, listen: false)
                      .changeSeciliWidget(list[index]);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        list[index] == seciliWidget ? AppColor.cardColor : null,
                    border: Border.all(
                      color: Color(0x0A000000),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(200)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        list[index],
                        style: Strings().interTight.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 13,
                        color: list[index] == seciliWidget ? Colors.white : Colors.black,),
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
