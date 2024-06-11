// To parse this JSON data, do
//
//     final fuzzyModel = fuzzyModelFromJson(jsonString);

import 'dart:convert';

FuzzyModel fuzzyModelFromJson(String str) =>
    FuzzyModel.fromJson(json.decode(str));

String fuzzyModelToJson(FuzzyModel data) => json.encode(data.toJson());

class FuzzyModel {
  final double? usia;
  final double? beratBadan;
  final double? tinggiBadan;
  final Hasil? hasil;

  FuzzyModel({
    this.usia,
    this.beratBadan,
    this.tinggiBadan,
    this.hasil,
  });

  factory FuzzyModel.fromJson(Map<String, dynamic> json) => FuzzyModel(
        usia: json["usia"].toDouble(),
        beratBadan: json["berat_badan"].toDouble(),
        tinggiBadan: json["tinggi_badan"]?.toDouble(),
        hasil: json["hasil"] == null ? null : Hasil.fromJson(json["hasil"]),
      );

  Map<String, dynamic> toJson() => {
        "usia": usia,
        "berat_badan": beratBadan,
        "tinggi_badan": tinggiBadan,
        "hasil": hasil?.toJson(),
      };
}

class Hasil {
  final BbU? bbU;
  final TbU? tbU;
  final BbTb? bbTb;

  Hasil({
    this.bbU,
    this.tbU,
    this.bbTb,
  });

  factory Hasil.fromJson(Map<String, dynamic> json) => Hasil(
        bbU: json["bb_u"] == null ? null : BbU.fromJson(json["bb_u"]),
        tbU: json["tb_u"] == null ? null : TbU.fromJson(json["tb_u"]),
        bbTb: json["bb_tb"] == null ? null : BbTb.fromJson(json["bb_tb"]),
      );

  Map<String, dynamic> toJson() => {
        "bb_u": bbU?.toJson(),
        "tb_u": tbU?.toJson(),
        "bb_tb": bbTb?.toJson(),
      };
}

class BbTb {
  final double? defuzzifiedValue;
  final String? satatusGizi;
  final double? bbTbGiziBurukDegree;
  final double? bbTbGiziKurangDegree;
  final double? bbTbGiziNormalDegree;
  final double? bbTbBrskGiziLebihDegree;
  final double? bbTbGiziLebihDegree;
  final double? bbTbGiziObesitasDegree;

  BbTb({
    this.defuzzifiedValue,
    this.satatusGizi,
    this.bbTbGiziBurukDegree,
    this.bbTbGiziKurangDegree,
    this.bbTbGiziNormalDegree,
    this.bbTbBrskGiziLebihDegree,
    this.bbTbGiziLebihDegree,
    this.bbTbGiziObesitasDegree,
  });

  factory BbTb.fromJson(Map<String, dynamic> json) => BbTb(
        defuzzifiedValue: json["defuzzified_value"]?.toDouble(),
        satatusGizi: json["satatus gizi"],
        bbTbGiziBurukDegree: json["bb_tb_gizi_buruk_degree"]?.toDouble(),
        bbTbGiziKurangDegree: json["bb_tb_gizi_kurang_degree"]?.toDouble(),
        bbTbGiziNormalDegree: json["bb_tb_gizi_normal_degree"]?.toDouble(),
        bbTbBrskGiziLebihDegree:
            json["bb_tb_brsk_gizi_lebih_degree"]?.toDouble(),
        bbTbGiziLebihDegree: json["bb_tb_gizi_lebih_degree"]?.toDouble(),
        bbTbGiziObesitasDegree: json["bb_tb_gizi_obesitas_degree"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "defuzzified_value": defuzzifiedValue,
        "satatus gizi": satatusGizi,
        "bb_tb_gizi_buruk_degree": bbTbGiziBurukDegree,
        "bb_tb_gizi_kurang_degree": bbTbGiziKurangDegree,
        "bb_tb_gizi_normal_degree": bbTbGiziNormalDegree,
        "bb_tb_brsk_gizi_lebih_degree": bbTbBrskGiziLebihDegree,
        "bb_tb_gizi_lebih_degree": bbTbGiziLebihDegree,
        "bb_tb_gizi_obesitas_degree": bbTbGiziObesitasDegree,
      };
}

class BbU {
  final double? defuzzifiedValue;
  final String? statusGizi;
  final double? bbUSangatKurangDegree;
  final double? bbUKurangDegree;
  final double? bbUNormalDegree;
  final double? bbUResikoBbLebihDegree;

  BbU({
    this.defuzzifiedValue,
    this.statusGizi,
    this.bbUSangatKurangDegree,
    this.bbUKurangDegree,
    this.bbUNormalDegree,
    this.bbUResikoBbLebihDegree,
  });

  factory BbU.fromJson(Map<String, dynamic> json) => BbU(
        defuzzifiedValue: json["defuzzified_value"]?.toDouble(),
        statusGizi: json["status gizi"],
        bbUSangatKurangDegree: json["bb_u_sangat_kurang_degree"]?.toDouble(),
        bbUKurangDegree: json["bb_u_kurang_degree"]?.toDouble(),
        bbUNormalDegree: json["bb_u_normal_degree"]?.toDouble(),
        bbUResikoBbLebihDegree: json["bb_u_resiko_bb_lebih_degree"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "defuzzified_value": defuzzifiedValue,
        "status gizi": statusGizi,
        "bb_u_sangat_kurang_degree": bbUSangatKurangDegree,
        "bb_u_kurang_degree": bbUKurangDegree,
        "bb_u_normal_degree": bbUNormalDegree,
        "bb_u_resiko_bb_lebih_degree": bbUResikoBbLebihDegree,
      };
}

class TbU {
  final double? defuzzifiedValue;
  final String? statusGizi;
  final double? tbUSangatPendekDegree;
  final double? tbUPendekDegree;
  final double? tbUNormalDegree;
  final double? tbUTinggiDegree;

  TbU({
    this.defuzzifiedValue,
    this.statusGizi,
    this.tbUSangatPendekDegree,
    this.tbUPendekDegree,
    this.tbUNormalDegree,
    this.tbUTinggiDegree,
  });

  factory TbU.fromJson(Map<String, dynamic> json) => TbU(
        defuzzifiedValue: json["defuzzified_value"]?.toDouble(),
        statusGizi: json["status_gizi"],
        tbUSangatPendekDegree: json["tb_u_sangat_pendek_degree"]?.toDouble(),
        tbUPendekDegree: json["tb_u_pendek_degree"]?.toDouble(),
        tbUNormalDegree: json["tb_u_normal_degree"]?.toDouble(),
        tbUTinggiDegree: json["tb_u_tinggi_degree"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "defuzzified_value": defuzzifiedValue,
        "status_gizi": statusGizi,
        "tb_u_sangat_pendek_degree": tbUSangatPendekDegree,
        "tb_u_pendek_degree": tbUPendekDegree,
        "tb_u_normal_degree": tbUNormalDegree,
        "tb_u_tinggi_degree": tbUTinggiDegree,
      };
}
