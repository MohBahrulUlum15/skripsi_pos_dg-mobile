import 'package:get/get.dart';
import 'package:skripsi_pos_dg/data/models/balita_in_posyandu_model.dart';
import 'package:skripsi_pos_dg/data/remote/source/s_posyandu.dart';

class DetailPosyanduController extends GetxController {
  final _loadingBalita = false.obs;
  bool get loadingBalita => _loadingBalita.value;

  final _listBalitaInPosyandu = <BalitaInPosyanduModel>[].obs;
  List<BalitaInPosyanduModel> get listBalitaInPosyandu =>
      _listBalitaInPosyandu.value;

  getListBalitaInPosyandu(int id) async {
    _loadingBalita.value = true;
    update();
    _listBalitaInPosyandu.value = await SourcePosyandu.getBalitasInPosyandu(id);
    update();
    _loadingBalita.value = false;
    update();
  }
}
