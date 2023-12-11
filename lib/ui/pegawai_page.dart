import 'package:flutter/material.dart';
import 'package:klinik_app/ui/pegawai_detail_page.dart';
import 'package:klinik_app/ui/pegawai_item_page.dart';
import 'package:klinik_app/ui/pegawai_form_page.dart';
import 'package:klinik_app/widget/sidebar.dart';

import '../model/pegawai.dart';
import '../service/pegawai_service.dart';

class PegawaiPage extends StatefulWidget {
  PegawaiPage({super.key});

  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  Stream<List<Pegawai>> getList() async* {
    List<Pegawai> data = await PegawaiService().listData();
    yield data;
  }

  Future refreshData() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      getList();
    });
  }

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
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: StreamBuilder(
          stream: getList(),
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

            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return PegawaiItem(pegawai: snapshot.data[index]);
                }
            );
          },
        ),
      ),
    );
  }
}
