import 'package:d_info/d_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsi_pos_dg/config/app_color.dart';
import 'package:skripsi_pos_dg/data/remote/controller/c_fuzzy.dart';
import 'package:skripsi_pos_dg/data/remote/controller/c_pemeriksaan.dart';
import 'package:skripsi_pos_dg/view/widget/custom_dialog_for_fuzzy.dart';

class PeriksaPageBidan extends StatefulWidget {
  final int? idPemeriksaan;
  final double? usiaBalita;
  final String? namaBalita, jenisKelaminBalita;
  const PeriksaPageBidan(
      {super.key,
      this.idPemeriksaan,
      this.namaBalita,
      this.usiaBalita,
      this.jenisKelaminBalita});

  @override
  State<PeriksaPageBidan> createState() => _PeriksaPageBidanState();
}

class _PeriksaPageBidanState extends State<PeriksaPageBidan> {
  final cPemeriksaan = Get.put(PemeriksaanController());
  final cFuzzy = Get.put(FuzzyController());
  final formKey = GlobalKey<FormState>();

  final TextEditingController beratBadanController = TextEditingController();
  final TextEditingController tinggiBadanController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    postPemeriksaan() async {
      await cPemeriksaan.postPemeriksaan(
          widget.idPemeriksaan!,
          double.parse(beratBadanController.value.text),
          double.parse(tinggiBadanController.value.text));
      if (cPemeriksaan.successPostPemeriksaan) {
        DInfo.dialogSuccess(context, 'Berhasil Menyimpan Data');
        DInfo.closeDialog(context, actionAfterClose: () {
          Get.back(result: true);
        });
      } else {
        DInfo.dialogError(context, 'Gagal Menyimpan Data');
        DInfo.closeDialog(context);
      }
    }

    postPemeriksaanForGetFuzzy() async {
      await cFuzzy.postFuzzy(
        widget.usiaBalita!,
        double.parse(beratBadanController.value.text),
        double.parse(tinggiBadanController.value.text),
        widget.jenisKelaminBalita!,
      );
      if (cFuzzy.successPostFuzzy) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return CustomDialogForFuzzy(
                responseData: cFuzzy.responseData,
                onConfirm: () {
                  postPemeriksaan();
                },
                onClose: () {});
          },
        );
      } else {
        DInfo.dialogError(context, 'Gagal Menyimpan Data');
      }
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('${widget.namaBalita}'),
                Text('Usia: ${widget.usiaBalita} Bulan'),
                Text('Jenis Kelamin: ${widget.jenisKelaminBalita}'),
                TextFormField(
                  controller: beratBadanController,
                  decoration: const InputDecoration(
                    labelText: 'Berat Badan',
                    labelStyle: TextStyle(
                      color: AppColor.darkGreyColor,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: tinggiBadanController,
                  decoration: const InputDecoration(
                    labelText: 'Tinggi Badan',
                    labelStyle: TextStyle(
                      color: AppColor.darkGreyColor,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (beratBadanController.value.text.isEmpty) {
                      DInfo.dialogError(context, 'Berat Badan can\'t be empty');
                    } else {
                      if (tinggiBadanController.value.text.isEmpty) {
                        DInfo.dialogError(
                            context, 'Tinggi Badan can\'t be empty');
                      } else {
                        // postPemeriksaan();
                        postPemeriksaanForGetFuzzy();
                        // DInfo.dialogSuccess(context, 'fungsi login');
                      }
                    }
                  },
                  child: const Text('Simpan'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
