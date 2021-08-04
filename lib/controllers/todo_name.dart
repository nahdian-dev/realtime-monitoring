import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

class TodoName {
  final String key;
  String alamatTerlapor;
  String atasnama = 'A';
  String atasnamaTerlapor;
  String jenisLaporan;
  String nik;
  String tanggalKejadian;
  String tempatKejadian;

  TodoName.fromJson(this.key, Map data) {
    alamatTerlapor = data['alamat_terlapor'];
    atasnama = data['atasnama'];
    atasnamaTerlapor = data['atasnama_terlapor'];
    jenisLaporan = data['jenis_laporan'];
    nik = data['nik'];
    tanggalKejadian = data['tanggal_kejadian'];
    tempatKejadian = data['tempat_kejadia'];
  }
}

class FirebaseTodos {
  static Future<StreamSubscription<Event>> getTodoStream(
      String todoKey, void onData(TodoName todo)) async {
    StreamSubscription<Event> subscription = FirebaseDatabase.instance
        .reference()
        .child("queue")
        .child(todoKey)
        .onValue
        .listen((Event event) {
      var todo =
          new TodoName.fromJson(event.snapshot.key, event.snapshot.value);
      onData(todo);
    });

    return subscription;
  }

  static Future<TodoName> getTodo(String todoKey) async {
    Completer<TodoName> completer = new Completer<TodoName>();

    FirebaseDatabase.instance
        .reference()
        .child("queue")
        .child(todoKey)
        .once()
        .then((DataSnapshot snapshot) {
      var todo = new TodoName.fromJson(snapshot.key, snapshot.value);
      completer.complete(todo);
    });

    return completer.future;
  }
}
