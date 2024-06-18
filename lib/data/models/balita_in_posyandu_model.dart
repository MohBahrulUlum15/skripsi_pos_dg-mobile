import 'dart:convert';

BalitaInPosyanduModel balitaInPosyanduModelFromJson(String str) =>
    BalitaInPosyanduModel.fromJson(json.decode(str));

String balitaInPosyanduModelToJson(BalitaInPosyanduModel data) =>
    json.encode(data.toJson());

class BalitaInPosyanduModel {
  final int? id;
  final String? name;
  final DateTime? tanggalLahir;
  final String? jenisKelamin;
  final String? bbLahir;
  final String? tbLahir;
  final int? orangTuaId;
  final int? posyanduId;

  BalitaInPosyanduModel({
    this.id,
    this.name,
    this.tanggalLahir,
    this.jenisKelamin,
    this.bbLahir,
    this.tbLahir,
    this.orangTuaId,
    this.posyanduId,
  });

  factory BalitaInPosyanduModel.fromJson(Map<String, dynamic> json) =>
      BalitaInPosyanduModel(
        id: json["id"],
        name: json["name"],
        tanggalLahir: json["tanggal_lahir"] == null
            ? null
            : DateTime.parse(json["tanggal_lahir"]),
        jenisKelamin: json["jenis_kelamin"],
        bbLahir: json["bb_lahir"],
        tbLahir: json["tb_lahir"],
        orangTuaId: json["orang_tua_id"],
        posyanduId: json["posyandu_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tanggal_lahir":
            "${tanggalLahir!.year.toString().padLeft(4, '0')}-${tanggalLahir!.month.toString().padLeft(2, '0')}-${tanggalLahir!.day.toString().padLeft(2, '0')}",
        "jenis_kelamin": jenisKelamin,
        "bb_lahir": bbLahir,
        "tb_lahir": tbLahir,
        "orang_tua_id": orangTuaId,
        "posyandu_id": posyanduId,
      };
}
