import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skripsi_pos_dg/data/models/auth_response_model.dart';
import 'package:skripsi_pos_dg/data/remote/controller/c_auth.dart';

class Session {
  //save user and token
  static Future<bool> saveAuthData(AuthResponseModel user) async {
    if (user.token == null) {
      return false;
    }
    final pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token!);
    await pref.setString('user_data', jsonEncode(user.data?.toJson()));
    final cAuth = Get.put(AuthController());
    cAuth.setData(user);
    return true;
  }

  static Future<AuthResponseModel?> getAuthData() async {
    final pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    String? userDataString = pref.getString('user_data');

    if (token != null && userDataString != null) {
      Map<String, dynamic> userDataJson = json.decode(userDataString);
      Data userData = Data.fromJson(userDataJson);
      AuthResponseModel authResponse = AuthResponseModel(
        token: token,
        data: userData,
      );
      final cAuth = Get.put(AuthController());
      cAuth.setData(authResponse);
      return authResponse;
    }
    return null;
  }

  static Future<bool> clearAuthData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('token');
    await pref.remove('user_data');
    final cAuth = Get.put(AuthController());
    cAuth.setData(AuthResponseModel());
    return true;
  }
}
