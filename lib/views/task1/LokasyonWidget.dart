import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sabo_software/const/extension.dart';
import '../../const/AppColor.dart';
import '../../const/strings.dart';
import 'LimanCardWidget.dart';

class SehirModel {
  final String il;
  final String gorsel;
  final List<String> yerler;
  final String anaLiman;
  final List<String> ekstraUcretUygulamayanLimanlar;

  SehirModel({
    required this.il,
    required this.gorsel,
    required this.yerler,
    required this.anaLiman,
    required this.ekstraUcretUygulamayanLimanlar,
  });
}

List<SehirModel> sehirListesi = [
  SehirModel(
    il: "İstanbul",
    gorsel: "https://img.memurlar.net/galeri/4400/00cf2ac5-bc68-e311-8b97-14feb5cc1801.jpg?width=800",
    yerler: [
      "Bebek",
      "Kadıköy",
      "Üsküdar",
      "Beşiktaş",
      "Eminönü",
      "Ortaköy",
      "Sarıyer",
      "Arnavutköy",
      "Karaköy",
      "Kuzguncuk"
    ],
    anaLiman: "Kadıköy",
    ekstraUcretUygulamayanLimanlar: ["Üsküdar", "Beşiktaş", "Eminönü"],
  ),
  SehirModel(
    il: "Çanakkale",
    gorsel: "https://img.memurlar.net/galeri/4400/20cc4769-bc68-e311-8b97-14feb5cc1801.jpg?width=800",
    yerler: [
      "Gelibolu",
      "Bozcaada",
      "Gökçeada",
      "Eceabat",
      "Assos",
      "Kilitbahir",
      "Küçükkuyu",
      "Ayvacık",
      "Babakale",
      "Ezine"
    ],
    anaLiman: "Bozcaada",
    ekstraUcretUygulamayanLimanlar: [
      "Kilitbahir",
      "Küçükkuyu",
      "Ayvacık",
      "Babakale",
      "Ezine"
    ],
  ),
  SehirModel(
    il: "Muğla",
    gorsel: "https://img.memurlar.net/galeri/4400/8b0b7f69-bd68-e311-8b97-14feb5cc1801.jpg?width=800",
    yerler: [
      "Bodrum",
      "Marmaris",
      "Fethiye",
      "Datça",
      "Akyaka",
      "Göcek",
      "Ölüdeniz",
      "Dalyan",
      "Sarıgerme",
      "Turunç"
    ],
    anaLiman: "Göcek",
    ekstraUcretUygulamayanLimanlar: ["Ölüdeniz", "Dalyan", "Sarıgerme", "Turunç"],
  ),
  SehirModel(
    il: "Mersin",
    gorsel: "https://img.memurlar.net/galeri/4400/f7ce2ac5-bc68-e311-8b97-14feb5cc1801.jpg?width=800",
    yerler: [
      "Kızkalesi",
      "Tarsus",
      "Erdemli",
      "Anamur",
      "Silifke",
      "Mut",
      "Gülnar",
      "Bozyazı",
      "Aydıncık",
      "Çamlıyayla"
    ],
    anaLiman: "Erdemli",
    ekstraUcretUygulamayanLimanlar: ["Anamur", "Silifke", "Mut", "Gülnar", "Bozyazı"],
  ),
  SehirModel(
    il: "Antalya",
    gorsel: "https://img.memurlar.net/galeri/4400/b4577816-bc68-e311-8b97-14feb5cc1801.jpg?width=800",
    yerler: [
      "Kaleiçi",
      "Konyaaltı",
      "Lara",
      "Alanya",
      "Side",
      "Kemer",
      "Kaş",
      "Belek",
      "Olimpos",
      "Adrasan"
    ],
    anaLiman: "Konyaaltı",
    ekstraUcretUygulamayanLimanlar: ["Kaş", "Belek", "Olimpos", "Adrasan"],
  ),
  SehirModel(
    il: "İzmir",
    gorsel: "https://img.memurlar.net/galeri/4400/7a5841cb-bc68-e311-8b97-14feb5cc1801.jpg?width=800",
    yerler: [
      "Çeşme",
      "Alaçatı",
      "Urla",
      "Foça",
      "Karaburun",
      "Seferihisar",
      "Selçuk",
      "Dikili",
      "Bergama",
      "Bornova"
    ],
    anaLiman: "Alaçatı",
    ekstraUcretUygulamayanLimanlar: ["Urla", "Foça", "Karaburun", "Seferihisar"],
  ),
];

