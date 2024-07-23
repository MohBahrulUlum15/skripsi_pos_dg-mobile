import 'package:get/get.dart';
import 'package:skripsi_pos_dg/config/network/api.dart';
import 'package:skripsi_pos_dg/config/network/app_request.dart';
import 'package:skripsi_pos_dg/data/models/balita_in_ortu_model.dart';
import 'package:skripsi_pos_dg/data/remote/controller/c_auth.dart';

class SourceBalita {
  static Future<List<BalitaInOrtuModel>> getBalitasForOrtu() async {
    String url = '${Api.BASE_URL}/balitas';
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
      return list.map((e) => BalitaInOrtuModel.fromJson(e)).toList();
    }
  }
}
