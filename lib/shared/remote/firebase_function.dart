import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/models/one_task_model.dart';

class FireBaseFunction {
  static CollectionReference<OneTaskModel> getCollection() {
    return FirebaseFirestore.instance
        .collection('Tasks')
        .withConverter<OneTaskModel>(
          fromFirestore: (snapshot, options) =>
              OneTaskModel.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        );
  }

static  Future<void> addTaskToFireStore(OneTaskModel taskModel) async {
    var collectionRef = getCollection();
    var docRef = collectionRef.doc();
    taskModel.id = docRef.id;
    docRef.set(taskModel);
  }

 static Future<DocumentSnapshot<OneTaskModel>> getTaskFromFireStore() async {
    var collectionRef = getCollection();
    var docRef = collectionRef.doc();
    return docRef.get();
  }
}
