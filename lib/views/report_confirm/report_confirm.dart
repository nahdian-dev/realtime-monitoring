import 'package:flutter/material.dart';

class ReportConfirm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("HASIL LAPORAN"),
        backgroundColor: Colors.green,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.check, size: 100),
              Text("LAPORAN BERHASIL DIKIRIM",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Text("Laporan akan di cek pada bagian SPKT",
                  style: TextStyle(fontSize: 13)),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green)),
                child: Text("KEMBALI KE MENU AWAL"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
