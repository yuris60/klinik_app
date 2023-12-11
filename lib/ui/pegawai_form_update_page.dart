import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import '../service/pegawai_service.dart';
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

  Future<Pegawai> getData() async {
    Pegawai data = await PegawaiService().getById(widget.pegawai.id.toString());
    setState(() {
      _namaPegawaiCtrl.text = data.namaPegawai;
      _nipPegawaiCtrl.text = data.nipPegawai;
      _tgllhrPegawaiCtrl.text = data.tgllhrPegawai;
      _telpPegawaiCtrl.text = data.telpPegawai;
      _emailPegawaiCtrl.text = data.emailPegawai;
      _passwordPegawaiCtrl.text = data.passwordPegawai;
    });
    return data;
  }

  void initState(){
    super.initState();
    setState(() {
      getData();
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
        onPressed: () async {
          Pegawai pegawai = Pegawai(
              namaPegawai: _namaPegawaiCtrl.text,
              passwordPegawai: _passwordPegawaiCtrl.text,
              emailPegawai: _emailPegawaiCtrl.text,
              telpPegawai: _telpPegawaiCtrl.text,
              tgllhrPegawai: _tgllhrPegawaiCtrl.text,
              nipPegawai: _nipPegawaiCtrl.text
          );
          String id = widget.pegawai.id.toString();
          await PegawaiService().ubah(pegawai, id).then((value) {
            Navigator.pop(context);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) => PegawaiDetailPage(pegawai: value)));
          });
        },
        child: Text("Ubah")
    );
  }
}
