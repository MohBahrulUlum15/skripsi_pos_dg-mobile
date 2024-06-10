import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skripsi_pos_dg/config/app_color.dart';
import 'package:skripsi_pos_dg/config/app_format.dart';
import 'package:skripsi_pos_dg/data/models/jadwal_model.dart';
import 'package:skripsi_pos_dg/data/remote/controller/c_jadwal.dart';
import 'package:skripsi_pos_dg/view/pages/bidan/jadwal_detail_page_bidan.dart';

class JadwalPageBidan extends StatefulWidget {
  const JadwalPageBidan({super.key});

  @override
  State<JadwalPageBidan> createState() => _JadwalPageBidanState();
}

class _JadwalPageBidanState extends State<JadwalPageBidan> {
  final cJadwal = Get.put(JadwalController());

  refresh() {
    cJadwal.getListJadwal();
  }

  @override
  void initState() {
    refresh();
    cJadwal.getListJadwal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // title: Text('jadwal'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<JadwalController>(
                builder: (_) {
                  if (_.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return RefreshIndicator(
                    onRefresh: () async => refresh(),
                    child: buildListJadwal(_.listJadwal),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListJadwal(List<JadwalModel> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        JadwalModel jadwal = list[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: InkWell(
            onTap: () {},
            child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                    color: AppColor.lightGreyColor,
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 4.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Posyandu'),
                        SizedBox(
                          height: 8.h,
                        ),
                        const Text('Tanggal'),
                      ],
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${jadwal.namaPosyandu}'),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(AppFormat.date(jadwal.tanggal!)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.to(
                              () => JadwalDetailPageBidan(
                                id: jadwal.id!,
                              ),
                            );
                          },
                          child: const Text('Detail'),
                        ),
                      ],
                    )
                  ],
                )),
          ),
        );
      },
    );
  }
}
