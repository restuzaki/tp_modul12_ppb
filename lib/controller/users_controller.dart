import 'package:cloud_firestore/cloud_firestore.dart';

class UsersController {
  final CollectionReference usersCollection = FirebaseFirestore.instance
      .collection('users');

  Stream<QuerySnapshot> streamUsers() {
    return usersCollection.orderBy('createdAt', descending: true).snapshots();
  }

  Future<void> createUsers(String name, String description) async {
    await usersCollection.add({
      'name': name,
      'description': description,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> updateUsers(
    String docId,
    String name,
    String description,
  ) async {
    return await usersCollection.doc(docId).update({
      'name': name,
      'description': description,
    });
  }

  Future<void> deleteUsers(String docId) async {
    return await usersCollection.doc(docId).delete();
  }
}
