import 'package:get/get.dart';
import 'package:skripsi_pos_dg/data/models/fuzzy_model.dart';
import 'package:skripsi_pos_dg/data/remote/source/s_fuzzy.dart';

class FuzzyController extends GetxController {
  final _loading = false.obs;
  bool get loading => _loading.value;

  final _successPostFuzzy = false.obs;
  bool get successPostFuzzy => _successPostFuzzy.value;

  final _responseData = FuzzyModel().obs;
  FuzzyModel get responseData => _responseData.value;

  postFuzzy(double usia, double beratBadan, double tinggiBadan, String jenisKelamin) async {
    _loading.value = true;
    update();

    Map<String, dynamic>? responseBody = await SourceFuzzy.postFuzzy(usia, beratBadan, tinggiBadan, jenisKelamin);

    if (responseBody != null) {
      _responseData.value = FuzzyModel.fromJson(responseBody);
      _successPostFuzzy.value = true;
    } else {
      _successPostFuzzy.value = false;
    }

    _loading.value = false;
    update();
  }
}
