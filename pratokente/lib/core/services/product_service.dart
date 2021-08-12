import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:pratokente/app/app.locator.dart';
import 'package:pratokente/constants/constants.dart';
import 'package:pratokente/core/datamodels/booked/booked_data.dart';
import 'package:pratokente/core/datamodels/merchants/merchant_data.dart';
import 'package:pratokente/core/datamodels/products/product_data.dart';
import 'package:pratokente/expections/firestore_api_exceptions.dart';

import 'firestore_api.dart';

class ProductService {
  final _firestoreApi = locator<FirestoreApi>();
  String _productCategory = '';
  DocumentReference? doc;
  MerchantData? _merchantData;
  List<MerchantData>? _merchantlistData;
  int merchantProductLimit = 2;
  bool _hasMoreMerchants = true;

  // #6: Create a list that will keep the paged results
  List<List<MerchantData>>? _allPagedResults = [];

  DocumentSnapshot? _lastDocument;

  final StreamController<List<MerchantData>> _merchantController =
      StreamController<List<MerchantData>>.broadcast();

  void setProductCategory({required String productCategory}) {
    _productCategory = productCategory;
  }

  void setListMerchant({required List<MerchantData> merchantListData}) {
    _merchantlistData = merchantListData;
  }

  void setMerchant({required MerchantData merchantData}) {
    _merchantData = merchantData;
  }

  MerchantData? get getMerchantData => _merchantData;
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

  /*  Future getMerchantByCategory() async {
    _requestData();
  } */

  Future addProduct(ProductData productData) async {
    try {
      doc = await categoryReference.add(productData.toJson());

      await categoryReference.doc(doc!.id).update({'id': doc!.id});

      //Set the Id Field to document ID
      //setId(doc.id);

    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

  Query getQuery() {
    return productsReference.orderBy('title');
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
      return categoryReference
          .doc(_productCategory)
          .collection('itens')
          .doc(_merchantData!.id)
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

/*   Stream<List<ProductData>> getProdutsByCategory(String uid) {
    return productsReference
        .where('category', isEqualTo: _productCategory)
        .snapshots()
        .map((snapShot) => snapShot.docs
            .map((document) => ProductData.fromMap(document.data()))
            .toList());
  } */

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

      //Set the Id Field to document ID
      //setId(doc.id);

    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

  Stream listenToMerchantsRealTime() {
    // Register the handler for when the posts data changes
    _requestMerchant();
    return _merchantController.stream;
  }

  // #1: Move the request Merchant Data into it's own function
  void _requestMerchant() {
    // #2: split the query from the actual subscription
    var pageMerchantQuery = categoryReference
        .doc(_productCategory)
        .collection('itens')
        .orderBy('name')
        //Limit the Amoutn of Result
        .limit(merchantProductLimit);

    // #5: If we have a document start the query after it
    if (_lastDocument != null) {
      pageMerchantQuery = pageMerchantQuery.startAfterDocument(_lastDocument!);
    }

    if (!_hasMoreMerchants) return;

    // #7: Get and store the page index that the results belong to
    var currentRequestIndex = _allPagedResults!.length;

    pageMerchantQuery.snapshots().listen((merchantSnapshot) {
      if (merchantSnapshot.docs.isNotEmpty) {
        var merchants = merchantSnapshot.docs
            .map((document) => MerchantData.fromJson((document.data())));

        // #8: Check if the page exists or not
        var pageExists = currentRequestIndex < _allPagedResults!.length;

        // #9: If the page exists update the posts for that page
        if (pageExists) {
          _allPagedResults![currentRequestIndex] =
              merchants.cast<MerchantData>().toList();
        }
        // #10: If the page doesn't exist add the page data
        else {
          _allPagedResults!.add(merchants.toList());
        }

        // #11: Concatenate the full list to be shown
        var allMerchants = _allPagedResults!.fold<List<MerchantData>>(
            [], (initialValue, pageItems) => initialValue..addAll(pageItems));

        // #12: Broadcase all posts
        _merchantController.add(allMerchants);

        // #13: Save the last document from the results only if it's the current last page
        if (currentRequestIndex == _allPagedResults!.length - 1) {
          _lastDocument = merchantSnapshot.docs.last;
        }

        // #14: Determine if there's more posts to request
        _hasMoreMerchants = merchants.length == merchantProductLimit;
      }
    });
  }

  void requestMoreData() => _requestMerchant();
}
