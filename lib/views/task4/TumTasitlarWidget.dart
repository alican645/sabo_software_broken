import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../const/AppColor.dart';

class TumTasitlerWidget extends StatefulWidget {
  TumTasitlerWidget({
    super.key,
  });

  @override
  State<TumTasitlerWidget> createState() => _TumTasitlerWidgetState();
}

class _TumTasitlerWidgetState extends State<TumTasitlerWidget> {
  List<List> tekneListesi = [];

  @override
  void initState() {
    super.initState();
    tekneListesi.add([false, "TekneAdi1"]);
    tekneListesi.add([false, "TekneAdi2"]);
    tekneListesi.add([false, "TekneAdi3"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F8FA),
      appBar: AppBar(
        title: const Text("Taşıtlarım"),
        leading: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColor.pageColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Tüm Taşıtlar",
                          style: GoogleFonts.interTight().copyWith(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        )),
                  ),
                  ...List.generate(
                    tekneListesi.length,
                    (index) => _buildYachtWidget(context, tekneListesi, index),
                  ),
                  GestureDetector(
                    child: Stack(children: [
                      Positioned(
                        right: 1,
                        left: 1,
                        top: 1,
                        bottom: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                                "assets/svg/yeni_tekne.svg"),
                            const Text("Yeni Tekne Ekle")
                          ],
                        ),
                      ),
                      Image.asset(
                          fit: BoxFit.cover,
                          "assets/images/rectangle.png")
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildYachtWidget(
      BuildContext context, List<List<dynamic>> tekneListesi, int index) {
    double? mqWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        height: 331,
        width: mqWidth * 0.8,
        decoration: BoxDecoration(
            color: const Color(0xffF9FCFD),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            //>>>Gradient özelliğine sahip olan Container widgetı (Tekne resminin olduğu kısım)
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight:
                            Radius.circular(15)), // İsteğe bağlı köşe yuvarlama
                    child: Image.asset(
                      "assets/images/image_tekne.png",
                      fit: BoxFit.cover,
                      width: mqWidth * 0.8,
                      // Expanded alanını doldurur
                    ),
                  ),
                  Container(
                    width: mqWidth * 0.8,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Colors.transparent,
                          const Color(0xffF9FCFD).withOpacity(1)
                        ])),
                  )
                ],
              ),
            ),
            //>>>Geri kalan kısım
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        tekneListesi[index][1],
                        style: GoogleFonts.interTight(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Color(0xff1A2228)),
                      ),
                      SizedBox(
                        width: mqWidth*0.01,
                      ),
                       Text(
                        "4.8",style: GoogleFonts.inter(fontSize:13,fontWeight:FontWeight.w500,color:Color(0xff1A2228)),
                      ),
                      Text("(62)",style: GoogleFonts.inter(fontSize:13,fontWeight:FontWeight.w500,color:Color(0xff526675))),
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: Container(
                          width: mqWidth * 0.32,
                          height: 24,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              color: const Color(0xff189DFD).withOpacity(0.08)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Doğrulanmış Tekne",
                                style: GoogleFonts.inter().copyWith(
                                    color: const Color(0xff189DFD),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600),
                              ),
                              SvgPicture.asset("assets/svg/check_badge.svg"),

                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Rezervasyon Alımı:",
                        style: GoogleFonts.inter(
                            fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                      Switch(
                        trackOutlineColor:
                            MaterialStateProperty.all(Colors.transparent),
                        inactiveTrackColor:
                            const Color(0xff49CA56).withOpacity(0.1),
                        inactiveThumbColor: const Color(0xff49CA56),
                        activeTrackColor:
                            const Color(0xff49CA56).withOpacity(0.1),
                        activeColor: const Color(0xff49CA56),
                        value: tekneListesi[index][0],
                        onChanged: (value) {
                          setState(() {
                            tekneListesi[index][0] = value;
                          });
                        },
                      )
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1.5, color: Colors.grey),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(200)),
                          height: 48,
                          width: MediaQuery.of(context).size.width * 0.34,
                          child: (Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Tekneyi Sil",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: Color(0xff526675)),
                              ),
                              SvgPicture.asset("assets/svg/delete_grey.svg",color:Color(0xff526675),)
                            ],
                          )),
                        ),
                      ),
                      SizedBox(
                        width: mqWidth * 0.01,
                      ),
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xff189DFD),
                              borderRadius: BorderRadius.circular(200)),
                          width: MediaQuery.of(context).size.width * 0.34,
                          height: 48,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Düzenle",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Colors.white),
                              ),
                              SvgPicture.asset("assets/svg/edit.svg")
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
