import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Pemilihan font Nunito dengan ujung membulat memberikan kesan ceria dan santai
// yang cocok untuk tema kantin, namun strukturnya yang clean memastikan nama 
// dan harga menu tetap sangat mudah dibaca oleh pengguna.
class TeksKantin extends StatelessWidget {
  final String isiTeks;
  final double ukuran;
  final Color warna;
  final FontWeight tebal;

  const TeksKantin(
    this.isiTeks, {
    super.key,
    this.ukuran = 14.0,
    this.warna = Colors.black87,
    this.tebal = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      isiTeks,
      style: GoogleFonts.nunito(
        fontSize: ukuran,
        color: warna,
        fontWeight: tebal,
      ),
    );
  }
}