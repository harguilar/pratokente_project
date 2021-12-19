import 'package:pratokente/app/app.locator.dart';
import 'package:pratokente/app/app.logger.dart';
import 'package:pratokente/app/app.router.dart';
import 'package:pratokente/core/datamodels/cart/cart_product.dart';
import 'package:pratokente/core/datamodels/merchants/merchant_data.dart';
import 'package:pratokente/core/datamodels/products/product_data.dart';
import 'package:pratokente/core/services/cart/cart_service.dart';
import 'package:pratokente/core/services/users/users_services.dart';
import 'package:pratokente/core/services/products/product_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class GetProductByMerchantViewModel extends BaseViewModel {
  final ProductService _productService = locator<ProductService>();
  final _navigationService = locator<NavigationService>();
  final logger = getLogger('GetProductByMerchantViewModel');
  final _currentUser = locator<UserService>();
  final CartService _cartService = locator<CartService>();

  List<CartProduct>? cartProducts = [];
  List<ProductData>? _productsData = [];
  CartProduct? tempCart;

  int quantity = 0;
  double? subtotal;
  int? _cartLength;
  bool checkItemInCart = false;

  String? get getUserId => _currentUser.getCurrentUser.id;

  bool get getHasMoreProducts => _productService.hasMoreProducts;
  List<ProductData>? get getProductsData => _productsData!;
  MerchantData? get getMerchantData => _productService.getMerchantData!;

  get getCartDocumentId => _cartService.getCartDocumentIdRef;

  initializeCartProducts() {
    setBusy(true);
    //products = Global.products!;
    cartProducts = _cartService.getCartOfListProducts;
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
      for (CartProduct productsInCart in cartProducts!) {
        if (productsInCart.products.id == cartProduct.products.id) {
          checkItemInCart = true;
          //Increment Quantity
          quantity += productsInCart.quantity + 1;
          //Calculate SubTotal
          subtotal = calculateSubTotal(
              price: cartProduct.products.price!, quantity: quantity);

          tempCart = CartProduct(
              userId: productsInCart.userId,
              quantity: quantity,
              subtotal: subtotal!,
              cartId: productsInCart.cartId,
              products: productsInCart.products,
              status: productsInCart.status,
              date: productsInCart.date,
              totalPrice: 0.0);
          break;
        }
      }
      if (!checkItemInCart) {
        //You have Itens in The Carts with Different Ids-. Add New Item
        subtotal = calculateSubTotal(
            price: cartProduct.products.price!, quantity: quantity);
        addProductsToCartProducts(
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

        _cartService.addCartItem(cartProduct: cartProduct);
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
      addProductsToCartProducts(
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

      _cartService.addCartItem(cartProduct: cartProduct);
    }
    //now notify listernsš
    notifyListeners();
    //_navigationService.navigateTo(CartRoute);
  }

  void addProductsToCartProducts({required CartProduct cartProduct}) {
    cartProducts!.add(cartProduct);
  }

  void navToCart() {
    _navigationService.navigateTo(Routes.cartView);
  }

  double? calculateSubTotal({required double price, required int quantity}) {
    return price * quantity;
  }

  int? getProductLength() {
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
    notifyListeners();
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
