import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsi_pos_dg/config/app_color.dart';
import 'package:skripsi_pos_dg/data/remote/controller/c_auth.dart';
import 'package:skripsi_pos_dg/view/pages/balita_page.dart';
import 'package:skripsi_pos_dg/view/pages/info_page.dart';
import 'package:skripsi_pos_dg/view/pages/jadwal_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cAuth = Get.put(AuthController());
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    const JadwalPage(),
    const BalitaPage(),
    const InfoPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title:  Text('${_selectedIndex}'),
      //   automaticallyImplyLeading: false,
      // ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Jadwal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.child_care_rounded),
            label: 'Balita',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: AppColor.darkGreyColor,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final cAuth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
