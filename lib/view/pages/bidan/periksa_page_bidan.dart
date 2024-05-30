import 'package:d_info/d_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsi_pos_dg/config/app_color.dart';
import 'package:skripsi_pos_dg/data/remote/controller/c_pemeriksaan.dart';

class PeriksaPageBidan extends StatefulWidget {
  final int? idPemeriksaan;
  final String? namaBalita;
  const PeriksaPageBidan({super.key, this.idPemeriksaan, this.namaBalita});

  @override
  State<PeriksaPageBidan> createState() => _PeriksaPageBidanState();
}

class _PeriksaPageBidanState extends State<PeriksaPageBidan> {
  final cPemeriksaan = Get.put(PemeriksaanController());
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
          int.parse(beratBadanController.value.text),
          int.parse(tinggiBadanController.value.text));
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
                        postPemeriksaan();
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
