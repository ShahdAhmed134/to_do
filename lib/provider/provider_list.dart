import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/firebase.dart';
import 'package:to_do_app/task.dart';
import 'package:to_do_app/firebase.dart';

class ProviderList extends ChangeNotifier {
  List<Task> tasksList = [];

  void getAllTasksFromFireStore() async {
    QuerySnapshot<Task> querySnapshot =
        await Firebase.getTaskCollection().get();

    /// List<QueryDocumentSnapshot<Task>> => 'List<Task>
    tasksList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    notifyListeners();
  }
}
