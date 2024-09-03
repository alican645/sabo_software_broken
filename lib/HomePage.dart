import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sabo_software/api_services/api_services_helper.dart';
import 'package:sabo_software/api_services/sehir_model.dart';
import 'package:sabo_software/const/AppColor.dart';
import 'package:sabo_software/const/strings.dart';
import 'package:sabo_software/views/task1/AnaLimanWidget.dart';
import 'package:sabo_software/views/task1/AppBarWidget.dart';
import 'package:sabo_software/views/task1/ScroolHorizontalWidget.dart';
import 'package:sabo_software/views/task1/SehirlerWidget.dart';
import 'package:sabo_software/views/task1/TasitlarimAppBarWidget.dart';
import 'package:sabo_software/views/task1/UcretOlmayanLmanlarWidget.dart';
import 'package:sabo_software/views/task2/ServislerWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SehirModel> sehirList = [];
  ApiServiceHelper apiServiceHelper = ApiServiceHelper();
  Strings strings = Strings();

  @override
  void initState() {
    super.initState();
    getSehir();

    print(sehirList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarWidget(),
            TasitlariAppBarWidget(),
            ScroolHorizontalWidget(),
            ServislerWidget()
          ],
        ),
      ),
    );
  }

  void getSehir() async {
    var result = apiServiceHelper.getSehir();
    result.then((value) {
      setState(() {
        sehirList = value;
      });
    });
  }
}




