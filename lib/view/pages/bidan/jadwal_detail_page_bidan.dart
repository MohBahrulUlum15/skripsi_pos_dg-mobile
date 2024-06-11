import 'package:d_info/d_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skripsi_pos_dg/config/app_color.dart';
import 'package:skripsi_pos_dg/data/models/pemeriksaan_model.dart';
import 'package:skripsi_pos_dg/data/remote/controller/c_pemeriksaan.dart';
import 'package:skripsi_pos_dg/view/pages/bidan/periksa_page_bidan.dart';

class JadwalDetailPageBidan extends StatefulWidget {
  final int id;
  const JadwalDetailPageBidan({super.key, required this.id});

  @override
  State<JadwalDetailPageBidan> createState() => _JadwalDetailPageBidanState();
}

class _JadwalDetailPageBidanState extends State<JadwalDetailPageBidan>
    with SingleTickerProviderStateMixin {
  final cPemeriksaans = Get.put(PemeriksaanController());
  late TabController _tabController;

  refresh() {
    cPemeriksaans.getListPemeriksaan(widget.id);
  }

  @override
  void initState() {
    refresh();
    _tabController = TabController(length: 2, vsync: this);
    cPemeriksaans.getListPemeriksaan(widget.id);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget buildListBelum(List<PemeriksaanModel> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        PemeriksaanModel pemeriksaan = list[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: InkWell(
            onTap: () {},
            child: Container(
                padding: const EdgeInsets.all(8.0),
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
                        const Text('Nama'),
                        SizedBox(
                          height: 4.h,
                        ),
                        const Text('Jenis Kelamin'),
                        SizedBox(
                          height: 4.h,
                        ),
                        const Text('Usia'),
                      ],
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${pemeriksaan.name}'),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text('${pemeriksaan.jenisKelamin}'),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text('${pemeriksaan.usia}'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            bool? result = await Get.to(
                              () => PeriksaPageBidan(
                                idPemeriksaan: pemeriksaan.idPemeriksaan,
                                namaBalita: pemeriksaan.name,
                                usiaBalita: pemeriksaan.usia?.toDouble(),
                                jenisKelaminBalita: pemeriksaan.jenisKelamin,
                              ),
                            );
                            if (result == true) {
                              refresh();
                            }
                          },
                          child: const Text('Periksa'),
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

  Widget buildListSudah(List<PemeriksaanModel> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        PemeriksaanModel pemeriksaan = list[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: InkWell(
            onTap: () {},
            child: Container(
                padding: const EdgeInsets.all(8.0),
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
                        const Text('Nama'),
                        SizedBox(
                          height: 4.h,
                        ),
                        const Text('Jenis Kelamin'),
                        SizedBox(
                          height: 4.h,
                        ),
                        const Text('Usia'),
                      ],
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${pemeriksaan.name}'),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text('${pemeriksaan.jenisKelamin}'),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text('${pemeriksaan.usia}'),
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
                            DInfo.dialogSuccess(context,
                                'Pemeriksaan Sudah Selesai dengan detail : BB = ${pemeriksaan.beratBadan}');
                            DInfo.closeDialog(context);
                            // Get.to(
                            //   () => PeriksaPageBidan(
                            //     idPemeriksaan: pemeriksaan.idPemeriksaan,
                            //     namaBalita: pemeriksaan.name,
                            //   ),
                            // );
                          },
                          child: const Text('Lihat'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('List Pemeriksaan'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              child: Text(
                'belum',
                style: TextStyle(color: AppColor.whiteColor),
              ),
            ),
            Tab(
              child: Text(
                'sudah',
                style: TextStyle(color: AppColor.whiteColor),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<PemeriksaanController>(
              builder: (_) {
                if (_.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return TabBarView(controller: _tabController, children: [
                  RefreshIndicator(
                    onRefresh: () async => refresh(),
                    child: buildListBelum(_.belumPemeriksaan),
                  ),
                  RefreshIndicator(
                    onRefresh: () async => refresh(),
                    child: buildListSudah(_.sudahPemeriksaan),
                  )
                ]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
