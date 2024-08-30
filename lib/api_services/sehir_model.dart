class SehirModel {
  String? il;
  String? gorsel;
  List<String>? yerler;
  String? anaLiman;
  List<String>? ekstraUcretUygulamayanLimanlar;

  SehirModel(
      {this.il,
        this.gorsel,
        this.yerler,
        this.anaLiman,
        this.ekstraUcretUygulamayanLimanlar});

  SehirModel.fromJson(Map<String, dynamic> json) {
    il = json['il'];
    gorsel = json['gorsel'];
    yerler = json['yerler'].cast<String>();
    anaLiman = json['ana_liman'];
    ekstraUcretUygulamayanLimanlar =
        json['ekstra_ucret_uygulamayan_limanlar'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['il'] = this.il;
    data['gorsel'] = this.gorsel;
    data['yerler'] = this.yerler;
    data['ana_liman'] = this.anaLiman;
    data['ekstra_ucret_uygulamayan_limanlar'] =
        this.ekstraUcretUygulamayanLimanlar;
    return data;
  }
}