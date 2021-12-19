import 'dart:core';
import 'package:pratokente/app/app.locator.dart';
import 'package:pratokente/app/app.logger.dart';
import 'package:pratokente/app/app.router.dart';
import 'package:pratokente/core/datamodels/cart/cart_product.dart';
import 'package:pratokente/core/datamodels/orders/order_data.dart';
import 'package:pratokente/core/datamodels/products/product_data.dart';
import 'package:pratokente/core/services/cart/cart_service.dart';
import 'package:pratokente/global/global.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CartViewModel extends BaseViewModel {
  int discountPercentage = 0;
  final _navigationService = locator<NavigationService>();
  final _logger = getLogger('CartViewModel');

  OrderData? _orderData;

  int trackItensInCart = 0;
  CartProduct? tempCart;
  int cartQuantity = 0;
  String? couponCode;
  int _count = 1;
  final _cartService = locator<CartService>();

  ProductData? selectedProduct;

  //Create a List of Products.
  List<CartProduct> _cartOfListProducts = [];

  void initializeCartProducts() {
    try {
      setBusy(true);
      _cartOfListProducts = _cartService.getCartOfListProducts!;
      setBusy(false);
      notifyListeners();
    } catch (e) {
      // return e.toString();
    }
  }

  List<CartProduct> get getCartOfListProducts => _cartOfListProducts;

  int get getCartLength => _cartService.getProductLength()!;

  void removeCartItem(CartProduct cartProduct) {
    //Remove The product from Firebase
    _cartService.removeCartItem(cartProduct: cartProduct);
    //remove the product from the List
    _cartOfListProducts.remove(cartProduct);

    //notify listerns
    notifyListeners();
  }

  void decProduct(CartProduct cartProduct) {
    //Decrease The Quantify
    if (cartProduct.quantity > 1) {
      // ignore: unnecessary_null_comparison
      if (cartProduct.quantity != null) {
        cartQuantity = cartProduct.quantity - 1;

        CartProduct tempCartProducts = CartProduct(
            userId: cartProduct.userId,
            quantity: quantity,
            subtotal: cartProduct.subtotal,
            cartId: cartProduct.cartId,
            products: cartProduct.products,
            status: cartProduct.status,
            date: cartProduct.date,
            totalPrice: 0.0);
        tempCart = tempCartProducts;
      }
      // cartProduct.quantity--;
      _cartService.updateCart(cartProduct: tempCart!);
      //Update The Database
    } else {
      removeCartItem(cartProduct);
    }
    //update Our Screen
    notifyListeners();
  }

  double getProductPrice() {
    double price = 0.0;
    //Check all the product in Cart Product.
    for (CartProduct cart in Global.products!) {
      if (cart.products != null) price += cart.products.price! * cart.quantity;
    }
    return price;
  }

  //Get The Discount
  double getTax() {
    return (getProductPrice() * 0.00);
  }

  void updatePrices() {
    //To update the price just need to notify the listeners.
    notifyListeners();
  }

  //Get the Delivery Price.
  double getDelivery() {
    return 2000.0;
  }

  double getTotal() {
    double total = 0.0;
    total = getProductPrice() + getTax() + getDelivery();
    return total;
  }

  double getSubTotal() {
    /* double subTotal = 0.0;
    subTotal = getProductPrice() * quantity;*/
    return getProductPrice();
  }

  void incProduct(CartProduct cartProduct) async {
    //Increase The Quantity.
    if (cartProduct.quantity != null) {
      cartQuantity = cartProduct.quantity + 1;
      // cartProduct.quantity++;

      //Update The Database
      await _cartService.updateCart(
        cartProduct: CartProduct(
            userId: cartProduct.userId,
            quantity: cartQuantity,
            subtotal: cartProduct.subtotal,
            cartId: cartProduct.cartId,
            products: cartProduct.products,
            status: cartProduct.status,
            date: cartProduct.date,
            totalPrice: 0.0),
      );
      notifyListeners();
    }
  }

  int get quantity => _count;

  int increment() {
    _count++;
    notifyListeners();
    return _count;
  }

  int decrement() {
    if (_count > 1) {
      _count--;
      notifyListeners();
      return _count;
    }
    throw '';
    //return _count;
  }

  Future<OrderData?> requestOrder(
      {double? total,
      List<CartProduct>? cartProducts,
      double? subTotal}) async {
    setBusy(true);

    _orderData = OrderData(
        cartProducts: cartProducts,
        date: DateTime.now(),
        totalPrice: total,
        subTotal: subTotal,
        paymentMethod: 'null',
        deliveryAddress: 'null',
        orderStatus: 1,
        userId: Global.userId);

    double deliveryPrice = getDelivery();

    double tax = getTax();

    //_cartService.saveOrder(total: total, products:products, subTotal: subTotal);
    if (_orderData != null) {
      _cartService.setUserOrders(orders: _orderData);
    } else {
      return _orderData;
    }

    setBusy(false);

    notifyListeners();
    //throw '';
  }

  verifyCoupon(String coupon) {
    setBusy(true);
    //return _productService.verifyCoupon(coupon);
    setBusy(false);
  }

  void navToListOfMerchants() {
    _navigationService.clearStackAndShow(Routes.getProuctByMerchantView);
  }
}
