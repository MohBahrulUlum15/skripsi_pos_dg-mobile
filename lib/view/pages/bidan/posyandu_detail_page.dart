import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsi_pos_dg/config/app_format.dart';
import 'package:skripsi_pos_dg/data/models/balita_in_posyandu_model.dart';
import 'package:skripsi_pos_dg/data/remote/controller/c_detail_posyandu.dart';
import 'package:skripsi_pos_dg/data/remote/controller/c_posyandu.dart';

class PosyanduDetailPageBidan extends StatefulWidget {
  final int id;
  const PosyanduDetailPageBidan({super.key, required this.id});

  @override
  State<PosyanduDetailPageBidan> createState() =>
      _PosyanduDetailPageBidanState();
}

class _PosyanduDetailPageBidanState extends State<PosyanduDetailPageBidan> {
  final cDetailPosyandu = Get.put(DetailPosyanduController());

  refresh() {
    cDetailPosyandu.getListBalitaInPosyandu(widget.id);
  }

  @override
  void initState() {
    refresh();
    cDetailPosyandu.getListBalitaInPosyandu(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Balita di Posyandu'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<DetailPosyanduController>(
                builder: (_) {
                  if (_.loadingBalita) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return RefreshIndicator(
                    onRefresh: () async => refresh(),
                    child: buildListBalitaInPosyandu(_.listBalitaInPosyandu),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildListBalitaInPosyandu(List<BalitaInPosyanduModel> listBalitaInPosyandu) {
    return ListView.builder(
      itemCount: listBalitaInPosyandu.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(listBalitaInPosyandu[index].name!),
            subtitle: Text(listBalitaInPosyandu[index].jenisKelamin!),
            trailing:
                Text(AppFormat.date(listBalitaInPosyandu[index].tanggalLahir!)),
          ),
        );
      },
    );
  }
}
