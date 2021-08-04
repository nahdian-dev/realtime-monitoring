import 'package:flutter/material.dart';

class DetailListQueue extends StatefulWidget {
  @override
  _DetailListQueueState createState() => _DetailListQueueState();
}

class _DetailListQueueState extends State<DetailListQueue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar antrian"),
        backgroundColor: Colors.green,
      ),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("listName"),
            subtitle: Text("Kasus"),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(color: Colors.green);
        },
      ),
    );
  }
}
