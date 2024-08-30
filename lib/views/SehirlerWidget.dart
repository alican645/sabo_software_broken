import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sabo_software/const/extension.dart';
import 'package:sabo_software/provider/SehirProvider.dart';
import '../api_services/sehir_model.dart';
import '../const/AppColor.dart';
import '../const/strings.dart';
import 'LimanCardWidget.dart';

class SehirlerWidget extends StatelessWidget {
  Strings strings = Strings();
  List<SehirModel> sehirList;
  SehirlerWidget({super.key, required this.sehirList});

  List<List> sehirGorselleriVeIsimler() {
    List<List> sehirGorselleriVeIsimler = [];
    sehirList.forEach((element) {
      String sehirGorselURL = element.gorsel.toString();
      String sehirIsim = element.il.toString();
      List<String> dataList = [];
      dataList.add(sehirGorselURL);
      dataList.add(sehirIsim);
      sehirGorselleriVeIsimler.add(dataList);
    });
    print(sehirGorselleriVeIsimler);
    return sehirGorselleriVeIsimler;
  }

  @override
  Widget build(BuildContext context) {
    List<List> dataList = sehirGorselleriVeIsimler();
    String sehir=Provider.of<SehirProvider>(context).sehir;
    print(sehir);
    return Padding(
      padding: EdgeInsets.only(left: 19, right: 19, bottom: 19),
      child: SizedBox(
        width: context.phoneSizeWidth(0.44),
        height: context.phoneSizeHeight(0.9),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          color: AppColor.pageColor,
          child: ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                child: Opacity(
                  opacity: sehir==dataList[index][1] ? 1.0 : 0.5,
                  child: GestureDetector(
                    onTap: () {
                        Provider.of<SehirProvider>(context,listen: false).degistir(dataList[index][1]);
                    },
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(dataList[index][0]),
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          left: 8,
                          child: Column(
                            children: [
                              Text(dataList[index][1],style: Strings().sehirAdiTextStyle,),
                              Text("Türkiye",style: Strings().turkiyeTextStyle,)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
