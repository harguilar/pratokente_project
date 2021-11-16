import 'package:flutter/material.dart';
import 'package:pratokente/core/datamodels/cart/cart_product.dart';
import 'package:pratokente/core/datamodels/products/product_data.dart';
import 'package:pratokente/global/global.dart';
import 'package:pratokente/ui/products/get_product_by_merchant_viewModel.dart';

class SearchProducts extends SearchDelegate<ProductData?> {
  List<ProductData>? _productsList;
  final model = GetProductByMerchantViewModel();
  final _global = Global();
  SearchProducts(this._productsList);
  // final model = SearchDelegateViewModel();

  @override
  String get searchFieldLabel => 'Pesquisar por Nome';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    final productList = _productsList!.where((element) {
      return Global.removeDiacritics(element.name!)
              .toLowerCase()
              .contains(Global.removeDiacritics(query).toLowerCase()) ||
          Global.removeDiacritics(element.description!)
              .toLowerCase()
              .contains(Global.removeDiacritics(query).toLowerCase());
    });

    return productList.isEmpty
        ? Center(child: Text('Sua pesquisa não trouxe resultados!'))
        : ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              //final MerchantData result = merchantList[index];
              return Container(
                padding: EdgeInsets.symmetric(
                  vertical: 5.0,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Colors.grey[300]!),
                  ),
                ),
                height: 150,
                child: InkWell(
                  splashColor: Colors.blueGrey,
                  child: Stack(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            //padding: const EdgeInsets.only(top: 50.0),
                            margin: const EdgeInsets.only(top: 10.0),
                            height: 110.0,
                            width: 110.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(7.0),
                                topRight: Radius.circular(7.0),
                                bottomLeft: Radius.circular(7.0),
                                bottomRight: Radius.circular(7.0),
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      productList.elementAt(index).image!),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, top: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    productList
                                        .elementAt(index)
                                        .name!
                                        .toLowerCase(),
                                    style: TextStyle(
                                        fontFamily: "Sofia",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17.0,
                                        color: Colors.black87),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Expanded(
                                  child: Text(
                                    productList.elementAt(index).description!,
                                    style: TextStyle(
                                        fontFamily: "Sofia",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.black26),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  _global
                                      .formatPrice(
                                          productList.elementAt(index).price!)
                                      .toString(),
                                  style: TextStyle(
                                      fontFamily: "Sofia",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17.0,
                                      color: Colors.black87),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      size: 18.0,
                                      color: Colors.yellow,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 70.0, right: 20.0),
                          child: Container(
                            height: 30.0,
                            width: 70.0,
                            //  color: Color(0xFFF48522),
                            child: Center(
                              child: InkWell(
                                splashColor: Colors.deepPurple,
                                // width: double.maxFinite,
                                onTap: () {
                                  model.initializeCartProducts();
                                  CartProduct cartProduct = CartProduct(
                                      totalPrice: 0.0,
                                      products: productList.elementAt(index),
                                      quantity: 1,
                                      status: '1',
                                      userId: model.getUserId!,
                                      subtotal:
                                          productList.elementAt(index).price!,
                                      date: DateTime.now(),
                                      cartId: '');

                                  model.addCartItens(cartProduct: cartProduct);
                                },
                                child: Icon(
                                  Icons.add_shopping_cart,
                                  color: Color(0xFFF48522),
                                ),
                                //icon: Icon(Icons.shopping_cart),
                                //  color: Colors.blueGrey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildResults
    final productList = _productsList!.where((element) {
      return Global.removeDiacritics(element.name!)
              .toLowerCase()
              .contains(Global.removeDiacritics(query).toLowerCase()) ||
          Global.removeDiacritics(element.description!)
              .toLowerCase()
              .contains(Global.removeDiacritics(query).toLowerCase());
    });

    return productList.isEmpty
        ? Center(child: Text('Sua pesquisa não trouxe resultados!'))
        : ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              //final MerchantData result = merchantList[index];
              return Container(
                padding: EdgeInsets.symmetric(
                  vertical: 5.0,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Colors.grey[300]!),
                  ),
                ),
                height: 150,
                child: InkWell(
                  splashColor: Colors.blueGrey,
                  child: Stack(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            //padding: const EdgeInsets.only(top: 50.0),
                            margin: const EdgeInsets.only(top: 10.0),
                            height: 110.0,
                            width: 110.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(7.0),
                                topRight: Radius.circular(7.0),
                                bottomLeft: Radius.circular(7.0),
                                bottomRight: Radius.circular(7.0),
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      productList.elementAt(index).image!),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, top: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    productList
                                        .elementAt(index)
                                        .name!
                                        .toLowerCase(),
                                    style: TextStyle(
                                        fontFamily: "Sofia",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17.0,
                                        color: Colors.black87),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Expanded(
                                  child: Text(
                                    productList.elementAt(index).description!,
                                    style: TextStyle(
                                        fontFamily: "Sofia",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.black26),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  _global
                                      .formatPrice(
                                          productList.elementAt(index).price!)
                                      .toString(),
                                  style: TextStyle(
                                      fontFamily: "Sofia",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17.0,
                                      color: Colors.black87),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      size: 18.0,
                                      color: Colors.yellow,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 70.0, right: 20.0),
                          child: Container(
                            height: 30.0,
                            width: 70.0,
                            //  color: Color(0xFFF48522),
                            child: Center(
                              child: InkWell(
                                splashColor: Colors.deepPurple,
                                // width: double.maxFinite,
                                onTap: () {
                                  model.initializeCartProducts();
                                  CartProduct cartProduct = CartProduct(
                                    totalPrice: 0.0,
                                    products: productList.elementAt(index),
                                    quantity: 1,
                                    status: '1',
                                    userId: model.getUserId!,
                                    subtotal:
                                        productList.elementAt(index).price!,
                                    date: DateTime.now(),
                                    cartId: '',
                                  );
                                  model.addCartItens(cartProduct: cartProduct);
                                },
                                child: Icon(
                                  Icons.add_shopping_cart,
                                  color: Color(0xFFF48522),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
