import 'package:flutter/material.dart';
import 'package:klinik_app/ui/pegawai_detail_page.dart';
import 'package:klinik_app/ui/pegawai_form_page.dart';
import 'package:klinik_app/widget/sidebar.dart';

import '../model/pegawai.dart';

class PegawaiPage extends StatefulWidget {
  PegawaiPage({super.key});

  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: Text("Data Pegawai", style: TextStyle(color: Colors.white),),
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
                  context, MaterialPageRoute(builder: (context) => 	PegawaiForm()));
            },
          )
        ],
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: (){
              Pegawai namapegawai = new Pegawai(
                nipPegawai: "202110268",
                namaPegawai: "Yuris Alkhalifi",
                tgllhrPegawai: "17-08-1945",
                telpPegawai: "089663920454",
                emailPegawai: "yuris.yak@bsi.ac.id",
                passwordPegawai: "bs10k3"
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PegawaiDetailPage(pegawai: namapegawai)
                )
              );
            },
            child: Card(
              child: ListTile(
                title: Text("Yuris Alkhalifi"),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Pegawai namapegawai = new Pegawai(
                nipPegawai: "202110111",
                namaPegawai: "Kartika Puspita",
                tgllhrPegawai: "17-08-1945",
                telpPegawai: "081234567812",
                emailPegawai: "kartika@bsi.ac.id",
                passwordPegawai: "bs10k3"
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PegawaiDetailPage(pegawai: namapegawai)
                )
              );
            },
            child: Card(
              child: ListTile(
                title: Text("Kartika Puspita"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
