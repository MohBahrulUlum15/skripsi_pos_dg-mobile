import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsi_pos_dg/data/models/jadwal_model.dart';
import 'package:skripsi_pos_dg/data/remote/controller/c_jadwal.dart';

class JadwalPage extends StatefulWidget {
  const JadwalPage({super.key});

  @override
  State<JadwalPage> createState() => _JadwalPageState();
}

class _JadwalPageState extends State<JadwalPage> {
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
          // title: Text('jadwal'),
          ),
      body: Column(
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
                  child: ListView.builder(
                    itemCount: _.listJadwal.length,
                    itemBuilder: (context, index) {
                      JadwalModel jadwal = _.listJadwal[index];
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            Text('${jadwal.namaPosyandu}'),
                            Text('${jadwal.tanggal}'),
                            // Text('${jadwal.bidans!.length.toString()}'),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
