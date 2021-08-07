import 'dart:async';
import 'package:flutter/material.dart';
import 'package:realtime_monitoring/config/configuration.dart';
import 'package:realtime_monitoring/controllers/todo.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //detail klinik
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // image
              Container(
                width: 100,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/clinic.jpg"),
                      fit: BoxFit.cover),
                ),
              ),

              Container(
                width: 150,
                child: Column(
                  children: [
                    // NAMA KLINIK
                    Text("KLINIK KESEHATAN GANDUL",
                        textAlign: TextAlign.center,
                        style:
                            GoogleFonts.openSans(fontWeight: FontWeight.bold)),

                    //sisa antrian
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Text("$_countFb",
                              style: TextStyle(fontSize: 50, color: blue)),
                          Text("Total Antrian",
                              style: GoogleFonts.openSans(color: blue)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        Container(
          width: double.infinity,
          height: 200,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //detail antrian
              //sisa antrian
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("$_countFb",
                          style: TextStyle(fontSize: 20, color: blue)),
                      Text("Sisa Antrian",
                          style: GoogleFonts.openSans(color: blue)),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.notes, color: white),
                        Text("Detail Antrian",
                            style: GoogleFonts.openSans(color: white)),
                      ],
                    ),
                  ),
                ],
              ),

              // divider
              Divider(color: darkBlue),
              SizedBox(height: 20),

              //nomor antrian
              Column(
                children: [
                  Text("Nomor antrian",
                      style: GoogleFonts.openSans(
                          color: black, fontWeight: FontWeight.bold)),
                  Text("A402",
                      style: GoogleFonts.openSans(
                          color: blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 40)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  _updateTodo(Todo value) {
    var count = value.amount;

    setState(() {
      _countFb = count;
    });
  }
}
