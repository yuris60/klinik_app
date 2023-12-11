import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import '../service/pegawai_service.dart';
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
      appBar: AppBar(title: Text("Tambah Pegawai")),
      body: SingleChildScrollView(
        child: Form(
            child: Column(
          children: [
            _fieldNipPegawai(),
            SizedBox(height: 10),
            _fieldNamaPegawai(),
            SizedBox(height: 10),
            _fieldTglLhrPegawai(),
            SizedBox(height: 10),
            _fieldTelpPegawai(),
            SizedBox(height: 10),
            _fieldEmailPegawai(),
            SizedBox(height: 10),
            _fieldPasswordPegawai(),
            SizedBox(height: 20),
            _tombolSimpan()
          ],
        )),
      ),
    );
  }

  _fieldNipPegawai(){
    return TextField(
      decoration: InputDecoration(
          labelText: "NIP Pegawai"
      ),
      controller: _nipPegawaiCtrl,
    );
  }


  _fieldNamaPegawai(){
    return TextField(
      decoration: InputDecoration(
          labelText: "Nama Pegawai"
      ),
      controller: _namaPegawaiCtrl,
    );
  }

  _fieldTglLhrPegawai(){
    return TextField(
      decoration: InputDecoration(
          labelText: "Tgl Lahir Pegawai"
      ),
      controller: _tgllhrPegawaiCtrl,
    );
  }

  _fieldTelpPegawai(){
    return TextField(
      decoration: InputDecoration(
          labelText: "Telp Pegawai"
      ),
      controller: _telpPegawaiCtrl,
    );
  }

  _fieldEmailPegawai(){
    return TextField(
      decoration: InputDecoration(
          labelText: "Email Pegawai"
      ),
      controller: _emailPegawaiCtrl,
    );
  }

  _fieldPasswordPegawai(){
    return TextField(
      decoration: InputDecoration(
          labelText: "Password Pegawai"
      ),
      controller: _passwordPegawaiCtrl,
    );
  }

  _tombolSimpan(){
    return ElevatedButton(
        onPressed: () async {
          Pegawai pegawai = Pegawai(
            namaPegawai: _namaPegawaiCtrl.text,
            passwordPegawai: _passwordPegawaiCtrl.text,
            emailPegawai: _emailPegawaiCtrl.text,
            telpPegawai: _telpPegawaiCtrl.text,
            tgllhrPegawai: _tgllhrPegawaiCtrl.text,
            nipPegawai: _nipPegawaiCtrl.text
          );
          await PegawaiService().simpan(pegawai).then((value) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) => PegawaiDetailPage(pegawai: value)));
          });
        },
        child: Text("Simpan")
    );
  }

}
