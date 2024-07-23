import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skripsi_pos_dg/config/app_color.dart';
import 'package:skripsi_pos_dg/data/models/detail_balita_model.dart';
import 'package:skripsi_pos_dg/data/remote/controller/c_detail_balita.dart';

class BalitaDetailPage extends StatefulWidget {
  final int balitaID;
  final String balitaName;
  const BalitaDetailPage(
      {super.key, required this.balitaID, required this.balitaName});

  @override
  State<BalitaDetailPage> createState() => _BalitaDetailPageState();
}

class _BalitaDetailPageState extends State<BalitaDetailPage> {
  final cDetailBalita = Get.put(DetailBalitaController());

  refresh() {
    cDetailBalita.getListDetailBalita(widget.balitaID);
  }

  @override
  void initState() {
    refresh();
    cDetailBalita.getListDetailBalita(widget.balitaID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.balitaName),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 4.0),
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<DetailBalitaController>(
                builder: (_) {
                  if (_.loading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (_.listDetailBalita.isEmpty) {
                    return Center(
                      child: Text('Catatan Pemeriksaan Belum Ada'),
                    );
                  }
                  return RefreshIndicator(
                    onRefresh: () async => refresh(),
                    child: buildListDetailBalita(_.listDetailBalita),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildListDetailBalita(List<DetailBalitaModel> listDetailBalita) {
    return ListView.builder(
      itemCount: listDetailBalita.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
                color: AppColor.lightGreyColor,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Usia : ${listDetailBalita[index].usia} Bulan'),
                    Text('Berat : ${listDetailBalita[index].beratBadan} Kg'),
                    Text('Tinggi : ${listDetailBalita[index].tinggiBadan} Cm'),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('BB/U'),
                        SizedBox(
                          height: 4.h,
                        ),
                        const Text('TB/U'),
                        SizedBox(
                          height: 4.h,
                        ),
                        const Text('BB/TB'),
                      ],
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '${listDetailBalita[index].hasilFuzzy!.statusGiziBbU}'),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                              '${listDetailBalita[index].hasilFuzzy!.statusGiziTbU}'),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                              '${listDetailBalita[index].hasilFuzzy!.statusGiziBbTb}'),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
