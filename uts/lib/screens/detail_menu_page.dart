import 'package:flutter/material.dart';
import '../components/teks_kantin.dart';

class DetailMenuPage extends StatelessWidget {
  final String nama;
  final int harga;

  const DetailMenuPage({super.key, required this.nama, required this.harga});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const TeksKantin('Detail Menu', ukuran: 20, tebal: FontWeight.bold, warna: Colors.white), backgroundColor: Colors.blueAccent),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.fastfood, size: 100, color: Colors.orange),
            const SizedBox(height: 20),
            TeksKantin(nama, ukuran: 24, tebal: FontWeight.bold),
            const SizedBox(height: 10),
            TeksKantin('Rp$harga', ukuran: 20, warna: Colors.green, tebal: FontWeight.w600),
          ],
        ),
      ),
    );
  }
}