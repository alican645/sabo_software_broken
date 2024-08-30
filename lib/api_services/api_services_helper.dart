
import 'dart:convert';

import "package:http/http.dart" as http ;

import 'package:sabo_software/api_services/sehir_model.dart';
import 'package:sabo_software/const/jsonURL.dart';



class ApiServiceHelper {

  Future<List<SehirModel>> getSehir() async {
    // http.get elimizde olan url i url şekinde değil de
    // uri(universal resource identifier(evrensel kaynak tanımlayıcı))
    // şeklinde ister Uri.parse metodu ile url'miz uri şekline dönüşür.
    var response =await http.get(Uri.parse(jsonURl));
    List<dynamic> responseList=jsonDecode(response.body);
    List<SehirModel> sehirList=[];
    for(int count=0;count<responseList.length;count++){
      sehirList.add(SehirModel.fromJson(responseList[count]));
    }
    return sehirList;
  }

  Future<List<String>> getLiman() async {
    var response = await http.get(Uri.parse(jsonURl));

    List<dynamic> responseList = jsonDecode(response.body);

    // "yerler" listesini tutmak için boş bir liste oluşturuluyor
    List<String> limanList = [];

    // Her şehir için "yerler" listesini kontrol ediyor ve ana listeye ekliyoruz
    for (int count = 0; count < responseList.length; count++) {
      var sehirData = responseList[count];
      if (sehirData['yerler'] != null) {
        // "yerler" listesi varsa, bu listeyi ana listeye ekliyoruz
        List<dynamic> yerler = sehirData['yerler'];
        yerler.forEach((yer) {
          limanList.add(yer);
        });
      }
    }

    print(response.statusCode);
    return limanList;
  }

}