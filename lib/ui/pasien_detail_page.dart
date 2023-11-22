import 'package:flutter/material.dart';
import 'package:klinik_app/ui/pasien_form_update_page.dart';
import '../model/pasien.dart';
import 'pasien_page.dart';

class PasienDetailPage extends StatefulWidget {
  final Pasien pasien;
  const PasienDetailPage({super.key, required this.pasien});

  @override
  State<PasienDetailPage> createState() => _PasienDetailPageState();
}

class _PasienDetailPageState extends State<PasienDetailPage> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth; //selain text
    double ffem = fem * 0.97; //untuk text

    return Scaffold(
      appBar: AppBar(title: Text("Detail Pegawai"),),
      body: Column(
        children: [
          SizedBox(height: 20*fem),
          Text(
            "NIP Pegawai : ${widget.pasien.nomorRMPasien}",
            style: TextStyle(fontSize: 20*ffem),
          ),
          Text(
            "Nama Pegawai : ${widget.pasien.namaPasien}",
            style: TextStyle(fontSize: 20*ffem),
          ),
          Text(
            "Tgl Lahir Pegawai : ${widget.pasien.tgllhrPasien}",
            style: TextStyle(fontSize: 20*ffem),
          ),
          Text(
            "No Telp Pegawai : ${widget.pasien.telpPasien}",
            style: TextStyle(fontSize: 20*ffem),
          ),
          Text(
            "Email Pegawai : ${widget.pasien.alamatPasien}",
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
          MaterialPageRoute(builder: (context) => PasienUpdateForm(pasien: widget.pasien))
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
                    MaterialPageRoute(builder: (context) => PasienPage()));
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
