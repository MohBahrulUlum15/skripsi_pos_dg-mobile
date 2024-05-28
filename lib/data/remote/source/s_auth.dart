import 'package:get/get.dart';
import 'package:skripsi_pos_dg/config/network/api.dart';
import 'package:skripsi_pos_dg/config/network/app_request.dart';
import 'package:skripsi_pos_dg/data/local/session.dart';
import 'package:skripsi_pos_dg/data/models/auth_response_model.dart';
import 'package:skripsi_pos_dg/data/remote/controller/c_auth.dart';

class SourceAuth {
  static Future<bool> login(String email, String password) async {
    String url = '${Api.BASE_URL}/login';

    Map? responseBody = await AppRequest.postMethod(
      url,
      {'email': email, 'password': password},
    );

    if (responseBody == null) {
      print("Response is null");
      return false;
    }

    if (!responseBody['success']) {
      // print("Login failed: ${responseBody['message']}");
      return false;
    } else {
      Map<String, dynamic> jsonMap = Map<String, dynamic>.from(responseBody);
      AuthResponseModel authResponse = AuthResponseModel.fromJson(jsonMap);
      bool saveSuccess = await Session.saveAuthData(authResponse);
      if (saveSuccess) {
        return responseBody['success'];
      } else {
        return false;
      }
    }
  }

  static Future<bool> logout() async {
    String url = '${Api.BASE_URL}/logout';
    final cAuth = Get.put(AuthController());
    String token = cAuth.data.token!;

    Map? responseBody = await AppRequest.postMethod(url, {}, token: token);

    if (responseBody == null || !responseBody['success']) {
      return false;
    } else {
      bool saveSuccess = await Session.clearAuthData();
      return saveSuccess && responseBody['success'];
    }
  }
}
