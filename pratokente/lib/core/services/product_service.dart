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

class ProductService {
  final log = getLogger('ProductService');
  final _firestoreApi = locator<FirestoreApi>();
  DocumentReference? doc;
  int productLimit = 10;
  bool _hasMoreProducts = true;

  MerchantData? _merchantData;

  void setMerchantData({required MerchantData merchantData}) {
    if (merchantData != null) {
      log.i('This is the Current Data Being Set $merchantData');
      _merchantData = merchantData;
    } else {
      log.w('I dont Like Empty Values');
    }
  }

  MerchantData? get getMerchantData => _merchantData!;

  final StreamController<List<ProductData>> _productController =
      StreamController<List<ProductData>>.broadcast();

  // #6: Create a list that will keep the paged results
  List<List<ProductData>>? _allPagedResults = [];

  DocumentSnapshot? _lastDocument;

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
      return productsReference.snapshots().map((snapshot) => snapshot.docs
          .map((doc) => ProductData.fromJson(doc.data()))
          .toList());
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

  Future addBookingInfo(BookedData bookData) async {
    try {
      doc = await bookingReference.add(bookData.toJson());

      await categoryReference.doc(doc!.id).update({'bookId': doc!.id});
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

  Stream listenToProductsRealTime() {
    // Register the handler for when the posts data changes
    _requestProducts();
    return _productController.stream;
  }

  // #1: Move the request Merchant Data into it's own function
  void _requestProducts() {
    // #2: split the query from the actual subscription
    var pageProductQuery = merchantsReference
        .doc(_merchantData!.id)
        .collection('products')
        .orderBy('name')
        //Limit the Amoutn of Result
        .limit(productLimit);
    log.i('This is the Result of my Page Query $pageProductQuery');

    // #5: If we have a document start the query after it
    if (_lastDocument != null) {
      pageProductQuery = pageProductQuery.startAfterDocument(_lastDocument!);
    }

    //if (!_hasMoreProducts) return;

    // #7: Get and store the page index that the results belong to
    var currentRequestIndex = _allPagedResults!.length;

    pageProductQuery.snapshots().listen((productSnapshot) {
      if (productSnapshot.docs.isNotEmpty) {
        var products = productSnapshot.docs
            .map((document) => ProductData.fromJson((document.data())));

        // #8: Check if the page exists or not
        var pageExists = currentRequestIndex < _allPagedResults!.length;

        // #9: If the page exists update the posts for that page
        if (pageExists) {
          _allPagedResults![currentRequestIndex] =
              products.cast<ProductData>().toList();
        }
        // #10: If the page doesn't exist add the page data
        else {
          _allPagedResults!.add(products.toList());
        }

        // #11: Concatenate the full list to be shown
        var allProducts = _allPagedResults!.fold<List<ProductData>>(
            [], (initialValue, pageItems) => initialValue..addAll(pageItems));

        // #12: Broadcase all posts
        _productController.add(allProducts);

        // #13: Save the last document from the results only if it's the current last page
        if (currentRequestIndex == _allPagedResults!.length - 1) {
          _lastDocument = productSnapshot.docs.last;
        }

        // #14: Determine if there's more products to request
        _hasMoreProducts = products.length == productLimit;
      } else {
        log.w('do not give me empty Docs');
      }
    });
  }

  void requestMoreData({String? merchantId}) => _requestProducts();
}
