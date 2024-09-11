import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TasitlarDeetayPage extends StatefulWidget {
  TasitlarDeetayPage({super.key});
  int isletmeTipiValue = 0;

  @override
  State<TasitlarDeetayPage> createState() => _TasitlarDeetayPageState();
}

class _TasitlarDeetayPageState extends State<TasitlarDeetayPage> {
  String? _selectedItemModel;
  String? _selectedItemBayrak;

  // Dropdown menüsünde gösterilecek öğeler
  final List<String> _itemListModel = ["Item 1", "Item 2", "Item 3", "Item 4"];
  final List<String> _itemListBayrak = [
    "Türkiye",
    "Almanya",
    "Fransa",
    "İngiltere"
  ];

  final TextEditingController _tamKapasiteController = TextEditingController();
  final TextEditingController _yemekliKapasiteController =
      TextEditingController();
  final TextEditingController _tasitAdiController = TextEditingController();
  final TextEditingController _markaController = TextEditingController();
  final TextEditingController _yapimTiliContoller = TextEditingController();
  final TextEditingController _bakimOnarimYiliController =
      TextEditingController();
  final TextEditingController _tasitUzunluguController =
      TextEditingController();
  final TextEditingController _tuvaletSayisiController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    double mqWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xffF4F8FA),
      appBar: AppBar(
        title: Text(
          "Taşıtlarım",
          style: GoogleFonts.interTight(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: const Color(0xff1A2228)),
        ),
        leading: const Icon(
          Icons.arrow_back_ios,
          size: 20,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///////////////////////////////////////////////////////////////////////////>>>>>>>>>İşletme Tipi
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SingleChildScrollView(
                    child: Container(
                      width: mqWidth * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "İşletme Tipi",
                              style: GoogleFonts.interTight(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            width: mqWidth * 0.8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    color: Colors.grey.shade300, width: 1.5)),
                            child: Padding(
                              padding: const EdgeInsets.all(1),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        widget.isletmeTipiValue = 1;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: widget.isletmeTipiValue == 1
                                              ? const Color(0xff189DFD)
                                                  .withOpacity(0.08)
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      height: 48,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/svg/time_circle.svg",
                                            color: widget.isletmeTipiValue == 1
                                                ? const Color(0xff189DFD)
                                                : Colors.black,
                                          ),
                                          Text(
                                            "Saatlik",
                                            style: GoogleFonts.inter(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  widget.isletmeTipiValue == 1
                                                      ? const Color(0xff189DFD)
                                                      : Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        widget.isletmeTipiValue = 2;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: widget.isletmeTipiValue == 2
                                              ? const Color(0xff189DFD)
                                                  .withOpacity(0.08)
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      height: 48,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/svg/calendar.svg",
                                            color: widget.isletmeTipiValue == 2
                                                ? const Color(0xff189DFD)
                                                : Colors.black,
                                          ),
                                          Text(
                                            "Günlük & Haftalık",
                                            style: GoogleFonts.inter(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  widget.isletmeTipiValue == 2
                                                      ? const Color(0xff189DFD)
                                                      : Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ///////////////////////////////////////////////////////////////////////////>>>>>>>>>Tam Kapasite
              Container(
                width: mqWidth * 0.9,
                height: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: _buildTextFieldwidgetArea(
                    mqWidth,
                    "Tam Kapasite",
                    ImageIcon(AssetImage("assets/images/user.png")),
                    GoogleFonts.interTight(
                        fontSize: 17, fontWeight: FontWeight.w600),
                    TextInputType.number,_tamKapasiteController),
              ),
              const SizedBox(
                height: 40,
              ),
              ///////////////////////////////////////////////////////////////////////////>>>>>>>>>Yemekli Kapasite
              Container(
                width: mqWidth * 0.9,
                height: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: _buildTextFieldwidgetArea(
                    mqWidth,
                    "Yemekli Kapasite",
                    ImageIcon(AssetImage("assets/images/knife_fork.png")),
                    GoogleFonts.interTight(
                        fontSize: 17, fontWeight: FontWeight.w600),
                    TextInputType.number,_yemekliKapasiteController),
              ),
              const SizedBox(
                height: 40,
              ),
              ///////////////////////////////////////////////////////////////////////////>>>>>>>>>Tekne Özellikleri
              Container(
                width: mqWidth * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 5, 8, 10),
                              child: Text("Tekne Özellikleri",
                                  style: GoogleFonts.interTight(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600)),
                            )),
                        _buildTextFieldwidgetArea(
                            mqWidth,
                            "Taşıt Adı",
                            null,
                            GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff526675)),
                            TextInputType.text,_tasitAdiController),
                        _buildDropdown(
                          "Taşıt Tipi",
                          mqWidth,
                          _selectedItemModel,
                          _itemListModel,
                          GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff526675)),
                        ),
                        _buildTextFieldwidgetArea(
                            mqWidth,
                            "Marka",
                            null,
                            GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff526675)),
                            TextInputType.text,_markaController),
                        _buildDropdown(
                            "Model",
                            mqWidth,
                            _selectedItemModel,
                            _itemListModel,
                            GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff526675))),
                        _buildTextFieldwidgetArea(
                            mqWidth,
                            "Yapım Yılı",
                            null,
                            GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff526675)),
                            TextInputType.number,_yapimTiliContoller),
                        _buildTextFieldwidgetArea(
                            mqWidth,
                            "Bakım/Onarım Yılı",
                            null,
                            GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff526675)),
                            TextInputType.number,_bakimOnarimYiliController),
                        _buildTextFieldwidgetArea(
                            mqWidth,
                            "Taşıt Uzunluğu",
                            null,
                            GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff526675)),
                            TextInputType.number,_tasitUzunluguController),
                        _buildTextFieldwidgetArea(
                            mqWidth,
                            "Tuvalet Sayısı",
                            null,
                            GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff526675)),
                            TextInputType.number,_tuvaletSayisiController),
                        _buildDropdown(
                            "Bayrak",
                            mqWidth,
                            _selectedItemBayrak,
                            _itemListBayrak,
                            GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff526675))),
                        _buildDropdown(
                            "Yapı Malzemesi",
                            mqWidth,
                            _selectedItemBayrak,
                            _itemListBayrak,
                            GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff526675))),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildTextFieldwidgetArea(
      double mqWidth,
      String title,
      Widget? icon,
      TextStyle textStyle,
      TextInputType textInputType,
      TextEditingController textEditingController) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 5, 10, 5),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 5, 8, 10),
              child: Text(title, style: textStyle),
            ),
          ),
          _buildTextField(mqWidth, icon, textInputType, textEditingController)
        ],
      ),
    );
  }

  Container _buildTextField(
      double mqWidth,
      Widget? icon,
      TextInputType textInputType,
      TextEditingController textEditingController) {
    return Container(
      width: mqWidth * 0.8,
      height: 56,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300, width: 1.5)),
      child: TextField(
        controller: textEditingController,
        keyboardType: textInputType,
        decoration: InputDecoration(
          prefixIcon: icon, // Solda gösterilen ikon
          border: InputBorder.none,
        ),
      ),
    );
  }

  Padding _buildDropdown(String title, double mqWidth, String? value,
      List<String> itemList, TextStyle textStyle) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 5, 10, 5),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 5, 8, 10),
              child: Text(
                title,
                style: textStyle,
              ),
            ),
          ),
          Container(
            width: mqWidth * 0.8,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade300, width: 1.5),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none, // Border'ı kaldırmak için
                  ),
                  filled: true, // Arka plan rengini doldurur
                  fillColor: Colors.white, // Arka plan rengi
                ),
                value: value,
                icon: Icon(Icons.arrow_drop_down),
                isExpanded: true, // Tüm genişliği kaplaması için
                items: itemList.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Color(0xff1A2228),
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    value = newValue!;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
