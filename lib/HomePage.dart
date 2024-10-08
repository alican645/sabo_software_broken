import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sabo_software/api_services/api_services_helper.dart';
import 'package:sabo_software/const/AppColor.dart';
import 'package:sabo_software/const/strings.dart';
import 'package:sabo_software/views/task1/AppBarWidget.dart';

import 'package:sabo_software/views/task1/ScroolHorizontalWidget.dart';
import 'package:sabo_software/views/task1/TasitlarimAppBarWidget.dart';
import 'package:sabo_software/views/task2/ServislerWidget.dart';
import 'package:sabo_software/views/task3/FotograflarWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ApiServiceHelper apiServiceHelper = ApiServiceHelper();
  Strings strings = Strings();

  @override
  void initState() {
    super.initState();
    // getSehir();
  //
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
             FotograflarWidget(),
            ServislerWidget()




            //FotograflarWidget(),

          ],
        ),
      ),
    );
  }

  // void getSehir() async {
  //   var result = apiServiceHelper.getSehir();
  //   result.then((value) {
  //     setState(() {
  //       sehirList = value;
  //     });
  //   });
  // }
}




