import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

class Todo {
  final String key;
  int amount;

  Todo.fromsJson(this.key, Map data) {
    amount = data.length;
    if (amount == null) {
      amount = 0;
    }
  }
}

class FirebaseTodos {
  static Future<StreamSubscription<Event>> getTodoStream(
      String todoKey, void onData(Todo todo)) async {
    StreamSubscription<Event> subscription = FirebaseDatabase.instance
        .reference()
        .child("queue")
        .onValue
        .listen((Event event) {
      var todos = new Todo.fromsJson(event.snapshot.key, event.snapshot.value);
      onData(todos);
    });

    return subscription;
  }

  static Future<Todo> getTodo(String todoKey) async {
    Completer<Todo> completer = new Completer<Todo>();

    FirebaseDatabase.instance
        .reference()
        .child("queue")
        .once()
        .then((DataSnapshot snapshot) {
      var todos = new Todo.fromsJson(snapshot.key, snapshot.value);
      completer.complete(todos);
    });

    return completer.future;
  }
}
