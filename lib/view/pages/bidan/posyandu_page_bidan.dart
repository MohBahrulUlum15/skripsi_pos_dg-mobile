import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:skripsi_pos_dg/data/models/posyandu_model.dart';
import 'package:skripsi_pos_dg/data/remote/controller/c_posyandu.dart';

class PosyanduPageBidan extends StatefulWidget {
  const PosyanduPageBidan({super.key});

  @override
  State<PosyanduPageBidan> createState() => _PosyanduPageBidanState();
}

class _PosyanduPageBidanState extends State<PosyanduPageBidan> {
  final cPosyandu = Get.put(PosyanduController());

  refresh() {
    cPosyandu.getListPosyandu();
  }

  @override
  void initState() {
    refresh();
    cPosyandu.getListPosyandu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // title: Text('posyandu'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<PosyanduController>(
                builder: (_) {
                  if (_.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return RefreshIndicator(
                    onRefresh: () async => refresh(),
                    child: buildListPosyandu(_.listPosyandu),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildListPosyandu(List<PosyanduModel> listPosyandu) {
    return ListView.builder(
      itemCount: listPosyandu.length,
      itemBuilder: (context, index) {
        PosyanduModel posyandu = listPosyandu[index];
        return Card(
          child: ListTile(
            title: Text(posyandu.name!),
            subtitle: Text(posyandu.alamat!),
            onTap: () {
              // Get.toNamed('/jadwal-posyandu', arguments: posyandu);
            },
          ),
        );
      },
    );
  }
}
