import 'dart:async';

import 'package:flutter/material.dart';
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
    return ListView.builder(
      itemCount: 1,
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
            margin: EdgeInsets.all(20),
            height: 90,
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Image.asset("assets/images/polsek_logo.png",
                          height: 70),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("POLSEK CINERE", style: TextStyle(fontSize: 20)),
                        Text("Kota Depok, Jawa Barat",
                            style: TextStyle(fontSize: 10)),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadiusDirectional.only(
                        topEnd: Radius.circular(10),
                        bottomEnd: Radius.circular(10)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("$_countFb",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold)),
                      Text("antrian saat ini", style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _updateTodo(Todo value) {
    var count = value.amount;

    setState(() {
      _countFb = count;
    });
  }
}
