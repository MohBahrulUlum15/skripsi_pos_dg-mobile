import 'package:d_info/d_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsi_pos_dg/data/remote/controller/c_auth.dart';
import 'package:skripsi_pos_dg/view/pages/login_page.dart';

class HomePageBidan extends StatefulWidget {
  const HomePageBidan({super.key});

  @override
  State<HomePageBidan> createState() => _HomePageBidanState();
}

class _HomePageBidanState extends State<HomePageBidan> {
  final cAuth = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
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
          ],
          const SizedBox(
            height: 32.0,
          ),
          TextButton(
            onPressed: () {
              logout();
            },
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void logout() async {
    await cAuth.logout();
    if (cAuth.successLogout) {
      DInfo.dialogSuccess(context, 'Berhasil Logout');
      DInfo.closeDialog(context, actionAfterClose: () {
        Get.off(() => const LoginPage());
      });
    } else {
      DInfo.dialogError(context, 'Gagal Logout');
      DInfo.closeDialog(context);
    }
  }
}
