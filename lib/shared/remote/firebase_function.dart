import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/models/one_task_model.dart';

class FireBaseFunction {
  static CollectionReference<OneTaskModel> getCollection() {
    return FirebaseFirestore.instance
        .collection('Tasks')
        .withConverter<OneTaskModel>(
          fromFirestore: (snapshot, options) =>
              OneTaskModel.fromjson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        );
  }

  static Future<void> addTaskToFireStore(OneTaskModel taskModel) async {
    var collectionRef = getCollection();
    var docRef = collectionRef.doc();
    taskModel.id = docRef.id;
    docRef.set(taskModel);
  }

  static Stream<QuerySnapshot<OneTaskModel>> getTaskFromFireStore(String date) {
    var collectionRef = getCollection();
    return collectionRef.where('date', isEqualTo:date).snapshots();
  }

 static Future<void> deleteTask (String taskId) async{
    var collectionRef = getCollection();
    var docRef = collectionRef.doc(taskId);
   docRef.delete();
  }

  static Future<void> updateStatus (String taskId, OneTaskModel taskModel) async {
    var collectionRef = getCollection();
    var docRef = collectionRef.doc(taskId);
    taskModel.status = !taskModel.status;
    return docRef.update(taskModel.toJson());
  }

  Future<void> updateTask (String taskId, OneTaskModel taskModel) async {
    var collectionRef = getCollection();
    var docRef = collectionRef.doc(taskId);
    return docRef.update(taskModel.toJson());
  }

}
