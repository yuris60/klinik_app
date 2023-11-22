import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import 'pegawai_detail_page.dart';

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({super.key});

  @override
  State<PegawaiForm> createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPegawaiCtrl = TextEditingController();
  final _nipPegawaiCtrl = TextEditingController();
  final _tgllhrPegawaiCtrl = TextEditingController();
  final _telpPegawaiCtrl = TextEditingController();
  final _emailPegawaiCtrl = TextEditingController();
  final _passwordPegawaiCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah Poli")),
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
      controller: _namaPegawaiCtrl,
    );
  }

  _tombolSimpan(){
    return ElevatedButton(
      onPressed: (){
        Pegawai pegawai = Pegawai(
            namaPegawai: _namaPegawaiCtrl.text,
            nipPegawai: _nipPegawaiCtrl.text,
            tgllhrPegawai: _tgllhrPegawaiCtrl.text,
            telpPegawai: _telpPegawaiCtrl.text,
            emailPegawai: _emailPegawaiCtrl.text,
            passwordPegawai: _passwordPegawaiCtrl.text
        );
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder:
              (context) => PegawaiDetailPage(pegawai: pegawai))
        );
      },
      child: Text("Simpan")
    );
  }
}
