import 'dart:async';
import 'package:flutter/material.dart';
import '../../locator.dart';
import '../services/api.dart';
import '../models/productModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDModel extends ChangeNotifier {
  Api _api = locator<Api>();

  List<Product> info;

  Future<List<Product>> fetchProducts() async {
    var result = await _api.getDataCollection();
    info =
        result.docs.map((doc) => Product.fromMap(doc.data(), doc.id)).toList();
    return info;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Product> getProductById(String id) async {
    var doc = await _api.getDocumentById(id);
    return Product.fromMap(doc.data(), doc.id);
  }

  Future<void> removeProduct(String id) async {
    await _api.removeDocument(id);
  }

  Future<void> updateProduct(Product data, String id) async {
    await _api.updateDocument(data.toJson(), id);
  }

  Future<void> addProduct(Product data) async {
    var result = await _api.addDocument(data.toJson());
  }
}
