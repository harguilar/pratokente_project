import 'package:cloud_firestore/cloud_firestore.dart';

/// This package contains all the constants used.

const BUBBLE_WIDTH = 55.0;

const FULL_TARNSITION_PX = 300.0;

const PERCENT_PER_MILLISECOND = 0.00125;

enum SlideDirection {
  leftToRight,
  rightToLeft,
  none,
}

enum UpdateType {
  dragging,
  doneDragging,
  animating,
  doneAnimating,
}

enum TransitionGoal {
  open,
  close,
}

/// CONSTANT VARIABLES ///

const APP_NAME = "PratoKente";
const statuses = ['cancelado', 'Em preparação', 'Em transporte', 'Entregue'];
const GoogleMapsEnvKey = 'GOOGLE_MAPS_API_KEY';
const NoKey = 'NoKey';

//Define an Instance of the DB
final productsReference = FirebaseFirestore.instance.collection('products');
final merchantsReference = FirebaseFirestore.instance.collection('merchants');
// final _addProducts = FirebaseFirestore.instance.collection('category').doc('Restaurante').collection('itens');
final categoryReference = FirebaseFirestore.instance.collection('category');
final bookingReference = FirebaseFirestore.instance.collection('booked');
final userRef = FirebaseFirestore.instance.collection('users');
final ordersRef = FirebaseFirestore.instance.collection('orders');
final cancelledOrders =
    FirebaseFirestore.instance.collection('ordersCancelled');
