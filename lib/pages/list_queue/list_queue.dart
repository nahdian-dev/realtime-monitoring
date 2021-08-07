import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realtime_monitoring/config/configuration.dart';
import 'package:realtime_monitoring/controllers/todo.dart';
import 'package:realtime_monitoring/views/list_queue/detail_list_queue.dart';

class ListQueue extends StatefulWidget {
  @override
  _ListQueueState createState() => _ListQueueState();
}

class _ListQueueState extends State<ListQueue> {
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
    return Scaffold(
      backgroundColor: blue,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: blue,
        centerTitle: true,
        title: Text("ANTRIAN KLINIK TERDEKAT",
            style: GoogleFonts.openSans(fontSize: 20, color: white, fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        DetailListQueue(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return child;
                    }),
              );
            },
            child: Container(
              height: 91,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.4,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          width: 80,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/clinic.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("KLINIK KESEHATAN GANDUL",
                                  style: GoogleFonts.openSans(
                                      fontSize: 16,
                                      color: black,
                                      fontWeight: FontWeight.bold)),
                              Text("Kota Depok, Jawa Barat",
                                  style: GoogleFonts.openSans(
                                      fontSize: 10, color: black)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 4.4,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: darkBlue,
                      borderRadius: BorderRadiusDirectional.only(
                          topEnd: Radius.circular(10),
                          bottomEnd: Radius.circular(10)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("$_countFb",
                            style: GoogleFonts.openSans(
                                fontSize: 35,
                                color: white,
                                fontWeight: FontWeight.bold)),
                        Text("Total Antrian",
                            style: GoogleFonts.openSans(
                                fontSize: 10, color: white)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
