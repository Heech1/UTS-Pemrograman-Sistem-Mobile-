import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/teks_kantin.dart';

class TambahMenuPage extends StatefulWidget {
  const TambahMenuPage({super.key});

  @override
  State<TambahMenuPage> createState() => _TambahMenuPageState();
}

class _TambahMenuPageState extends State<TambahMenuPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _hargaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TeksKantin('Tambah Menu', ukuran: 20, tebal: FontWeight.bold, warna: Colors.white),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(labelText: 'Nama Menu', border: OutlineInputBorder()), 
                validator: (value) {
                  if (value == null || value.trim().isEmpty) return 'Nama menu tidak boleh kosong';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _hargaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Harga Menu', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) return 'Harga tidak boleh kosong';
                  if (int.tryParse(value) == null) return 'Harga harus berupa angka valid';
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final menuBaru = {
                      'nama': _namaController.text,
                      'harga': int.parse(_hargaController.text),
                    };
                    Get.back(result: menuBaru);
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent, padding: const EdgeInsets.symmetric(vertical: 16)),
                child: const TeksKantin('Simpan', ukuran: 16, tebal: FontWeight.bold, warna: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _namaController.dispose();
    _hargaController.dispose();
    super.dispose();
  }
}