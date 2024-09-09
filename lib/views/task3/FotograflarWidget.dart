import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../const/AppColor.dart';

class FotograflarWidget extends StatefulWidget {
  const FotograflarWidget({super.key});

  @override
  State<FotograflarWidget> createState() => _FotograflarWidgetState();
}

class _FotograflarWidgetState extends State<FotograflarWidget> {
  XFile? imageFile;
  List<XFile> xFileList = [];
  final imagePicker = ImagePicker();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColor.pageColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Fotoğraflar",style: GoogleFonts.interTight().copyWith(fontSize: 17,fontWeight: FontWeight.w600),)),
              ),
              SizedBox(
                height: 210, // Stack widget için belirli bir yükseklik
                child: PageView.builder(

                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                      imageFile = xFileList[index];
                    });
                  },
                  itemCount: xFileList.isNotEmpty ? xFileList.length : 1,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          child: SizedBox(
                            width: 800,
                            height: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: xFileList.isNotEmpty
                                  ? Image.file(File(xFileList[index].path),fit: BoxFit.cover,)
                                  : Image.asset("lib/assets/images/picture-icon-vector-illustration.jpg")
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 10,
                          child: IconButton(
                            onPressed: () {
                              if (xFileList.isNotEmpty) {
                                setState(() {
                                  xFileList.removeAt(index);
                                  if (xFileList.isEmpty) {
                                    imageFile = null;
                                  } else {
                                    currentIndex =
                                        currentIndex.clamp(0, xFileList.length - 1);
                                    imageFile = xFileList[currentIndex];
                                  }
                                });
                              }
                            },
                            icon: const Image(
                              image: AssetImage("lib/assets/icons/delete_button.png"),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 10,
                          right: 10,
                          bottom:10,
                          child: Align(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black45.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(45),
                              ),
                              child: SizedBox(
                                width: 66,
                                height: 40,
                                child: Center(
                                  child: Text(style: TextStyle(color: Colors.white),
                                    xFileList.isNotEmpty
                                        ? "${index + 1}/${xFileList.length}"
                                        : "0/0",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: GestureDetector(
                      onTap: () async {
                        XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

                        if (pickedFile != null) {
                          setState(() {
                            xFileList.add(pickedFile);
                            imageFile = xFileList[0];
                            currentIndex = 0;
                          });
                        } else {
                          Fluttertoast.showToast(msg: 'No image selected.');
                        }
                      },
                      child: const Image(
                        image: AssetImage("lib/assets/images/upload_image.png"),
                      ),
                    ),
                  ),
                  // Kaydırılabilir Row için SingleChildScrollView
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal, // Yatay kaydırma
                      child: Row(
                        children: List.generate(
                          xFileList.length,
                              (index) => Container(
                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                height: 80,
                                width: 80,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.file(
                                    File(xFileList[index].path),
                                    fit: BoxFit.cover, // Resmi belirlenen alana sığdırmak için
                                  ),
                                ),
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
