import 'package:flutter/material.dart';
import 'package:klinik_app/ui/poli_detail_page.dart';

import '../model/poli.dart';
import '../service/poli_service.dart';

class PoliForm extends StatefulWidget {
  const PoliForm({super.key});

  @override
  State<PoliForm> createState() => _PoliFormState();
}

class _PoliFormState extends State<PoliForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();

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
      controller: _namaPoliCtrl,
    );
  }

  _tombolSimpan(){
    return ElevatedButton(
      onPressed: () async {
        Poli poli = Poli(namaPoli: _namaPoliCtrl.text);
        await PoliService().simpan(poli).then((value) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
                  (context) => PoliDetailPage(poli: value)));
        });
      },
      child: Text("Simpan")
    );
  }
}
