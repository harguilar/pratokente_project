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
  List<CartProduct>? products = [];
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
    products = _cartService.getProductList;
    //print('Testing the Line \n');
    setBusy(false);
    notifyListeners();
  }

  Future fetchProduct() async {
    //scrollController.addListener(scrollControllerCallFunction);
    setBusy(true);
    await _productService.fetchAllProducts();
    _productsData = _productService.getProducts;
    setBusy(false);
    notifyListeners();
  }

  void addCartItens({required CartProduct cartProduct}) {
    setBusy(true);

    //final cartInDatabase = _productInCart(cartProduct.id);
    if ((products != null) && (products!.length > 0)) {
      //IF PRODUCT ALREADY IN CART INCREMENT QUANTITY
      for (int count = 0; count < products!.length; count++) {
        if (cartProduct.products!.id == products![count].products!.id) {
          //increment 1 in quantity
          //if (products![count].quantity != null) {

          // products![count].quantity = products![count].quantity! + 1;
          quantity = products![count].quantity! + 1;

          //}
          subtotal = products![count].quantity! * cartProduct.products!.price!;
          /*    
              products![count].subtotal =
              products![count].quantity! * cartProduct.products!.price!; 
          */

          CartProduct tempCartProducts = CartProduct(
              userId: products![count].userId,
              quantity: quantity,
              subtotal: subtotal,
              cartId: products![count].cartId,
              products: products![count].products,
              status: products![count].status,
              date: products![count].date);

          //products.add(cartProduct);
          checkItemInCart = true;
          //tempCart = products![count];
          tempCart = tempCartProducts;
          break;
        }
      }
      if (checkItemInCart == false) {
/*                 cartProduct.subtotal =
            cartProduct.products!.price! * cartProduct.quantity!; */
        subtotal = cartProduct.products!.price! * cartProduct.quantity!;

        CartProduct tempCartProducts = CartProduct(
            userId: cartProduct.userId,
            quantity: cartProduct.quantity,
            subtotal: subtotal,
            cartId: cartProduct.cartId,
            products: cartProduct.products,
            status: cartProduct.status,
            date: cartProduct.date);

        products!.add(tempCartProducts);

        _cartService.addCartItem(
            cartProduct: cartProduct, userId: _currentUser.getCurrentUser.id);
      } else {
        // Trabalhar no UPdate
        _cartService.updateCart(
          cartProduct: tempCart!,
          userId: _currentUser.getCurrentUser.id,
        );
        checkItemInCart = false;
      }
    } else {
      //Add the Product to Cart List
      subtotal = cartProduct.products!.price! * cartProduct.quantity!;

      CartProduct tempCartProducts = CartProduct(
          userId: cartProduct.userId,
          quantity: cartProduct.quantity,
          subtotal: subtotal,
          cartId: cartProduct.cartId,
          products: cartProduct.products,
          status: cartProduct.status,
          date: cartProduct.date);

      productsTmp.add(tempCartProducts);
      // products.add(cartProduct);

      products = productsTmp;
      print('The Product Lenght is : ' + products!.length.toString());
      print("Look The code Above. ");
      _cartService.addCartItem(
          cartProduct: cartProduct, userId: _currentUser.getCurrentUser.id);
    }
    setBusy(false);
    //now notify listernsš
    notifyListeners();
    //_navigationService.navigateTo(CartRoute);
  }

  void navToCart() {
    //_navigationService.navigateTo(Routes.cartView);
  }

  int getProductLength() {
    setBusy(true);
    try {
      if (products == null) {
        return 0;
      } else if (products!.length == 0) {
        return 0;
      } else if (products!.length > 0) {
        return products!.length;
      }
    } catch (e) {
      print(e.toString());
      return products!.length;
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
