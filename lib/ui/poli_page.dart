import 'package:flutter/material.dart';
import 'package:klinik_app/ui/poli_detail_page.dart';
import 'package:klinik_app/ui/poli_form_page.dart';
import 'package:klinik_app/widget/sidebar.dart';

import '../model/poli.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<PoliPage> createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: Text("Data Poli", style: TextStyle(color: Colors.white),),
        centerTitle: true,
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
                  context, MaterialPageRoute(builder: (context) => 	PoliForm()));
            },
          )
        ],
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: (){
              Poli polianak = new Poli(namaPoli: "Poli Anak");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PoliDetailPage(poli: polianak)
                )
              );
            },
            child: Card(
              child: ListTile(
                title: Text("Poli Anak"),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Poli polikandungan = new Poli(namaPoli: "Poli Kandungan");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PoliDetailPage(poli: polikandungan)
                  )
              );
            },
            child: Card(
              child: ListTile(
                title: Text("Poli Kandungan"),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Poli poligigi = new Poli(namaPoli: "Poli Gigi");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PoliDetailPage(poli: poligigi)
                  )
              );
            },
            child: Card(
              child: ListTile(
                title: Text("Poli Gigi"),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Poli politht = new Poli(namaPoli: "Poli THT");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PoliDetailPage(poli: politht)
                  )
              );
            },
            child: Card(
              child: ListTile(
                title: Text("Poli THT"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
