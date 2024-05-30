import 'package:get/get.dart';
import 'package:skripsi_pos_dg/config/network/api.dart';
import 'package:skripsi_pos_dg/config/network/app_request.dart';
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
      print(list);
      return list.map((e) => PemeriksaanModel.fromJson(e)).toList();
    }
  }

  static Future<bool> postPemeriksaan(
      int id, int beratBadan, int tinggiBadan) async {
    String url = '${Api.BASE_URL}/post-pemeriksaan';
    final cAuth = Get.put(AuthController());
    String token = cAuth.data.token!;
    Map? responseBody = await AppRequest.postMethod(
      url,
      {
        'id': id,
        'berat_badan': beratBadan,
        'tinggi_badan': tinggiBadan,
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
