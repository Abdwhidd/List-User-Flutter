class cData {
  String nama;
  String avatar;
  String alamat;
  String pekerjaan;
  String quote;
  String id;

  cData({
    required this.nama,
    required this.avatar,
    required this.alamat,
    required this.pekerjaan,
    required this.quote,
    required this.id,
  });

  factory cData.fromJson(Map<String, dynamic> json) {
    return cData(
      id: json['id'],
      nama: json['nama'],
      alamat: json['alamat'],
      pekerjaan: json['pekerjaan'],
      quote: json['quote'],
      avatar: json['avatar'],
    );
  }
}
