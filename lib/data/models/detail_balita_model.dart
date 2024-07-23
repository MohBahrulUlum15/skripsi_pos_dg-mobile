import 'dart:convert';

DetailBalitaModel detailBalitaModelFromJson(String str) =>
    DetailBalitaModel.fromJson(json.decode(str));

String detailBalitaModelToJson(DetailBalitaModel data) =>
    json.encode(data.toJson());

class DetailBalitaModel {
  final int? id;
  final int? usia;
  final String? beratBadan;
  final String? tinggiBadan;
  final String? status;
  final int? jadwalId;
  final int? balitaId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final HasilFuzzy? hasilFuzzy;

  DetailBalitaModel({
    this.id,
    this.usia,
    this.beratBadan,
    this.tinggiBadan,
    this.status,
    this.jadwalId,
    this.balitaId,
    this.createdAt,
    this.updatedAt,
    this.hasilFuzzy,
  });

  factory DetailBalitaModel.fromJson(Map<String, dynamic> json) =>
      DetailBalitaModel(
        id: json["id"],
        usia: json["usia"],
        beratBadan: json["berat_badan"],
        tinggiBadan: json["tinggi_badan"],
        status: json["status"],
        jadwalId: json["jadwal_id"],
        balitaId: json["balita_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        hasilFuzzy: json["hasil_fuzzy"] == null
            ? null
            : HasilFuzzy.fromJson(json["hasil_fuzzy"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "usia": usia,
        "berat_badan": beratBadan,
        "tinggi_badan": tinggiBadan,
        "status": status,
        "jadwal_id": jadwalId,
        "balita_id": balitaId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "hasil_fuzzy": hasilFuzzy?.toJson(),
      };
}

class HasilFuzzy {
  final int? id;
  final int? pemeriksaanId;
  final String? statusGiziBbU;
  final double? deffValBbU;
  final double? valDegreeBbU;
  final String? statusGiziTbU;
  final double? deffValTbU;
  final double? valDegreeTbU;
  final String? statusGiziBbTb;
  final double? deffValBbTb;
  final double? valDegreeBbTb;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  HasilFuzzy({
    this.id,
    this.pemeriksaanId,
    this.statusGiziBbU,
    this.deffValBbU,
    this.valDegreeBbU,
    this.statusGiziTbU,
    this.deffValTbU,
    this.valDegreeTbU,
    this.statusGiziBbTb,
    this.deffValBbTb,
    this.valDegreeBbTb,
    this.createdAt,
    this.updatedAt,
  });

  factory HasilFuzzy.fromJson(Map<String, dynamic> json) => HasilFuzzy(
        id: json["id"],
        pemeriksaanId: json["pemeriksaan_id"],
        statusGiziBbU: json["status_gizi_bb_u"],
        deffValBbU: json["deff_val_bb_u"]?.toDouble(),
        valDegreeBbU: json["val_degree_bb_u"]?.toDouble(),
        statusGiziTbU: json["status_gizi_tb_u"],
        deffValTbU: json["deff_val_tb_u"]?.toDouble(),
        valDegreeTbU: json["val_degree_tb_u"].toDouble(),
        statusGiziBbTb: json["status_gizi_bb_tb"],
        deffValBbTb: json["deff_val_bb_tb"]?.toDouble(),
        valDegreeBbTb: json["val_degree_bb_tb"]?.toDouble(),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pemeriksaan_id": pemeriksaanId,
        "status_gizi_bb_u": statusGiziBbU,
        "deff_val_bb_u": deffValBbU,
        "val_degree_bb_u": valDegreeBbU,
        "status_gizi_tb_u": statusGiziTbU,
        "deff_val_tb_u": deffValTbU,
        "val_degree_tb_u": valDegreeTbU,
        "status_gizi_bb_tb": statusGiziBbTb,
        "deff_val_bb_tb": deffValBbTb,
        "val_degree_bb_tb": valDegreeBbTb,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
