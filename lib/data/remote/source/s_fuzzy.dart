import 'package:skripsi_pos_dg/config/network/api.dart';
import 'package:skripsi_pos_dg/config/network/app_request.dart';

class SourceFuzzy {
  static Future<Map<String, dynamic>?> postFuzzy(double usia, double beratBadan,
      double tinggiBadan, String jenisKelamin) async {
    String url = Api.BASE_URL_FOR_FUZZY;
    Map<String, dynamic>? responseBody = await AppRequest.postMethodForFuzzy(
      url,
      {
        "usia": usia,
        "bb": beratBadan,
        "tb": tinggiBadan,
        "jk": jenisKelamin,
      },
    );

    return responseBody;
  }
}
