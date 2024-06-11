// To parse this JSON data, do
//
//     final pemeriksaanModel = pemeriksaanModelFromJson(jsonString);

import 'dart:convert';

PemeriksaanModel pemeriksaanModelFromJson(String str) =>
    PemeriksaanModel.fromJson(json.decode(str));

String pemeriksaanModelToJson(PemeriksaanModel data) =>
    json.encode(data.toJson());

class PemeriksaanModel {
  final int? idPemeriksaan;
  final int? idBalita;
  final String? name;
  final DateTime? tanggalLahir;
  final String? jenisKelamin;
  final int? usia;
  final String? beratBadan;
  final String? tinggiBadan;
  final String? status;

  PemeriksaanModel({
    this.idPemeriksaan,
    this.idBalita,
    this.name,
    this.tanggalLahir,
    this.jenisKelamin,
    this.usia,
    this.beratBadan,
    this.tinggiBadan,
    this.status,
  });

  factory PemeriksaanModel.fromJson(Map<String, dynamic> json) =>
      PemeriksaanModel(
        idPemeriksaan: json["id_pemeriksaan"],
        idBalita: json["id_balita"],
        name: json["name"],
        tanggalLahir: json["tanggal_lahir"] == null
            ? null
            : DateTime.parse(json["tanggal_lahir"]),
        jenisKelamin: json["jenis_kelamin"],
        usia: json["usia"],
        beratBadan: json["berat_badan"],
        tinggiBadan: json["tinggi_badan"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id_pemeriksaan": idPemeriksaan,
        "id_balita": idBalita,
        "name": name,
        "tanggal_lahir":
            "${tanggalLahir!.year.toString().padLeft(4, '0')}-${tanggalLahir!.month.toString().padLeft(2, '0')}-${tanggalLahir!.day.toString().padLeft(2, '0')}",
        "jenis_kelamin": jenisKelamin,
        "usia": usia,
        "berat_badan": beratBadan,
        "tinggi_badan": tinggiBadan,
        "status": status,
      };
}
