import 'package:flutter/material.dart';
import 'package:skripsi_pos_dg/config/app_color.dart';

class PeriksaPageBidan extends StatefulWidget {
  final int? idPemeriksaan;
  final String? namaBalita;
  const PeriksaPageBidan({super.key, this.idPemeriksaan, this.namaBalita});

  @override
  State<PeriksaPageBidan> createState() => _PeriksaPageBidanState();
}

class _PeriksaPageBidanState extends State<PeriksaPageBidan> {
  @override
  Widget build(BuildContext context) {
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
                  decoration: const InputDecoration(
                    labelText: 'Berat Badan',
                    labelStyle: TextStyle(
                      color: AppColor.darkGreyColor,
                    ),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Tinggi Badan',
                    labelStyle: TextStyle(
                      color: AppColor.darkGreyColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  onPressed: () {},
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
