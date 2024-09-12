import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../const/AppColor.dart';

class TumTasitlerWidget extends StatefulWidget {
  TumTasitlerWidget({super.key});

  @override
  State<TumTasitlerWidget> createState() => _TumTasitlerWidgetState();
}

class _TumTasitlerWidgetState extends State<TumTasitlerWidget> {
  bool switchValue = false;
  
  @override
  Widget build(BuildContext context) {
    final mqWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: const Color(0xffF4F8FA),
      appBar: AppBar(
        title: Text("Taşıtlarım"),
        leading: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
        child: Container(
          width: mqWidth * 0.9,
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
                          fontSize: 17,
                          fontWeight: FontWeight.w600
                        ),
                      )
                    ),
                  ),
                  ...List.generate(
                    1,
                    (index) => _buildYachtWidget(mqWidth),
                  ),
                  GestureDetector(
                    child: Stack(
                      children: [
                        Positioned(
                          right: 1,
                          left: 1,
                          top: 1,
                          bottom: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("lib/assets/icons/icon_yeni_tekne_ekle.png"),
                              Text("Yeni Tekne Ekle")
                            ],
                          ),
                        ),
                        Image.asset(
                          fit: BoxFit.cover,
                          "lib/assets/images/rectangle_yeni_tasit_ekle.png"
                        )
                      ]
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildYachtWidget(double mqWidth) {
    final buttonStyle = GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      fontSize: 13,
      color: Color(0xff526675)
    );

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        height: 331,
        width: mqWidth * 0.8,
        decoration: BoxDecoration(
          color: const Color(0xffF9FCFD),
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)
                    ),
                    child: Image.asset(
                      "lib/assets/images/image_tekne.png",
                      fit: BoxFit.cover,
                      width: mqWidth * 0.8,
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
                        ]
                      )
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Tekne Adı", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                        Icon(Icons.star, color: Colors.orangeAccent),
                        Text("4.8"),
                        Text("(62)"),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            width: 141,
                            height: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              color: const Color(0xff189DFD).withOpacity(0.08)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Doğrulanmış Tekne",
                                  style: GoogleFonts.inter(
                                    color: const Color(0xff189DFD),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                                Image.asset("lib/assets/icons/check_badge_2.png")
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text("Rezervasyon Alımı:"),
                        Switch(
                          hoverColor: const Color(0xff49CA56).withOpacity(0.1),
                          inactiveTrackColor: const Color(0xff49CA56).withOpacity(0.1),
                          inactiveThumbColor: const Color(0xff49CA56),
                          activeTrackColor: const Color(0xff49CA56).withOpacity(0.1),
                          activeColor: const Color(0xff49CA56),
                          value: switchValue,
                          onChanged: (value) {
                            setState(() {
                              switchValue = value;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.5,
                                color: Colors.grey
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(200)
                            ),
                            height: 48,
                            width: mqWidth * 0.34,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Tekneyi Sil", style: buttonStyle),
                                Image(image: AssetImage("lib/assets/icons/delete_1.png"))
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff189DFD),
                              borderRadius: BorderRadius.circular(200)
                            ),
                            width: mqWidth * 0.34,
                            height: 48,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Düzenle",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Colors.white
                                  ),
                                ),
                                Image(image: AssetImage("lib/assets/icons/edit.png"))
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}