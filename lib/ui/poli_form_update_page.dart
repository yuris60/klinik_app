import 'package:flutter/material.dart';
import '../model/poli.dart';
import 'poli_detail_page.dart';

class PoliUpdateForm extends StatefulWidget {
  final Poli poli;

  const PoliUpdateForm({Key? key, required this.poli}) : super(key: key);

  @override
  State<PoliUpdateForm> createState() => _PoliUpdateFormState();
}

class _PoliUpdateFormState extends State<PoliUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();

  void initState(){
    super.initState();
    setState(() {
      _namaPoliCtrl.text = widget.poli.namaPoli;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ubah Poli")),
      body: SingleChildScrollView(
        child: Form(
            child: Column(
              children: [
                _fieldNamaPoli(),
                SizedBox(height: 20),
                _tombolUbah()
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

  _tombolUbah(){
    return ElevatedButton(
        onPressed: (){
          Poli poli = Poli(namaPoli: _namaPoliCtrl.text);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
                  (context) => PoliDetailPage(poli: poli))
          );
        },
        child: Text("Ubah")
    );
  }
}
