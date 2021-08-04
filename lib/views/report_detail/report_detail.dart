import 'dart:async';

import 'package:flutter/material.dart';
import 'package:realtime_monitoring/controllers/todo_name.dart';

class ReportDetail extends StatefulWidget {
  @override
  _ReportDetailState createState() => _ReportDetailState();
}

class _ReportDetailState extends State<ReportDetail> {
  StreamSubscription _subscriptionTodo;
  String _alamatTerlapor;
  String _atasnama;
  String _atasnamaTerlapor;
  String _jenisLaporan;
  String _nik;
  String _tanggalKejadian;
  String _tempatKejadian;

  @override
  void initState() {
    super.initState();

    FirebaseTodos.getTodoStream("-MgCdZ_uG2Fxohn1SulW", _updateTodo)
        .then((StreamSubscription s) => _subscriptionTodo = s);
  }

  @override
  void dispose() {
    if (_subscriptionTodo != null) {
      _subscriptionTodo.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Detail Laporan"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //status
            Center(
              child: Container(
                width: 230,
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Text("Status : DALAM PENYIDIKAN",
                        style: TextStyle(color: Colors.white))),
              ),
            ),
            Divider(color: Colors.green),

            //datadiri
            //atasnama
            RichText(
                text: TextSpan(
                    text: 'Atasnama pelapor : ',
                    style: TextStyle(color: Colors.black),
                    children: [
                  TextSpan(
                    text: '$_atasnama',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ])),
            //nik
            RichText(
                text: TextSpan(
                    text: 'NIK pelapor : ',
                    style: TextStyle(color: Colors.black),
                    children: [
                  TextSpan(
                    text: '$_nik',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ])),
            Divider(color: Colors.green),

            //jenislaporan
            RichText(
                text: TextSpan(
                    text: 'Jenis Laporan : ',
                    style: TextStyle(color: Colors.black),
                    children: [
                  TextSpan(
                    text: '$_jenisLaporan',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ])),

            //tempat kejadian
            RichText(
                text: TextSpan(
                    text: 'Tempat Kejadian : ',
                    style: TextStyle(color: Colors.black),
                    children: [
                  TextSpan(
                    text: '$_tempatKejadian',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ])),
            //waktu kejadian
            RichText(
                text: TextSpan(
                    text: 'Waktu Kejadian : ',
                    style: TextStyle(color: Colors.black),
                    children: [
                  TextSpan(
                    text: '$_tanggalKejadian',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ])),
            Divider(color: Colors.green),

            //terlapor
            //atasnama
            RichText(
                text: TextSpan(
                    text: 'Atasnama terlapor : ',
                    style: TextStyle(color: Colors.black),
                    children: [
                  TextSpan(
                    text: '$_atasnamaTerlapor',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ])),
            //alamat
            RichText(
                text: TextSpan(
                    text: 'Alamat terlapor : ',
                    style: TextStyle(color: Colors.black),
                    children: [
                  TextSpan(
                    text: '$_alamatTerlapor',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ])),
          ],
        ),
      ),
    );
  }

  _updateTodo(TodoName value) {
    var alamatTerlapor = value.alamatTerlapor;
    var atasnama = value.atasnama;
    var atasnamaTerlapor = value.atasnamaTerlapor;
    var jenisLaporan = value.jenisLaporan;
    var nik = value.nik;
    var tanggalKejadian = value.tanggalKejadian;
    var tempatKejadian = value.tempatKejadian;

    setState(() {
      _alamatTerlapor = alamatTerlapor;
      _atasnama = atasnama;
      _atasnamaTerlapor = atasnamaTerlapor;
      _jenisLaporan = jenisLaporan;
      _nik = nik;
      _tanggalKejadian = tanggalKejadian;
      _tempatKejadian = tempatKejadian;
    });
  }
}
