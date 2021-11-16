import 'package:pratokente/app/app.locator.dart';
import 'package:pratokente/core/datamodels/cart/cart_product.dart';
import 'package:pratokente/core/datamodels/merchants/merchant_data.dart';
import 'package:pratokente/core/datamodels/products/product_data.dart';
import 'package:pratokente/core/services/cart/cart_service.dart';
import 'package:pratokente/core/services/users/users_services.dart';
import 'package:pratokente/core/services/products/product_service.dart';
import 'package:stacked/stacked.dart';
//import 'package:stacked_services/stacked_services.dart';

class GetProductByMerchantViewModel extends BaseViewModel {
  final ProductService _productService = locator<ProductService>();
  final _currentUser = locator<UserService>();
  final CartService _cartService = locator<CartService>();
  List<CartProduct>? cartProducts = [];
  List<CartProduct> productsTmp = [];
  List<ProductData>? _productsData = [];
  CartProduct? tempCart;
  int? quantity;
  double? subtotal;
  int? _cartLength;
  bool checkItemInCart = false;

  String? _userId;

  String? get getUserId => _userId;

  void setUserId(String userId) {
    _userId = userId;
  }

  bool get getHasMoreProducts => _productService.hasMoreProducts;
  List<ProductData>? get getProductsData => _productsData!;
  MerchantData? get getMerchantData => _productService.getMerchantData!;

  initializeCartProducts() {
    setBusy(true);
    //products = Global.products!;
    cartProducts = _cartService.getProductList;
    //print('Testing the Line \n');
    setBusy(false);
    notifyListeners();
  }

  Future fetchProduct() async {
    setBusy(true);
    await _productService.fetchAllProducts();
    _productsData = _productService.getProducts;
    setBusy(false);
    notifyListeners();
  }

  void addCartItens({required CartProduct cartProduct}) {
    if ((cartProducts != null) && (cartProducts!.length > 0)) {
      for (int count = 0; count < cartProducts!.length; count++) {
        //You Itens in the Cart With Same Id-> Increase Quantity
        if (cartProducts!.contains(cartProduct.products.id)) {
          checkItemInCart = true;
          //Increment Quantity
          quantity = cartProducts![count].quantity + 1;
          //Calculate SubTotal
          subtotal = calculateSubTotal(
              price: cartProduct.products.price!, quantity: quantity!);

          tempCart = CartProduct(
              userId: cartProducts![count].userId,
              quantity: quantity!,
              subtotal: subtotal!,
              cartId: cartProducts![count].cartId,
              products: cartProducts![count].products,
              status: cartProducts![count].status,
              date: cartProducts![count].date,
              totalPrice: 0.0);

          break;
        }
        /*    if (cartProduct.products.id == cartProducts![count].products.id) {

        } */
      }
      if (!checkItemInCart) {
        //You have Itens in The Carts with Different Ids-. Add New Item
        subtotal = calculateSubTotal(
            price: cartProduct.products.price!, quantity: quantity!);

        syncAddedCartProducts(
          cartProduct: CartProduct(
              userId: cartProduct.userId,
              quantity: cartProduct.quantity,
              subtotal: subtotal!,
              cartId: cartProduct.cartId,
              products: cartProduct.products,
              status: cartProduct.status,
              date: cartProduct.date,
              totalPrice: 0.0),
        );

        _cartService.addCartItem(
            cartProduct: cartProduct, userId: _currentUser.getCurrentUser.id);
      } else {
        // Update Cart
        _cartService.updateCart(
          cartProduct: tempCart!,
        );
        checkItemInCart = false;
      }
    } else {
      subtotal = calculateSubTotal(
          price: cartProduct.products.price!, quantity: cartProduct.quantity);

      // You do not have Itens in the Carts Add one.
      syncAddedCartProducts(
        cartProduct: CartProduct(
            userId: cartProduct.userId,
            quantity: cartProduct.quantity,
            subtotal: subtotal!,
            cartId: cartProduct.cartId,
            products: cartProduct.products,
            status: cartProduct.status,
            date: cartProduct.date,
            totalPrice: 0.0),
      );

      //cartProducts = productsTmp;

      _cartService.addCartItem(
          cartProduct: cartProduct, userId: cartProduct.userId);
    }
    //now notify listernsš
    notifyListeners();
    //_navigationService.navigateTo(CartRoute);
  }

  void syncAddedCartProducts({required CartProduct cartProduct}) {
    cartProducts!.add(cartProduct);
  }

  void navToCart() {
    //_navigationService.navigateTo(Routes.cartView);
  }
  double? calculateSubTotal({required double price, required int quantity}) {
    return price * quantity;
  }

  int getProductLength() {
    setBusy(true);
    try {
      if (cartProducts == null) {
        return 0;
      } else if (cartProducts!.length == 0) {
        return 0;
      } else if (cartProducts!.length > 0) {
        return cartProducts!.length;
      }
    } catch (e) {
      print(e.toString());
      return cartProducts!.length;
    }
    setBusy(false);
    notifyListeners();
    throw '';
  }

  void setCartLength() {
    int? tempCartLength;
    tempCartLength = _cartService.getProductLength();
    if (tempCartLength != 0) {
      _cartLength = tempCartLength;
    } else {
      _cartLength = 0;
    }
    // notifyListeners();
  }

  int? get getCartLength {
    setCartLength();
    return _cartLength;
  }
}
