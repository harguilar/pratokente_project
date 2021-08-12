import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pratokente/app/app.locator.dart';
import 'package:pratokente/app/app.logger.dart';
import 'package:pratokente/constants/constants.dart';
import 'package:pratokente/core/datamodels/cart/cart_product.dart';
import 'package:pratokente/core/datamodels/orders/order_data.dart';
import 'package:pratokente/core/services/users_services.dart';

import 'package:pratokente/global/global.dart';

class OrdersService {
  final log = getLogger('UserService');
  final _userService = locator<UserService>();

  DocumentReference? doc;
  String? _docIdReference;

  OrderData? _clientOrders;

  void setClientOrders(OrderData clientOrders) {
    _clientOrders = clientOrders;
  }

  OrderData get getClientOrder => _clientOrders!;

  //Define the Client Order setters.

  void setId(String id) {
    //  _clientOrders.id = id;
    _docIdReference = id;
  }

  get getDocumentIdRef => _docIdReference;

  Future updateOrder({OrderData? orderModel}) async {
    try {
      await ordersRef.doc(doc!.id).set(orderModel!.toJson());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future updatePaymentReference(
      {String? docId, String? paymentReference}) async {
    try {
      await ordersRef.doc(docId).set({'paymentReference': paymentReference});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Stream<List<OrderData>> getOrdersByUser(String uid) {
    return ordersRef
        .orderBy('date', descending: true)
        .where('buyerId', isEqualTo: uid)
        .snapshots()
        .map((snapShot) => snapShot.docs
            .map((document) => OrderData.fromJson(document.data()))
            .toList());
  }

  removeDocumentById(String id) {
    ordersRef.doc(id).delete();
    return id;

    ///throw '';
  }

/*   Stream<List<OrderData>> getOrdersIdByUser() {
    return _userRef.doc(Global.userId).collection('orders').snapshots().map(
        (snapShot) => snapShot.docs
            .map((document) => OrderData.fromDocumentGetId(document))
            .toList());
  } */

  Future addOrder(OrderData orderModel) async {
    try {
      doc = await ordersRef.add(orderModel.toJson());

      //Set the Id Field to document ID
      setId(doc!.id);
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

  Future addOrdersCancelled(OrderData orderModel) async {
    try {
      doc = await cancelledOrders.add(orderModel.toJson());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

  Future<OrderData> saveOrder(
      {double? total,
      List<CartProduct>? products,
      deliveryPrice,
      tax,
      double? subTotal}) async {
    //Set the Total Price

    //const orderId = FirebaseFirestore.FieldValue.increment(1);
    DocumentReference refOrder = await ordersRef.add({
      //Add the MAP to firestore.
      'userId': _userService.getCurrentUser.id,
      //Convert The product in our Cart  to Map list.
      'products': products!.map((cartProduct) => cartProduct.toJson()).toList(),
      'delivery': deliveryPrice ?? 0,
      'tax': tax ?? 0,
      'total': total,
      'subTotal': subTotal,
      'date': DateTime.now(),
      'status': 1,
    });
    throw '';
    /*
        //Now Lets Safe the Order ID within our User. so that we are aware which order belongs to which user.
        _ordersCountDocementRef.set({'orderNumber': FieldValue.increment(1)});

        _ordersCountDocementRef.get().then((documentSnap) => refOrder.set({'orderNumber': documentSnap['orderNumber']}));
    */

    //final documentSnapshot= await _ordersRef.doc(refOrder.id).get();
    // return OrderData.fromDocument(documentSnapshot);
  }

  //Stream<List<OrderData>> getOrdersIdByUser() {}
}
