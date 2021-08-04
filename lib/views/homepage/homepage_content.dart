import 'dart:async';
import 'package:flutter/material.dart';
import 'package:realtime_monitoring/controllers/todo.dart';
import 'package:realtime_monitoring/views/form_complaint/form_complaint.dart';
import 'package:realtime_monitoring/views/homepage/laporan_detail_menu.dart';

class HomepageContent extends StatefulWidget {
  @override
  _HomepageContentState createState() => _HomepageContentState();
}

class _HomepageContentState extends State<HomepageContent> {
  StreamSubscription _subscriptionTodo;
  int _countFb = 0;

  @override
  void initState() {
    super.initState();

    FirebaseTodos.getTodoStream("-MgBv20iLDFwTBnL1_hG", _updateTodo)
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
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.lightGreen,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          //sisa antrian
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Text("$_countFb",
                    style: TextStyle(fontSize: 100, color: Colors.white)),
                Text("Sisa antrian pelapor",
                    style: TextStyle(color: Colors.white)),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //lapor pengaduan
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            FormComplaint(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return child;
                        }),
                  );
                },
                child: Text("Lapor pengaduan"),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green)),
              ),

              //divider
              SizedBox(width: 10),

              //ganti tempat
              ElevatedButton(
                onPressed: () {},
                child: Text("Polsek Cinere"),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueGrey),
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Divider(color: Colors.white),

          LaporanDetailMenu(
            countFb: _countFb,
          ),
        ],
      ),
    );
  }

  _updateTodo(Todo value) {
    var count = value.amount;

    setState(() {
      _countFb = count;
    });
  }
}
