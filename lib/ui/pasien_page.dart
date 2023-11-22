import 'package:flutter/material.dart';
import 'package:klinik_app/ui/pasien_detail_page.dart';
import 'package:klinik_app/ui/pasien_form_page.dart';
import 'package:klinik_app/widget/sidebar.dart';

import '../model/pasien.dart';

class PasienPage extends StatefulWidget {
  PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: Text("Data Pasien", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
        leading: Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.menu, color: Colors.white),
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            }
        ),
        actions: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.add, color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => 	PasienForm()));
            },
          )
        ],
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: (){
              Pasien pasien = new Pasien(
                nomorRMPasien: "12345",
                namaPasien: "A. Hanan Alkhalifi",
                tgllhrPasien: "15-10-2023",
                telpPasien: "089663920454",
                alamatPasien: "Karawang",
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PasienDetailPage(pasien: pasien)
                )
              );
            },
            child: Card(
              child: ListTile(
                title: Text("A. Hanan Alkhalifi"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
