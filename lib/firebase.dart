import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/model/task.dart';

class Firebase {
  static CollectionReference<Task> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection(Task.colllectionName)
        .withConverter<Task>(
          fromFirestore: (snapshot, option) =>
              Task.fromFirestore(snapshot.data()!),
          toFirestore: (task, option) => task.toFirestore(),
        );
  }

  static Future<void> addTaskFirestore(Task task) {
    var taskCollection = getTaskCollection();

    /// collection
    var taskDocument = taskCollection.doc();

    ///document
    task.id = taskDocument.id;
    return taskDocument.set(task);
  }

  ////////////////////////////////////////
  static Future<void> updateTaskFirestore(Task task) {
    var taskCollection = getTaskCollection();

    /// collection
    var taskDocument = taskCollection.doc();

    ///document
    task.id = taskDocument.id;
    return taskDocument.set(task);
  }

  static Future<void> deleteTaskFromFireStore(Task task) {
    return getTaskCollection().doc(task.id).delete();
  }
}
