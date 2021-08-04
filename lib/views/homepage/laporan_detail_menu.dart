import 'package:flutter/material.dart';
import 'package:realtime_monitoring/views/report_detail/report_detail.dart';

class LaporanDetailMenu extends StatelessWidget {
  final int countFb;
  const LaporanDetailMenu({
    this.countFb,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 180, child: (countFb == 0) ? LaporanKosong() : StatusLaporan());
  }
}

class LaporanKosong extends StatelessWidget {
  const LaporanKosong({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text("BELUM ADA LAPORAN",
            style: TextStyle(color: Colors.white, fontSize: 20)));
  }
}

class StatusLaporan extends StatelessWidget {
  const StatusLaporan({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
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

        // divider
        SizedBox(height: 20),
        Text("Nomor laporan anda", style: TextStyle(color: Colors.white)),
        Text("A102", style: TextStyle(fontSize: 50, color: Colors.white)),

        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      ReportDetail(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return child;
                  }),
            );
          },
          child: Container(
            width: 120,
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
                child: Text("Detail laporan",
                    style: TextStyle(color: Colors.white))),
          ),
        ),
      ],
    );
  }
}
