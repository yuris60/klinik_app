import 'package:flutter/material.dart';
import 'package:klinik_app/service/pegawai_service.dart';
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
  Stream<Pegawai> getData() async* {
    Pegawai data = await PegawaiService().getById(widget.pegawai.id.toString());
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth; //selain text
    double ffem = fem * 0.97; //untuk text

    return Scaffold(
      appBar: AppBar(title: Text("Detail Pegawai"),),
      body: StreamBuilder(
        stream: getData(),
        builder: (context, AsyncSnapshot snapshot){
          if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState != ConnectionState.done){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(!snapshot.hasData && snapshot.connectionState == ConnectionState.done){
            return Text("Data Kosong");
          }

          return Column(
            children: [
              SizedBox(height: 20*fem),
              Text(
                "Nama Pegawai : ${snapshot.data.namaPegawai}",
                style: TextStyle(fontSize: 20*ffem),
              ),
              SizedBox(height: 10*fem),
              Text(
                "Tanggal Lahir : ${snapshot.data.tgllhrPegawai}",
                style: TextStyle(fontSize: 20*ffem),
              ),
              SizedBox(height: 10*fem),
              Text(
                "Nomor Telepon : ${snapshot.data.telpPegawai}",
                style: TextStyle(fontSize: 20*ffem),
              ),
              SizedBox(height: 10*fem),
              Text(
                "Email : ${snapshot.data.emailPegawai}",
                style: TextStyle(fontSize: 20*ffem),
              ),
              SizedBox(height: 10*fem),
              Text(
                "Password : ${snapshot.data.passwordPegawai}",
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
          );
        },
      ),
    );
  }

  _tombolubah(){
    return StreamBuilder(
      stream: getData(),
      builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PegawaiUpdateForm(pegawai: snapshot.data))
          );
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white),
        child: Text("Ubah"),
      ),
    );
  }

  _tombolhapus(){
    return ElevatedButton(
      onPressed: (){
        AlertDialog alertDialog = AlertDialog(
          content: Text("Yakin ingin menghapus data ini?"),
          actions: [
            // tombol ya
            StreamBuilder(
              stream: getData(),
              builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
                onPressed: () async {
                  await PegawaiService().hapus(snapshot.data).then((value) {
                    Navigator.pop(context);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => PegawaiPage()));
                  });
                },
                child: Text("YA"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
              ),
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
