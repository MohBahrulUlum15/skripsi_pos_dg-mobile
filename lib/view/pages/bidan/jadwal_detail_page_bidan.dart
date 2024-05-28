import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skripsi_pos_dg/config/app_color.dart';
import 'package:skripsi_pos_dg/data/models/pemeriksaan_model.dart';
import 'package:skripsi_pos_dg/data/remote/controller/c_pemeriksaan.dart';

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

  Widget buildList(List<PemeriksaanModel> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        PemeriksaanModel pemeriksaan = list[index];
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: InkWell(
            onTap: () {},
            child: Container(
              // color: AppColor.secondaryColor,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: AppColor.secondaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${pemeriksaan.name}'),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text('${pemeriksaan.tanggalLahir}'),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text('${pemeriksaan.jenisKelamin}'),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text('${pemeriksaan.usia}'),
                  // Text('${jadwal.bidans!.length.toString()}'),
                ],
              ),
            ),
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
        // title: Text('jadwal'),
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
                    child: buildList(_.belumPemeriksaan),
                  ),
                  RefreshIndicator(
                    onRefresh: () async => refresh(),
                    child: buildList(_.sudahPemeriksaan),
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
