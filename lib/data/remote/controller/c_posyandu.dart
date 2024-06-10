import 'package:get/get.dart';
import 'package:skripsi_pos_dg/data/models/posyandu_model.dart';
import 'package:skripsi_pos_dg/data/remote/source/s_posyandu.dart';

class PosyanduController extends GetxController {
  final _loading = false.obs;
  bool get loading => _loading.value;

  final _listPosyandu = <PosyanduModel>[].obs;
  List<PosyanduModel> get listPosyandu => _listPosyandu.value;

  getListPosyandu() async {
    _loading.value = true;
    update();
    _listPosyandu.value = await SourcePosyandu.getPosyandus();
    update();
    _loading.value = false;
    update();
  }
}
