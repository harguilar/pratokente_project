import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pratokente/core/datamodels/cart/cart_product.dart';
import 'package:pratokente/global/global.dart';
import 'package:pratokente/ui/widgets/notification_counter.dart';
import 'package:pratokente_ui/pratokente_ui.dart';
import 'package:stacked/stacked.dart';
import 'cart_viewModel.dart';

// ignore: must_be_immutable
class CartView extends StatelessWidget {
  CartProduct? cartProduct;
  @override
  Widget build(BuildContext context) {
    final _global = Global();

    return ViewModelBuilder<CartViewModel>.reactive(
      viewModelBuilder: () => CartViewModel(),
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      onModelReady: (model) =>
          SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
        model.initializeCartProducts();
      }),
      builder: (context, model, child) => model.getCartLength != 0
          ? Scaffold(
              appBar: AppBar(
                title: Text(
                  'Carrinho de Compras',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  IconButton(
                    icon: NotificationCounter(
                      icon: SvgPicture.asset(
                        'assets/icon/cart_icon.svg',
                        width: 32,
                      ),
                      counter: model.getCartLength,
                    ),
                    onPressed: () {},
                  )
                ],
                leading: true
                    ? IconButton(
                        onPressed: () {
                          model.navToListOfMerchants();
                          /*        Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        GetMerchantView())); */
                        },
                        icon: Icon(Icons.arrow_back),
                      )
                    : SizedBox.shrink(),
                centerTitle: true,
                backgroundColor: Colors.orange,
              ),
              body: model.isBusy
                  ? Center(child: CircularProgressIndicator())
                  : model.getCartOfListProducts == null ||
                          model.getCartOfListProducts.length == 0
                      ? Center(
                          child: Text(
                            "Nenhum produto no carrinho",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : Column(
                          children: [
                            verticalSpaceSmall,
                            Expanded(
                              child: ListView.builder(
                                itemCount: model.getCartOfListProducts.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            width: 1.0,
                                            color: Colors.grey[300]!),
                                      ),
                                    ),
                                    child: Dismissible(
                                      direction: DismissDirection.endToStart,
                                      background: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: SvgPicture.asset(
                                              "assets/icon/trash_icon.svg"),
                                        ),
                                      ),
                                      key: UniqueKey(),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(7.0),
                                                topRight: Radius.circular(7.0),
                                                bottomLeft:
                                                    Radius.circular(7.0),
                                                bottomRight:
                                                    Radius.circular(7.0),
                                              ),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    model
                                                        .getCartOfListProducts[
                                                            index]
                                                        .products
                                                        .image
                                                        .toString(),
                                                  ),
                                                  fit: BoxFit.cover),
                                            ),
                                            margin: const EdgeInsets.all(10.0),
                                            height: 110.0,
                                            width: 110.0,
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      PratokenteText.body(
                                                        model
                                                            .getCartOfListProducts[
                                                                index]
                                                            .products
                                                            .name!,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 20),
                                                        child:
                                                            PratokenteText.body(
                                                          model
                                                              .getCartOfListProducts[
                                                                  index]
                                                              .quantity
                                                              .toString(),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  horizontalSpaceSmall,
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child:
                                                            PratokenteText.body(
                                                          model
                                                              .getCartOfListProducts[
                                                                  index]
                                                              .products
                                                              .description!
                                                              .toString(),
                                                        ),
                                                      ),
                                                      IconButton(
                                                          icon: Icon(Icons.add),
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          onPressed: () {
                                                            model.incProduct(
                                                                model.getCartOfListProducts[
                                                                    index]);
                                                          }),
                                                    ],
                                                  ),
                                                  horizontalSpaceSmall,
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      PratokenteText.body(
                                                        _global
                                                            .formatPrice(model
                                                                .getCartOfListProducts[
                                                                    index]
                                                                .products
                                                                .price!)
                                                            .toString(),
                                                      ),
                                                      IconButton(
                                                          icon: Icon(
                                                              Icons.remove),
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          onPressed: () {
                                                            model.decProduct(
                                                                model.getCartOfListProducts[
                                                                    index]);
                                                          }),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      onDismissed: (direction) {
                                        model.removeCartItem(
                                            model.getCartOfListProducts[index]);
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Total do Carrinho",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal)),
                                    Divider(),

                                    /// Subtotal
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Subtotal: "),
                                        Text(_global
                                            .formatPrice(model.getSubTotal())
                                            .toString()),
                                      ],
                                    ),
                                    Divider(),

                                    /// Shipping
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Entrega"),
                                        Text(_global
                                            .formatPrice(model.getDelivery())
                                            .toString()),
                                      ],
                                    ),
                                    Divider(
                                      height: 25,
                                      color: Colors.black,
                                    ),

                                    /// Total
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Total: ",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                            _global
                                                .formatPrice(model.getTotal())
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal,
                                                color: Theme.of(context)
                                                    .primaryColor)),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    InkWell(
                                      onTap: () {
                                        model.requestOrder(
                                          total: model.getTotal(),
                                          cartProducts:
                                              model.getCartOfListProducts,
                                          subTotal: model.getSubTotal(),
                                        );
                                        model.navToListOfMerchants();
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: Container(
                                          height: 40.0,
                                          width: 120.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF48522),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Proceed",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Sans",
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
            )
          : Container(
              child: Center(
                child: Text(
                  "Nenhum produto no carrinho",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
    );
  }
}
