import 'dart:convert';

PosyanduModel posyanduModelFromJson(String str) =>
    PosyanduModel.fromJson(json.decode(str));

String posyanduModelToJson(PosyanduModel data) => json.encode(data.toJson());

class PosyanduModel {
  final int? id;
  final String? name;
  final String? alamat;

  PosyanduModel({
    this.id,
    this.name,
    this.alamat,
  });

  factory PosyanduModel.fromJson(Map<String, dynamic> json) => PosyanduModel(
        id: json["id"],
        name: json["name"],
        alamat: json["alamat"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "alamat": alamat,
      };
}
