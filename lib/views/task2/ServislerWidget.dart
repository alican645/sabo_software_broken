

import 'package:flutter/material.dart';
import '../../const/strings.dart';
import 'ServislerTitleWidget.dart';

class ServislerWidget extends StatelessWidget {
  const ServislerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      EdgeInsets.only(left: 19, right: 19, bottom: 19, top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.transparent),
      child: Column(
        children: [
          ServislerTitleWidget(
            title: Strings().hizmetlerTitle,
            functionList: printFunctions,
            contentList: Strings().stringList,
          ),
          ServislerTitleWidget(
            title: Strings().guvenlikEkipmanlariTitle,
            functionList: printFunctions,
            contentList: Strings().stringList,
          ),
          ServislerTitleWidget(
            title: Strings().imkanlarTitle,
            functionList: printFunctions,
            contentList: Strings().stringList,
          ),
          ServislerTitleWidget(
            title: Strings().yemekMenuleriTitle,
            functionList: printFunctions,
            contentList: Strings().stringList,
          ),
          ServislerTitleWidget(
            title: Strings().paketlerTitle,
            functionList: printFunctions,
            contentList: Strings().stringList,
          ),
        ],
      ),
    );
  }
}

void printHello() {
  print('Hello');
}

// İkinci fonksiyon
void printWorld() {
  print('World');
}

// Üçüncü fonksiyon
void printHelloWorld() {
  print('Hello World');
}

// Fonksiyonları içeren liste
List<void Function()> printFunctions = [
  printHello,
  printWorld,
  printHelloWorld
];