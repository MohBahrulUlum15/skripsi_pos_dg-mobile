import 'package:get/get.dart';
import 'package:skripsi_pos_dg/data/models/balita_in_ortu_model.dart';
import 'package:skripsi_pos_dg/data/remote/source/s_balita.dart';

class BalitaController extends GetxController {
  final _loading = false.obs;
  bool get loading => _loading.value;

  final _listBalitaForOrtu = <BalitaInOrtuModel>[].obs;
  List<BalitaInOrtuModel> get listBalitaForOrtu => _listBalitaForOrtu.value;

  getListBalitaForOrtu() async {
    _loading.value = true;
    update();
    _listBalitaForOrtu.value = await SourceBalita.getBalitasForOrtu();
    update();
    _loading.value = false;
    update();
  }
}
