import 'package:flutter/material.dart';
import '../model/pasien.dart';
import 'pasien_detail_page.dart';

class PasienForm extends StatefulWidget {
  const PasienForm({super.key});

  @override
  State<PasienForm> createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {
  final _formKey = GlobalKey<FormState>();
  final _nomorRMPasienCtrl = TextEditingController();
  final _namaPasienCtrl = TextEditingController();
  final _tgllhrPasienCtrl = TextEditingController();
  final _telpPasienCtrl = TextEditingController();
  final _alamatPasienCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah Pasien")),
      body: SingleChildScrollView(
        child: Form(
            child: Column(
          children: [
            _fieldNamaPoli(),
            SizedBox(height: 20),
            _tombolSimpan()
          ],
        )),
      ),
    );
  }

  _fieldNamaPoli(){
    return TextField(
      decoration: InputDecoration(
        labelText: "Nama Poli"
      ),
      controller: _namaPasienCtrl,
    );
  }

  _tombolSimpan(){
    return ElevatedButton(
      onPressed: (){
        Pasien pasien = Pasien(
            nomorRMPasien: _nomorRMPasienCtrl.text,
            namaPasien: _namaPasienCtrl.text,
            tgllhrPasien: _tgllhrPasienCtrl.text,
            telpPasien: _telpPasienCtrl.text,
            alamatPasien: _alamatPasienCtrl.text,
        );
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder:
              (context) => PasienDetailPage(pasien: pasien))
        );
      },
      child: Text("Simpan")
    );
  }
}
