import 'package:flutter/material.dart';
import 'package:klinik_app/ui/pegawai_form_update_page.dart';
import '../model/pegawai.dart';
import 'pegawai_page.dart';

class PegawaiDetailPage extends StatefulWidget {
  final Pegawai pegawai;
  const PegawaiDetailPage({super.key, required this.pegawai});

  @override
  State<PegawaiDetailPage> createState() => _PegawaiDetailPageState();
}

class _PegawaiDetailPageState extends State<PegawaiDetailPage> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth; //selain text
    double ffem = fem * 0.97; //untuk text

    return Scaffold(
      appBar: AppBar(title: Text("Detail Poli"),),
      body: Column(
        children: [
          SizedBox(height: 20*fem),
          Text(
            "NIP Pegawai : ${widget.pegawai.nipPegawai}",
            style: TextStyle(fontSize: 20*ffem),
          ),
          Text(
            "Nama Pegawai : ${widget.pegawai.namaPegawai}",
            style: TextStyle(fontSize: 20*ffem),
          ),
          Text(
            "Tgl Lahir Pegawai : ${widget.pegawai.tgllhrPegawai}",
            style: TextStyle(fontSize: 20*ffem),
          ),
          Text(
            "No Telp Pegawai : ${widget.pegawai.telpPegawai}",
            style: TextStyle(fontSize: 20*ffem),
          ),
          Text(
            "Email Pegawai : ${widget.pegawai.emailPegawai}",
            style: TextStyle(fontSize: 20*ffem),
          ),
          Text(
            "Password Pegawai : ${widget.pegawai.passwordPegawai}",
            style: TextStyle(fontSize: 20*ffem),
          ),
          SizedBox(height: 20*fem),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _tombolubah(),
              _tombolhapus()
            ],
          )
        ],
      ),
    );
  }

  _tombolubah(){
    return ElevatedButton(
      onPressed: (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PegawaiUpdateForm(pegawai: widget.pegawai))
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white),
      child: Text("Ubah"),
    );
  }

  _tombolhapus(){
    return ElevatedButton(
      onPressed: (){
        AlertDialog alertDialog = AlertDialog(
          content: Text("Yakin ingin menghapus data ini?"),
          actions: [
            // tombol ya
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => PegawaiPage()));
              },
              child: Text("YA"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            ),

            // tombol batal
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("Tidak"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey, foregroundColor: Colors.black),
            )
          ],
        );
        showDialog(context: context, builder: (context) => alertDialog);
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
      child: Text("Hapus"),
    );
  }
}
