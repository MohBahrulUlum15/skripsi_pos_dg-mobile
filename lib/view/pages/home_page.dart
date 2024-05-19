import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsi_pos_dg/data/remote/controller/c_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cAuth = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Ini halaman home'),
            if (cAuth.data.token != null) Text(cAuth.data.token!),
            if (cAuth.data.data != null) ...[
              Text(cAuth.data.data!.name ?? 'No Name'),
              Text(cAuth.data.data!.email ?? 'No Email'),
              Text(cAuth.data.data!.alamat ?? 'No Address'),
              Text(cAuth.data.data!.kodeNikNip ?? 'No Kode Nik Nip'),
              Text(cAuth.data.data!.roles ?? 'No Roles'),
              Text(cAuth.data.data!.tanggalLahir?.toString() ??
                  'No Date of Birth'),
            ]
          ],
        ),
      ),
    );
  }
}
