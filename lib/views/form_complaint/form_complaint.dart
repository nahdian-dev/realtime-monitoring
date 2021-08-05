import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:realtime_monitoring/views/report_confirm/report_confirm.dart';

class FormComplaint extends StatelessWidget {
  final databaseReference = FirebaseDatabase.instance;

  final atasnama = TextEditingController();
  final nik = TextEditingController();
  final jenisLap = TextEditingController();
  final tanggalLap = TextEditingController();
  final tempatLap = TextEditingController();
  final atasnamaT = TextEditingController();
  final alamatT = TextEditingController();

  final String selectedPolsek;
  FormComplaint({this.selectedPolsek});

  @override
  Widget build(BuildContext context) {
    final ref = databaseReference.reference();
    return Scaffold(
      appBar: AppBar(
        title: Text("FORM PENGADUAN"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: ListView(
          children: [
            //PELAPOR
            Text("Form pelapor :",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),

            //atasnama
            TextField(
              controller: atasnama,
              decoration: InputDecoration(
                  hintText: "ATASNAMA :", border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),

            //nik
            TextField(
              controller: nik,
              decoration: InputDecoration(
                  hintText: "NIK :", border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            Divider(color: Colors.green),

            // ===== JENIS LAPORAN ======
            Text("Form jenis laporan :",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),

            TextField(
              controller: jenisLap,
              decoration: InputDecoration(
                  hintText: "JENIS LAPORAN :", border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),

            //tanggal kejadian
            TextField(
              controller: tanggalLap,
              decoration: InputDecoration(
                  hintText: "TANGGAL KEJADIAN :", border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),

            //tempat kejadian
            TextField(
              controller: tempatLap,
              decoration: InputDecoration(
                  hintText: "TEMPAT KEJADIAN :", border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            Divider(color: Colors.green),

            //reported
            Text("Form terlapor :",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),

            //atasnama
            TextField(
              controller: atasnamaT,
              decoration: InputDecoration(
                  hintText: "ATASNAMA :", border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),

            //alamat
            TextField(
              controller: alamatT,
              decoration: InputDecoration(
                  hintText: "ALAMAT :", border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                ref.child("queue").push().set({
                  'atasnama': atasnama.text,
                  'nik': nik.text,
                  'jenis_laporan': jenisLap.text,
                  'tanggal_kejadian': tanggalLap.text,
                  'tempat_kejadia': tanggalLap.text,
                  'atasnama_terlapor': atasnamaT.text,
                  'alamat_terlapor': alamatT.text,
                }).then((value) => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ReportConfirm();
                      }))
                    });
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green)),
              child: Text("KIRIIM LAPORAN"),
            ),
          ],
        ),
      ),
    );
  }
}
