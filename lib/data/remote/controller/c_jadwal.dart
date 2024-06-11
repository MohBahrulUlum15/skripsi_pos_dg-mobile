import 'package:get/get.dart';
import 'package:skripsi_pos_dg/data/models/jadwal_model.dart';
import 'package:skripsi_pos_dg/data/remote/source/s_jadwal.dart';

class JadwalController extends GetxController {
  final _loading = false.obs;
  bool get loading => _loading.value;

  final _listJadwal = <JadwalModel>[].obs;
  List<JadwalModel> get listJadwal => _listJadwal.value;

  getListJadwal() async {
    _loading.value = true;
    update();
    _listJadwal.value = await SourceJadwal.getJadwals();
    update();
    _loading.value = false;
    update();
  }
}
