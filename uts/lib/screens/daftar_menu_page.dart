import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/teks_kantin.dart';
import 'detail_menu_page.dart';
import 'tambah_menu_page.dart'; 

class DaftarMenuPage extends StatefulWidget {
  const DaftarMenuPage({super.key});

  @override
  State<DaftarMenuPage> createState() => _DaftarMenuPageState();
}

class _DaftarMenuPageState extends State<DaftarMenuPage> {
  List<Map<String, dynamic>> daftarMenu = [
    {'nama': 'Nasi Goreng Spesial', 'harga': 15000},
    {'nama': 'Ayam Geprek', 'harga': 12000},
    {'nama': 'Mie Tek-Tek', 'harga': 10000},
    {'nama': 'Soto Ayam', 'harga': 13000},
    {'nama': 'Es Teh Manis', 'harga': 4000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TeksKantin('Menu Kantin', ukuran: 20, tebal: FontWeight.bold, warna: Colors.white),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: TeksKantin('Daftar Tersedia', ukuran: 18, tebal: FontWeight.w600),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: daftarMenu.length,
              itemBuilder: (context, index) {
                final menu = daftarMenu[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: ListTile(
                    leading: const Icon(Icons.fastfood, color: Colors.orange),
                    title: TeksKantin(menu['nama'], ukuran: 16, tebal: FontWeight.w600),
                    subtitle: TeksKantin('Rp${menu['harga']}', warna: Colors.green),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Get.to(() => DetailMenuPage(
                        nama: menu['nama'],
                        harga: menu['harga'],
                      ));
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final hasil = await Get.to(() => const TambahMenuPage());
          
          if (hasil != null) {
            setState(() {
              daftarMenu.add(hasil as Map<String, dynamic>);
            });
            Get.snackbar('Berhasil', 'Menu baru sudah ditambahkan!', backgroundColor: Colors.green, colorText: Colors.white);
          }
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}