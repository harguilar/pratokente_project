import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:pratokente/apis/firestore_api.dart';
import 'package:pratokente/app/app.locator.dart';
import 'package:pratokente/app/app.logger.dart';
import 'package:pratokente/constants/constants.dart';
import 'package:pratokente/core/datamodels/booked/booked_data.dart';
import 'package:pratokente/core/datamodels/merchants/merchant_data.dart';
import 'package:pratokente/core/datamodels/products/product_data.dart';
import 'package:pratokente/expections/firestore_api_exceptions.dart';
import 'package:pratokente/expections/products_services_expections.dart';

class ProductService {
  final log = getLogger('ProductService');
  final _firestoreApi = locator<FirestoreApi>();
  String _productCategory = '';
  DocumentReference? doc;
  MerchantData? _merchantData;
  List<MerchantData>? _merchantlistData;
  int documentLimit = 10;
  bool _fetchProducts = false;
  bool _hasMoreProducts = true;
  final _productDocumentSnap = <DocumentSnapshot>[];

  void setProductCategory({required String productCategory}) {
    _productCategory = productCategory;
  }

  void setMerchantData({required MerchantData merchantData}) {
    if (merchantData != null) {
      log.i('This is the Current Data Being Set $merchantData');
      _merchantData = merchantData;
    } else {
      log.w('I dont Like Empty Values');
    }
  }

  MerchantData? get getMerchantData => _merchantData!;

  List<MerchantData>? get getMerchantListData => _merchantlistData;

  get getProductCategory => _productCategory;

  Stream<List<ProductData>> getFeaturedProducts() {
    try {
      return productsReference
          .where('isFeatured', isEqualTo: true)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => ProductData.fromJson(doc.data()))
              .toList());
    } catch (e) {
      // ignore: todo
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        // return e;
      }
      //return e.toString();
      throw FirestoreApiExceptions(message: 'Product Not Fetched ...');
    }
  }

  Future<ProductData> getProductById(String productId) async {
    final productById = await _firestoreApi.getProductById(productId);
    return productById!;
  }

  Stream<List<ProductData>> getAllProducts() {
    try {
      return productsReference.snapshots().map((snapshot) => snapshot.docs
          .map((doc) => ProductData.fromJson(doc.data()))
          .toList());
    } catch (err) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      return productsReference.snapshots().map((snapshot) => snapshot.docs
          .map((doc) => ProductData.fromJson(doc.data()))
          .toList());
      // throw '';
      //return e.toString();
    }
  }

  Future addProduct(ProductData productData) async {
    try {
      doc = await categoryReference.add(productData.toJson());

      await categoryReference.doc(doc!.id).update({'id': doc!.id});
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

  Stream<List<ProductData>> getPopularProducts() {
    try {
      return productsReference
          .where('isPopular', isEqualTo: true)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => ProductData.fromJson(doc.data()))
              .toList());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        // return e;
      }
      throw '';
      //return e.toString();
    }
  }

  Stream<List<ProductData>> getProductsByCategory() {
    try {
      return merchantsReference
          .doc(_productCategory)
          .collection('itens')
          .doc(_merchantData!.name)
          .collection('products')
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => ProductData.fromJson(doc.data()))
              .toList());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        // return e;
      }
      throw '';
      //return e.toString();
    }
  }

  Future getProdsByCategory() async {
    try {
      var productsDocuments = await productsReference
          .where('category', isEqualTo: _productCategory)
          .get();

      if (productsDocuments.docs.isNotEmpty) {
        return productsDocuments.docs
            .map((docs) => ProductData.fromJson(docs.data()))
            .toList();
      }
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

  Future addBookingInfo(BookedData bookData) async {
    try {
      doc = await bookingReference.add(bookData.toJson());
      await categoryReference.doc(doc!.id).update({'bookId': doc!.id});
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

  bool get hasMoreProducts => _hasMoreProducts;

  List<ProductData>? get getProducts => _productDocumentSnap.map((snap) {
        final _products = snap.data();
        return ProductData(
          name: _products!['name'],
          description: _products['description'],
          price: _products['price'],
          id: _products['id'],
          image: _products['image'],
          category: _products['category'],
        );
      }).toList();

  Future<QuerySnapshot?> fetchProducts(
      {required int documentLimit, DocumentSnapshot? startAfter}) async {
    try {
      final _products = await merchantsReference
          .doc(_merchantData!.id)
          .collection('products')
          .orderBy('name')
          .limit(documentLimit);

      if (startAfter == null) {
        return _products.get();
      } else {
        return _products.startAfterDocument(startAfter).get();
      }
    } catch (e) {
      throw ProductServicesExceptions(
          message: 'Your Query Snapshot failed $e', devDetails: '$e');
    }
  }

  Future fetchAllProducts() async {
    try {
      if (_fetchProducts) return;
      _fetchProducts = true;
      final _snapShot = await fetchProducts(
          documentLimit: documentLimit,
          startAfter: _productDocumentSnap.isNotEmpty
              ? _productDocumentSnap.last
              : null);
      _productDocumentSnap.addAll(_snapShot!.docs);
      if (_snapShot.docs.length < documentLimit) _hasMoreProducts = false;
      // notifyListeners();
      _fetchProducts = false;
    } catch (e) {
      throw ProductServicesExceptions(
          message: 'Was Not able to fetchAllMerchants $e', devDetails: '$e');
    }
  }
}