class LokasyonWidget extends StatefulWidget {
  LokasyonWidget({super.key,});

  String seciliSehir ="Çanakkale";

  @override
  State<LokasyonWidget> createState() => _LokasyonWidgetState();
}

class _LokasyonWidgetState extends State<LokasyonWidget> {
  final List<SehirModel> sehirList=sehirListesi;
  List<String> noFeeLimanlar =   [];
  List<String> anaLimanlar=[];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSehirlerWidget(context),
        _buildUcretOlmayanLimanlarWidget(context),
        _buildAnaLimanWidget(context),
      ],
    );
  }

  // Şehirler bileşeni metodu
  Widget _buildSehirlerWidget(BuildContext context) {
    List<List> sehirGorselleriVeIsimler = sehirList.map((element) {
      return [element.gorsel.toString(), element.il.toString()];
    }).toList();

    String sehir = widget.seciliSehir;

    return Padding(
      padding: EdgeInsets.only(left: 19, right: 19, bottom: 19),
      child: Container(
        width: context.phoneSizeWidth(0.9),
        height: context.phoneSizeHeight(0.8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: ListView.builder(
          itemCount: sehirGorselleriVeIsimler.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                child: Opacity(
                  opacity: sehir == sehirGorselleriVeIsimler[index][1] ? 1.0 : 0.5,
                  child: GestureDetector(
                    onTap: () {
                      widget.seciliSehir=sehirGorselleriVeIsimler[index][1];
                      setState(() {});

                    },
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(sehirGorselleriVeIsimler[index][0]),
                          ),
                        ),
                        Positioned(
                          bottom: 35,
                          left: 15,
                          child: Text(
                            sehirGorselleriVeIsimler[index][1],
                            style: Strings().interTight.copyWith(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                        Positioned(
                          bottom: 18,
                          left: 15,
                          child: Text(
                            "Türkiye",
                            style: GoogleFonts.interTight(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Ücret olmayan limanlar bileşeni metodu
  Widget _buildUcretOlmayanLimanlarWidget(BuildContext context) {
    String sehir = widget.seciliSehir;
    List<String> secilenLimanlar = noFeeLimanlar;

    List<String> limanlar = sehirList
        .where((element) => element.il == sehir)
        .expand((element) => element.yerler!)
        .toList();

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
                  Strings().ucretOlmayanLimanlar,
                  style: Strings().interTight.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  children: limanlar
                      .map((liman) => Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: () {
                        if (noFeeLimanlar.contains(liman)) {
                          noFeeLimanlar.remove(liman);
                        }else  {
                          noFeeLimanlar.add(liman);
                        }
                        setState(() {});
                      },
                      child: LimanCardWidget(
                        limanlar: liman,
                        selectedWidgetColor: containsString(
                            secilenLimanlar, liman)
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Ana liman bileşeni metodu
  Widget _buildAnaLimanWidget(BuildContext context) {
    String sehir = widget.seciliSehir;
    List<String> secilenLimanlar = anaLimanlar;

    List<String> limanlar = sehirList
        .where((element) => element.il == sehir)
        .expand((element) => element.yerler!)
        .toList();

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
              SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  children: limanlar
                      .map((liman) => Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: () {
                        if (anaLimanlar.contains(liman)) {
                          anaLimanlar.remove(liman);
                        }else  {
                          anaLimanlar.add(liman);
                        }
                        setState(() {});
                      },
                      child: LimanCardWidget(
                        limanlar: liman,
                        selectedWidgetColor: containsString(
                            secilenLimanlar, liman)
                            ? AppColor.cardColor
                            : Colors.white,
                        selectedWidgetTextColor: containsString(
                            secilenLimanlar, liman)
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

