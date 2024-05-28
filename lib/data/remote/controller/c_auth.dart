import 'package:get/get.dart';
import 'package:skripsi_pos_dg/data/models/auth_response_model.dart';
import 'package:skripsi_pos_dg/data/remote/source/s_auth.dart';

class AuthController extends GetxController {
  final _data = AuthResponseModel().obs;
  AuthResponseModel get data => _data.value;
  set data(AuthResponseModel value) => _data.value = value;
  void setData(AuthResponseModel value) => _data.value = value;

  final _loading = false.obs;
  bool get loading => _loading.value;
  final _successLogin = false.obs;
  bool get successLogin => _successLogin.value;
  final _successLogout = false.obs;
  bool get successLogout => _successLogout.value;

  login(String username, String password) async {
    _loading.value = true;
    update();
    _successLogin.value = await SourceAuth.login(username, password);
    update();
    _loading.value = false;
    update();
  }

  logout() async {
    _loading.value = true;
    update();
    _successLogout.value = await SourceAuth.logout();
    update();
    _loading.value = false;
    update();
  }
}
