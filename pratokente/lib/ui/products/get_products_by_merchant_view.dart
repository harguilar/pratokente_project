import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pratokente/core/datamodels/cart/cart_product.dart';
import 'package:pratokente/global/global.dart';
import 'package:pratokente/ui/widgets/create_list_awareness.dart';
import 'package:pratokente/ui/widgets/notification_counter.dart';
import 'package:pratokente/ui/widgets/search_products.dart';
import 'package:stacked/stacked.dart';
import 'get_product_by_merchant_viewModel.dart';

class GetProuctByMerchantView extends StatelessWidget {
  GetProuctByMerchantView({Key? key});

  @override
  Widget build(BuildContext context) {
    final _global = Global();

    return ViewModelBuilder<GetProductByMerchantViewModel>.reactive(
        disposeViewModel: false,
        initialiseSpecialViewModelsOnce: true,
        onModelReady: (model) => model.fetchProduct(),
        builder: (context, model, child) => model.getProductsData != null
            ? Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.orange,
                  title: Text(model.getMerchantData!.name.toString()),
                  centerTitle: true,
                  actions: [
                    IconButton(
                        icon: NotificationCounter(
                          icon: SvgPicture.asset(
                            'assets/icon/cart_icon.svg',
                            width: 32,
                          ),
                          counter: model.getCartLength,
                        ),
                        onPressed: () {
                          model.navToCart();
                          // Route route = MaterialPageRoute(builder: (context) => CartView());
                          //Navigator.pushReplacement(context, route)/*.then(Global.products.length)*/;

                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>CartView()));
                        })
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          //child: container(context),
                        ),
                        Container(
                          child: ListView.builder(
                            key: PageStorageKey('products category'),
                            itemCount: model.getProductsData!.length,
                            padding: EdgeInsets.only(top: 10.0),
                            shrinkWrap: true,
                            primary: false,
                            itemBuilder: (ctx, index) {
                              return CreationAwareListItem(
                                itemCreated: () {
                                  if (index % 10 == 0) {
                                    if (model.getHasMoreProducts) {
                                      print(
                                          "we are Inside Here Harguilar $index:" +
                                              model.getHasMoreProducts
                                                  .toString());
                                      SchedulerBinding.instance
                                          ?.addPostFrameCallback((timeStamp) {
                                        model.fetchProduct();
                                      });
                                    }
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5.0,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.grey[300]!),
                                    ),
                                  ),
                                  height: 150,
                                  child: InkWell(
                                    splashColor: Colors.blueGrey,
                                    child: Stack(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              //padding: const EdgeInsets.only(top: 50.0),
                                              margin: const EdgeInsets.only(
                                                  top: 10.0),
                                              height: 110.0,
                                              width: 110.0,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(7.0),
                                                  topRight:
                                                      Radius.circular(7.0),
                                                  bottomLeft:
                                                      Radius.circular(7.0),
                                                  bottomRight:
                                                      Radius.circular(7.0),
                                                ),
                                                image: DecorationImage(
                                                    image:
                                                        CachedNetworkImageProvider(
                                                            model
                                                                .getProductsData![
                                                                    index]
                                                                .image!
                                                                .toString()),
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0, top: 10.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Text(
                                                      model
                                                          .getProductsData![
                                                              index]
                                                          .name!
                                                          .toLowerCase(),
                                                      style: TextStyle(
                                                          fontFamily: "Sofia",
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 17.0,
                                                          color:
                                                              Colors.black87),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      model
                                                          .getProductsData![
                                                              index]
                                                          .description!,
                                                      style: TextStyle(
                                                          fontFamily: "Sofia",
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 15.0,
                                                          color:
                                                              Colors.black26),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Text(
                                                    _global
                                                        .formatPrice(model
                                                            .getProductsData![
                                                                index]
                                                            .price!)
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontFamily: "Sofia",
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 17.0,
                                                        color: Colors.black87),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
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
                                            padding: const EdgeInsets.only(
                                                top: 70.0, right: 20.0),
                                            child: Container(
                                              height: 30.0,
                                              width: 70.0,
                                              //  color: Color(0xFFF48522),
                                              child: Center(
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.deepPurple,
                                                  // width: double.maxFinite,
                                                  onTap: () {
                                                    model
                                                        .initializeCartProducts();

                                                    final cartProduct = CartProduct(
                                                        totalPrice: 0.0,
                                                        userId:
                                                            model.getUserId!,
                                                        quantity: 1,
                                                        subtotal: model
                                                            .getProductsData![
                                                                index]
                                                            .price!,
                                                        cartId: "xxxxxxxxx",
                                                        products: model
                                                                .getProductsData![
                                                            index],
                                                        status: "1",
                                                        date: DateTime.now());

                                                    model.addCartItens(
                                                        cartProduct:
                                                            cartProduct);
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
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.search),
                  onPressed: () {
                    showSearch(
                        context: context,
                        delegate: SearchProducts(model.getProductsData));
                  },
                ),
              )
            : Container(
                child: Center(
                  child: CircularPercentIndicator(
                    radius: 120,
                    lineWidth: 15.0,
                    animation: true,
                    percent: 1.0,
                    progressColor: Color(0xFFF48522),
                    center: Text("100%"),
                  ),
                ),
              ),
        viewModelBuilder: () => GetProductByMerchantViewModel());
  }
}
