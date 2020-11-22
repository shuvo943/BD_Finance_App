import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class Api {
  // ignore: deprecated_member_use
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String path = 'info';
  CollectionReference ref;
  DocumentReference df;

  Api(path) {
    ref = _db.collection(path);
    df = _db.collection("dd").doc("pp");
  }

  Future<QuerySnapshot> getDataCollection() {
    return ref.get();
  }

  Stream<QuerySnapshot> streamDataCollection() {
    return ref.snapshots();
  }

  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.doc(id).get();
  }

  Future<void> removeDocument(String id) {
    return ref.doc(id).delete();
  }

  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }

  Future<void> updateDocument(Map data, String id) {
    return ref.doc(id).update(data);
  }
}
