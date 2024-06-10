import 'package:get/get.dart';
import 'package:skripsi_pos_dg/config/network/api.dart';
import 'package:skripsi_pos_dg/config/network/app_request.dart';
import 'package:skripsi_pos_dg/data/models/posyandu_model.dart';
import 'package:skripsi_pos_dg/data/remote/controller/c_auth.dart';

class SourcePosyandu {
  static Future<List<PosyanduModel>> getPosyandus() async {
    String url = '${Api.BASE_URL}/posyandu-by-bidan';
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
      return list.map((e) => PosyanduModel.fromJson(e)).toList();
    }
  }
}
