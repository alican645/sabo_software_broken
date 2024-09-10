import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../const/AppColor.dart';

class TumTasitlerWidget extends StatefulWidget {
  TumTasitlerWidget({
    super.key,
  });
  bool switchValue = false;

  @override
  State<TumTasitlerWidget> createState() => _TumTasitlerWidgetState();
}

class _TumTasitlerWidgetState extends State<TumTasitlerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F8FA),
      appBar: AppBar(
        title: const Text("adsasd"),
        leading: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
        child: Container(
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
                    1,
                    (index) => Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        height: 331,
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
                                        topRight: Radius.circular(
                                            15)), // İsteğe bağlı köşe yuvarlama
                                    child: Image.asset(
                                      "lib/assets/images/image_tekne.png",
                                      fit: BoxFit.cover,
                                      width: 315,
                                      height: 175, // Expanded alanını doldurur
                                    ),
                                  ),
                                  Container(
                                    width: 315,
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
                              padding:
                                  const EdgeInsets.only(left: 15.0, top: 8),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text("Tekne Adı"),
                                      const Icon(
                                        Icons.star,
                                        color: Colors.orangeAccent,
                                      ),
                                      const Text("4.8"),
                                      const Text("(62)"),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Container(
                                          width: 141,
                                          height: 24,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(200),
                                              color: const Color(0xff189DFD)
                                                  .withOpacity(0.08)),
                                          child:  Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Doğrulanmış Tekne",
                                                style: GoogleFonts.inter()
                                                    .copyWith(
                                                        color:
                                                            const Color(0xff189DFD),
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w600),
                                              ),
                                              Image.asset(
                                                  "lib/assets/icons/check_badge_2.png")
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text("Rezervasyon Alımı:"),
                                      Switch(

                                        hoverColor:
                                            const Color(0xff49CA56).withOpacity(0.1),
                                        inactiveTrackColor:
                                            const Color(0xff49CA56).withOpacity(0.1),
                                        inactiveThumbColor: const Color(0xff49CA56),
                                        activeTrackColor:
                                            const Color(0xff49CA56).withOpacity(0.1),
                                        activeColor: const Color(0xff49CA56),
                                        value: widget.switchValue,
                                        onChanged: (value) {
                                          setState(() {
                                            widget.switchValue = value;
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                  Row(children: [
                                    Expanded(child: Container(

                                    ))
                                  ],)
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
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
                            Image.asset(
                                "lib/assets/icons/icon_yeni_tekne_ekle.png"),
                            const Text("Yeni Tekne Ekle")
                          ],
                        ),
                      ),
                      Image.asset(
                          fit: BoxFit.cover,
                          "lib/assets/images/rectangle_yeni_tasit_ekle.png")
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
}
