import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pratokente/app/app.locator.dart';
import 'package:pratokente/app/app.logger.dart';
import 'package:pratokente/core/datamodels/cart/cart_product.dart';
import 'package:pratokente/core/datamodels/orders/order_data.dart';
import 'package:pratokente/core/services/users/users_services.dart';
import 'package:pratokente/constants/constants.dart';
import '../../../apis/firestore_api.dart';

class CartService {
  final log = getLogger('CartService');
  final _firestoreApi = locator<FirestoreApi>();
  final _userService = locator<UserService>();

  // double _total;
  List<CartProduct>? _cartListOfProduct = [];

  OrderData? _orderData;

  DocumentReference? doc;

  DocumentReference? _documentReference;

  DocumentReference? _orderReference;

  String? _cartDocIdReference;

  setId(String id) {
    _cartDocIdReference = id;
  }

  get getCartDocumentIdRef => _cartDocIdReference;

  void setCartOfListProducts({List<CartProduct>? cartListOfProduct}) {
    if (cartListOfProduct != null && cartListOfProduct.isNotEmpty) {
      _cartListOfProduct = cartListOfProduct;
    }
  }

  List<CartProduct>? get getCartOfListProducts => _cartListOfProduct!;

  OrderData? get getUserOrders => _orderData;

  Future updateCart({required CartProduct cartProduct}) async {
    try {
      await userRef
          .doc(cartProduct.userId)
          .collection('cart')
          .doc(cartProduct.cartId)
          .update(cartProduct.toJson());
    } catch (err) {
      log.i('Caught Error: $err');
    }
  }

  Future generateDocumentId() async {
    DocumentReference ref = await userRef.doc();
    _cartDocIdReference = ref.id;
  }

  addCartItem({CartProduct? cartProduct}) async {
    try {
      //Add Orders to FireBase. and Get the Id of the Document.
      _documentReference =
          await userRef.doc(cartProduct!.userId).collection('cart').add({
        "cartId": cartProduct.cartId,
        "date": cartProduct.date,
        "products": cartProduct.products.toJson(),
        "quantity": cartProduct.quantity,
        "status": cartProduct.status,
        "subtotal": cartProduct.subtotal,
        "totalPrice": cartProduct.totalPrice,
        "userId": cartProduct.userId,
      });

      await userRef
          .doc(cartProduct.userId)
          .collection('cart')
          .doc(_documentReference!.id)
          .update({'cartId': _documentReference!.id});

      setId(_documentReference!.id);
    } catch (e) {
      log.wtf(" Document Error: " + e.toString());
    }
  }

  int? getProductLength() {
    try {
      if (_cartListOfProduct == null) {
        return 0;
      } else if (_cartListOfProduct!.length == 0) {
        return 0;
      } else if (_cartListOfProduct!.length > 0) {
        return _cartListOfProduct!.length;
      }
    } catch (err) {
      print('Caught Error: $err');
    }
  }

  Stream<List<CartProduct>>? getCartProductByUser(String userId) {
    try {
      return userRef.doc(userId).collection('cart').snapshots().map(
          (snapShot) => snapShot.docs
              .map((docs) => CartProduct.fromJson(docs.data()))
              .toList());
    } catch (err) {
      print('Caught Error: $err');
    }
  }

  Future<List<CartProduct>?> getCartListOfProducts(
      {required String userId}) async {
    var getCartListOfProducts =
        await _firestoreApi.getCartProducts(userId: userId);
    if (getCartOfListProducts!.isNotEmpty) {
      return getCartOfListProducts;
    } else {
      log.wtf('List of Products should not be Empty: $getCartOfListProducts');
    }
  }

  getDelivery() {
    return FirebaseFirestore.instance
        .collection('globalValues')
        .doc('WwDtkH87YZX66GEBA0Rr')
        .get()
        .then((doc) => doc['delivery'] + 0.0);
  }

  void removeCartItem({CartProduct? cartProduct}) {
    //Remove The product from Firebase
    userRef
        .doc(cartProduct!.userId)
        .collection('cart')
        .doc(cartProduct.cartId)
        .delete();
  }

  void deleteUserCartItem({String? userId}) {
    //Remove The product from Firebase
    userRef.doc(userId).delete();
  }

  Future<String> finishOrder(
      {List<CartProduct>? products,
      double? price,
      double? delivery,
      double? tax,
      double? total,
      String? userId}) async {
    //check if the cart is empty
    //if (products!.length == 0) return 0;

    //Add Orders to FireBase. and Get the Id of the Document.
    DocumentReference refOrder = await ordersRef.add({
      //Add the MAP to firestore.
      'clientId': userId,
      //Convert The product in our Cart  to Map list.
      'products': products!.map((cartProduct) => cartProduct.toJson()).toList(),
      'delivery': delivery,
      'tax': tax,
      'total': total,
      //Status 1 means is processing your order 2 means is done.
      'status': 1
    }
        //Now Lets Safe the Order ID within our User. so that we are aware which order belongs to which user.
        );

    await userRef
        .doc(_userService.getCurrentUser.id)
        .collection('orders')
        .doc(refOrder.id)
        .set({'orderId': refOrder.id});

    //Delete our order once done.
    QuerySnapshot query = await userRef
        .doc(_userService.getCurrentUser.id)
        .collection('cart')
        .get();
    for (DocumentSnapshot doc in query.docs) {
      //delete the Document
      doc.reference.delete();
    }
    //Clear your Local list
    products.clear();
    //return the Document reference so that the User get notified§
    return refOrder.id;
  }

  Future addOrder(OrderData userOrders) async {
    try {
      //setTotalProducts(total: userOrders.totalPrice);

      _orderReference = await ordersRef.add(userOrders.toJson());

      // await _ordersRef.add(userOrders.toMap()).then((doc){userOrders.orderId = doc.id;});

      await ordersRef
          .doc(_orderReference!.id)
          .update({'orderId': _orderReference!.id});

      //setId(userOrders.orderId);

    } catch (e) {
      // ignore: todo
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
      double? deliveryPrice,
      double? tax,
      double? subTotal}) async {
    //Set the Total Price
    // setTotalProducts(total: total);

    //const orderId = FirebaseFirestore.FieldValue.increment(1);
    // ignore: unused_local_variable
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
      'orderId': FieldValue.increment(1)
    });

    /*
        //Now Lets Safe the Order ID within our User. so that we are aware which order belongs to which user.
        _ordersCountDocementRef.set({'orderNumber': FieldValue.increment(1)});

        _ordersCountDocementRef.get().then((documentSnap) => refOrder.set({'orderNumber': documentSnap['orderNumber']}));
    */

    //final documentSnapshot= await _ordersRef.doc(refOrder.id).get();
    // return OrderData.fromDocument(documentSnapshot);
    throw '';
  }

  Future userOrderId() async {
    await userRef
        .doc(_userService.getCurrentUser.id)
        .collection('orders')
        .add({'orderId': _documentReference!.id, 'orderStatus': 1});
  }

//Update Cart Info.
  void updateCartstatus({required String userId}) {
    _firestoreApi.updateCartstatus(userId: userId);
  }

  Future updatePaymentMethod(
      {String? docId, String? deliveryAddress, String? paymentMethod}) async {
    try {
      await ordersRef.doc(docId).update({
        'delivery': deliveryAddress,
        'paymentMethod': paymentMethod,
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void setUserOrders({OrderData? orders}) {
    _orderData = orders;
  }
}
