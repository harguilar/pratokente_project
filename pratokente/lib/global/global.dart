import 'dart:io';

import 'package:money2/money2.dart';
import 'package:pratokente/core/datamodels/cart/cart_product.dart';

class Global {
  static File? img;
  static final statuses = [
    'Cancelada',
    'Aguardando Pagamento do Envio (AOA 3.000,00)',
    'Em preparação',
    'Transporte',
    'Entregue'
  ];
  static String? userId;
  static List<CartProduct>? products = [];
  //final _cartService = locator<CartService>();

  var euro = Currency.create('EUR', 2,
      symbol: 'Kz', invertSeparators: true, pattern: '#.##0,00 S');

  static const requestReferences = 'https://api.proxypay.co.ao/references/';
  static const requestPayment = 'https://api.proxypay.co.ao/payments';
  static const apiKey = 'cyc2hrr5sv2ii4fcduasyoudzpxoo2zr';
  int trackItensIncart = 0;

  static String removeDiacritics(String str) {
    var withDia =
        'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
    var withoutDia =
        'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

    for (int i = 0; i < withDia.length; i++) {
      str = str.replaceAll(withDia[i], withoutDia[i]);
    }

    return str;
  }

  //print(bmwPrice.toString());

  formatPrice(double price) {
    var bmwPrice = Money.from(price, euro);
    //Format the Current for the view.

    //notifyListeners();
    return bmwPrice;
  }

  /* dynamic initializeCartProducts() async {
    return await ;
  }*/
}
