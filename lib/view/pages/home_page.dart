import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsi_pos_dg/config/app_color.dart';
import 'package:skripsi_pos_dg/data/remote/controller/c_auth.dart';
import 'package:skripsi_pos_dg/view/pages/balita_page.dart';
import 'package:skripsi_pos_dg/view/pages/bidan/posyandu_page_bidan.dart';
import 'package:skripsi_pos_dg/view/pages/info_page.dart';
import 'package:skripsi_pos_dg/view/pages/jadwal_page.dart';
import 'package:skripsi_pos_dg/view/pages/bidan/home_page_bidan.dart';
import 'package:skripsi_pos_dg/view/pages/bidan/jadwal_page_bidan.dart';
import 'package:skripsi_pos_dg/view/pages/orangtua/balita_page_ortu.dart';
import 'package:skripsi_pos_dg/view/pages/orangtua/home_page_ortu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cAuth = Get.put(AuthController());
  int _selectedIndex = 0;

  final List<Widget> _pagesForOrtu = [
    const HomePageOrtu(),
    const JadwalPage(),
    const BalitaPageOrtu(),
    const InfoPage(),
  ];

  final List<Widget> _pagesForBidan = [
    const HomePageBidan(),
    const JadwalPageBidan(),
    const PosyanduPageBidan(),
    const Center(
      child: Text('Info for Bidan'),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //if user / orang tua
    if (cAuth.data.data!.roles == "user") {
      return Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _pagesForOrtu,
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
    // if bidan / nakes
    else {
      return Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _pagesForBidan,
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
              icon: Icon(Icons.list_rounded),
              label: 'Posyandu',
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
}
