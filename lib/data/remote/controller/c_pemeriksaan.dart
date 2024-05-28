import 'package:get/get.dart';
import 'package:skripsi_pos_dg/data/models/pemeriksaan_model.dart';
import 'package:skripsi_pos_dg/data/remote/source/s_pemeriksaan.dart';

class PemeriksaanController extends GetxController {
  final _loading = false.obs;
  bool get loading => _loading.value;

  final _listPemeriksaan = <PemeriksaanModel>[].obs;
  List<PemeriksaanModel> get listPemeriksaan => _listPemeriksaan.value;

  List<PemeriksaanModel> get belumPemeriksaan =>
      _listPemeriksaan.where((item) => item.status == 'belum').toList();

  List<PemeriksaanModel> get sudahPemeriksaan =>
      _listPemeriksaan.where((item) => item.status == 'sudah').toList();

  getListPemeriksaan(int id) async {
    _loading.value = true;
    update();
    _listPemeriksaan.value = await SourcePemeriksaan.getPemeriksaans(id);
    update();
    _loading.value = false;
    update();
  }
}