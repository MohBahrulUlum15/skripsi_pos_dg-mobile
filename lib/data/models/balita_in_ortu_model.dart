import 'dart:convert';
import 'dart:ffi';

BalitaInOrtuModel balitaInOrtuModelFromJson(String str) =>
    BalitaInOrtuModel.fromJson(json.decode(str));

String balitaInOrtuModelToJson(BalitaInOrtuModel data) =>
    json.encode(data.toJson());

class BalitaInOrtuModel {
  final int? id;
  final String? name;
  final DateTime? tanggalLahir;
  final String? jenisKelamin;
  final Double? bbLahir;
  final Double? tbLahir;
  final int? orangTuaId;
  final int? posyanduId;
  final String? createdAt;
  final String? updatedAt;

  BalitaInOrtuModel({
    this.id,
    this.name,
    this.tanggalLahir,
    this.jenisKelamin,
    this.bbLahir,
    this.tbLahir,
    this.orangTuaId,
    this.posyanduId,
    this.createdAt,
    this.updatedAt,
  });

  factory BalitaInOrtuModel.fromJson(Map<String, dynamic> json) =>
      BalitaInOrtuModel(
        id: json["id"],
        name: json["name"],
        tanggalLahir: json["tanggal_lahir"] == null
            ? null
            : DateTime.parse(json["tanggal_lahir"]),
        jenisKelamin: json["jenis_kelamin"],
        bbLahir: json["bb_lahir"].toDouble(),
        tbLahir: json["tb_lahir"].toDouble(),
        orangTuaId: json["orang_tua_id"],
        posyanduId: json["posyandu_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
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
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
