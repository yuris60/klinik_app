import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import 'pegawai_detail_page.dart';

class PegawaiUpdateForm extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiUpdateForm({Key? key, required this.pegawai}) : super(key: key);

  @override
  State<PegawaiUpdateForm> createState() => _PegawaiUpdateFormState();
}

class _PegawaiUpdateFormState extends State<PegawaiUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPegawaiCtrl = TextEditingController();
  final _nipPegawaiCtrl = TextEditingController();
  final _tgllhrPegawaiCtrl = TextEditingController();
  final _telpPegawaiCtrl = TextEditingController();
  final _emailPegawaiCtrl = TextEditingController();
  final _passwordPegawaiCtrl = TextEditingController();

  void initState(){
    super.initState();
    setState(() {
      _namaPegawaiCtrl.text = widget.pegawai.namaPegawai;
      _nipPegawaiCtrl.text = widget.pegawai.nipPegawai;
      _tgllhrPegawaiCtrl.text = widget.pegawai.tgllhrPegawai;
      _telpPegawaiCtrl.text = widget.pegawai.telpPegawai;
      _emailPegawaiCtrl.text = widget.pegawai.emailPegawai;
      _passwordPegawaiCtrl.text = widget.pegawai.passwordPegawai;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ubah Pegawai")),
      body: SingleChildScrollView(
        child: Form(
            child: Column(
              children: [
                _fieldNipPegawai(),
                _fieldNamaPegawai(),
                _fieldTglLhrPegawai(),
                _fieldTelpPegawai(),
                _fieldEmailPegawai(),
                _fieldPasswordPegawai(),
                SizedBox(height: 20),
                _tombolUbah()
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

  _tombolUbah(){
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
        child: Text("Ubah")
    );
  }
}
