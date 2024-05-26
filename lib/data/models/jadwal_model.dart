import 'dart:convert';

JadwalModel jadwalModelFromJson(String str) =>
    JadwalModel.fromJson(json.decode(str));

String jadwalModelToJson(JadwalModel data) => json.encode(data.toJson());

class JadwalModel {
  final int? id;
  final int? posyanduId;
  final String? namaPosyandu;
  final DateTime? tanggal;
  // final List<Bidan>? bidans;

  JadwalModel({
    this.id,
    this.posyanduId,
    this.namaPosyandu,
    this.tanggal,
    // this.bidans,
  });

  factory JadwalModel.fromJson(Map<String, dynamic> json) => JadwalModel(
        id: json["id"],
        posyanduId: json["posyandu_id"],
        namaPosyandu: json["nama_posyandu"],
        tanggal:
            json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        // bidans: json["bidans"] == null ? [] : List<Bidan>.from(json["bidans"]!.map((x) => Bidan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "posyandu_id": posyanduId,
        "nama_posyandu": namaPosyandu,
        "tanggal":
            "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        // "bidans": bidans == null ? [] : List<dynamic>.from(bidans!.map((x) => x.toJson())),
      };
}

class Bidan {
  final int? bidanId;
  final String? name;

  Bidan({
    this.bidanId,
    this.name,
  });

  factory Bidan.fromJson(Map<String, dynamic> json) => Bidan(
        bidanId: json["bidan_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "bidan_id": bidanId,
        "name": name,
      };
}
