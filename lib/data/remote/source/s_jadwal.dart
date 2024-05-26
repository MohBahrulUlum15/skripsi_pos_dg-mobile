import 'package:get/get.dart';
import 'package:skripsi_pos_dg/config/network/api.dart';
import 'package:skripsi_pos_dg/config/network/app_request.dart';
import 'package:skripsi_pos_dg/data/models/jadwal_model.dart';
import 'package:skripsi_pos_dg/data/remote/controller/c_auth.dart';

class SourceJadwal {
  static Future<List<JadwalModel>> getJadwals() async {
    String url = '${Api.BASE_URL}/jadwals';
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
      return list.map((e) => JadwalModel.fromJson(e)).toList();
    }
  }
}
