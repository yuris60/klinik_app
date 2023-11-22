import 'package:flutter/material.dart';
import '../model/pasien.dart';
import 'pasien_detail_page.dart';

class PasienUpdateForm extends StatefulWidget {
  final Pasien pasien;

  const PasienUpdateForm({Key? key, required this.pasien}) : super(key: key);

  @override
  State<PasienUpdateForm> createState() => PasieniUpdateFormState();
}

class PasieniUpdateFormState extends State<PasienUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _nomorRMPasienCtrl = TextEditingController();
  final _namaPasienCtrl = TextEditingController();
  final _tgllhrPasienCtrl = TextEditingController();
  final _telpPasienCtrl = TextEditingController();
  final _alamatPasienCtrl = TextEditingController();

  void initState(){
    super.initState();
    setState(() {
      _nomorRMPasienCtrl.text = widget.pasien.nomorRMPasien;
      _namaPasienCtrl.text = widget.pasien.namaPasien;
      _tgllhrPasienCtrl.text = widget.pasien.tgllhrPasien;
      _telpPasienCtrl.text = widget.pasien.telpPasien;
      _alamatPasienCtrl.text = widget.pasien.alamatPasien;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ubah Pasien")),
      body: SingleChildScrollView(
        child: Form(
            child: Column(
              children: [
                _fieldNomorRMPasien(),
                _fieldNamaPasien(),
                _fieldTglLhrPasien(),
                _fieldTelpPasien(),
                _fieldAlamatPasien(),
                SizedBox(height: 20),
                _tombolUbah()
              ],
            )),
      ),
    );
  }

  _fieldNomorRMPasien(){
    return TextField(
      decoration: InputDecoration(
          labelText: "NIP Pasien"
      ),
      controller: _nomorRMPasienCtrl,
    );
  }

  _fieldNamaPasien(){
    return TextField(
      decoration: InputDecoration(
          labelText: "Nama Pasien"
      ),
      controller: _namaPasienCtrl,
    );
  }

  _fieldTglLhrPasien(){
    return TextField(
      decoration: InputDecoration(
          labelText: "Tgl Lahir Pasien"
      ),
      controller: _tgllhrPasienCtrl,
    );
  }

  _fieldTelpPasien(){
    return TextField(
      decoration: InputDecoration(
          labelText: "Telp Pasien"
      ),
      controller: _telpPasienCtrl,
    );
  }

  _fieldAlamatPasien(){
    return TextField(
      decoration: InputDecoration(
          labelText: "Alamat Pasien"
      ),
      controller: _alamatPasienCtrl,
    );
  }

  _tombolUbah(){
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
        child: Text("Ubah")
    );
  }
}
