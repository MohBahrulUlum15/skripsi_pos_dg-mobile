import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsi_pos_dg/config/app_format.dart';
import 'package:skripsi_pos_dg/data/models/balita_in_ortu_model.dart';
import 'package:skripsi_pos_dg/data/remote/controller/c_balita.dart';

class BalitaPageOrtu extends StatefulWidget {
  const BalitaPageOrtu({super.key});

  @override
  State<BalitaPageOrtu> createState() => _BalitaPageOrtuState();
}

class _BalitaPageOrtuState extends State<BalitaPageOrtu> {
  final cBalita = Get.put(BalitaController());

  refresh() {
    cBalita.getListBalitaForOrtu();
  }

  @override
  void initState() {
    refresh();
    cBalita.getListBalitaForOrtu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Balita'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<BalitaController>(
                builder: (_) {
                  if (_.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (_.listBalitaForOrtu.isEmpty) {
                    return Center(
                      child: Text('Balita Belum Ada'),
                    );
                  }
                  return RefreshIndicator(
                    onRefresh: () async => refresh(),
                    child: buildListBalitaForOrtu(_.listBalitaForOrtu),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildListBalitaForOrtu(List<BalitaInOrtuModel> listBalitaForOrtu) {
    return ListView.builder(
      itemCount: listBalitaForOrtu.length,
      itemBuilder: (context, index) {
        return Card(
          child: InkWell(
            onTap: () {
              // Get.to(() => BalitaDetailPage(
              //       balitaID: listBalitaForOrtu[index].id!,
              //       balitaName: listBalitaForOrtu[index].name!,
              //     ));
            },
            child: ListTile(
              title: Text(listBalitaForOrtu[index].name!),
              subtitle: Text(listBalitaForOrtu[index].jenisKelamin!),
              trailing:
                  Text(AppFormat.date(listBalitaForOrtu[index].tanggalLahir!)),
            ),
          ),
        );
      },
    );
  }
}
