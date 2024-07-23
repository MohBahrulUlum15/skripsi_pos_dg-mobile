import 'package:get/get.dart';
import 'package:skripsi_pos_dg/config/network/api.dart';
import 'package:skripsi_pos_dg/config/network/app_request.dart';
import 'package:skripsi_pos_dg/data/models/detail_balita_model.dart';
import 'package:skripsi_pos_dg/data/models/pemeriksaan_model.dart';
import 'package:skripsi_pos_dg/data/remote/controller/c_auth.dart';

class SourcePemeriksaan {
  static Future<List<PemeriksaanModel>> getPemeriksaans(int id) async {
    String url = '${Api.BASE_URL}/jadwals/$id';
    final cAuth = Get.put(AuthController());
    String token = cAuth.data.token!;
    Map? responseBody = await AppRequest.getMethod(url, token);

    if (responseBody == null) {
      // print("Response is null");
      return [];
    }

    if (!responseBody['success']) {
      // print("Login failed: ${responseBody['message']}");
      return [];
    } else {
      List list = responseBody['data'];
      return list.map((e) => PemeriksaanModel.fromJson(e)).toList();
    }
  }

  static Future<List<DetailBalitaModel>> getListPemeriksaanDetailBalita(
      int balitaId) async {
    String url = '${Api.BASE_URL}/pemeriksaan/$balitaId';
    final cAuth = Get.put(AuthController());
    String token = cAuth.data.token!;
    Map? responseBody = await AppRequest.getMethod(url, token);

    if (responseBody == null) {
      return [];
    }

    if (!responseBody['success']) {
      return [];
    } else {
      List list = responseBody['data'];
      return list.map((e) => DetailBalitaModel.fromJson(e)).toList();
    }
  }

  static Future<bool> postPemeriksaan(
    int id,
    double beratBadan,
    double tinggiBadan,
    String statusGiziBBU,
    double deffValBBU,
    double valDegreeBBU,
    String statusGiziTBU,
    double deffValTBU,
    double valDegreeTBU,
    String statusGiziBBTB,
    double deffValBBTB,
    double valDegreeBBTB,
  ) async {
    String url = '${Api.BASE_URL}/post-pemeriksaan';
    final cAuth = Get.put(AuthController());
    String token = cAuth.data.token!;
    Map? responseBody = await AppRequest.postMethod(
      url,
      {
        'id': id,
        'berat_badan': beratBadan,
        'tinggi_badan': tinggiBadan,
        'status_gizi_bb_u': statusGiziBBU,
        'deff_val_bb_u': deffValBBU,
        'val_degree_bb_u': valDegreeBBU,
        'status_gizi_tb_u': statusGiziTBU,
        'deff_val_tb_u': deffValTBU,
        'val_degree_tb_u': valDegreeTBU,
        'status_gizi_bb_tb': statusGiziBBTB,
        'deff_val_bb_tb': deffValBBTB,
        'val_degree_bb_tb': valDegreeBBTB
      },
      token: token,
    );

    if (responseBody == null || !responseBody['success']) {
      return false;
    } else {
      return responseBody['success'];
    }
  }
}
