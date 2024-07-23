import 'package:get/get.dart';
import 'package:skripsi_pos_dg/data/models/detail_balita_model.dart';
import 'package:skripsi_pos_dg/data/remote/source/s_pemeriksaan.dart';

class DetailBalitaController extends GetxController {
  final _loading = false.obs;
  bool get loading => _loading.value;

  final _listDetailBalita = <DetailBalitaModel>[].obs;
  List<DetailBalitaModel> get listDetailBalita => _listDetailBalita.value;

  getListDetailBalita(int balitaId) async {
    _loading.value = true;
    update();
    _listDetailBalita.value =
        await SourcePemeriksaan.getListPemeriksaanDetailBalita(balitaId);
    update();
    _loading.value = false;
    update();
  }
}
