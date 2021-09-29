import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pratokente/core/datamodels/cart/cart_product.dart';
import 'package:pratokente/global/global.dart';
import 'package:pratokente/ui/widgets/create_list_awareness.dart';
import 'package:pratokente/ui/widgets/notification_counter.dart';
import 'package:pratokente/ui/widgets/search_products.dart';
import 'package:pratokente_ui/pratokente_ui.dart';
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
        onModelReady: (model) =>
            SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
              model.listenToProducts();
            }),
        builder: (context, model, child) => model.getProductsData != null
            ? Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: kcOrangeColor,
                  title:
                      PratokenteText.headingThree(model.getMerchantData!.name!),
                  centerTitle: true,
                  actions: [
                    IconButton(
                        icon: NotificationCounter(
                          icon: SvgPicture.asset(
                            'assets/icon/cart_icon.svg',
                            width: 32,
                          ),
                          // counter:  Global.products.length > 0 ? Global.products.length : 0,
                          counter: model.getCartLength,
                        ),
                        onPressed: () {
                          model.navToCart();
                        })
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                  child: SingleChildScrollView(
                    child: Container(
                      child: ListView.builder(
                        key: PageStorageKey('products category'),
                        itemCount: model.getProductsData!.length,
                        padding: EdgeInsets.only(top: 10.0),
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (ctx, index) {
                          return CreationAwareListItem(
                            itemCreated: () {
                              // when the item is created we request more data when it's the 20th index
                              if (index % 10 == 0) {
                                model.requestMoreProducts();
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
                              //height: 150,
                              child: InkWell(
                                splashColor: Colors.blueGrey,
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 140.0,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          image: DecorationImage(
                                              image: NetworkImage((model
                                                  .getProductsData![index]
                                                  .image)!),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      verticalSpaceSmall,
                                      Container(
                                        child: PratokenteText.headingThree(model
                                            .getProductsData![index].name!),
                                      ),
                                      verticalSpaceSmall,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          PratokenteText.body(
                                            _global
                                                .formatPrice(model
                                                    .getProductsData![index]
                                                    .price!)
                                                .toString(),
                                          ),
                                          horizontalSpaceSmall,
                                          Expanded(
                                            child: PratokenteText.body(model
                                                .getProductsData![index]
                                                .category!),
                                          ),
                                          horizontalSpaceSmall,
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          /*                          Expanded(
                                            child: PratokenteText.body(
                                              model.getProductsData![index]
                                                  .description!,
                                            ),
                                          ), */
                                          // horizontalSpaceSmall,
/*                                           Icon(
                                            Icons.star,
                                            size: 18.0,
                                            color: Colors.yellow,
                                          ), */
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                          height: 30.0,
                                          width: 70.0,
                                          child: Center(
                                            child: InkWell(
                                              splashColor: Colors.deepPurple,
                                              // width: double.maxFinite,
                                              onTap: () {
                                                model.initializeCartProducts();
                                                model.addCartItens(
                                                  cartProduct: CartProduct(
                                                    totalPrice: 0.0,
                                                    products:
                                                        model.getProductsData![
                                                            index],
                                                    quantity: 1,
                                                    status: '1',
                                                    userId: model.getUserId!,
                                                    subtotal: model
                                                        .getProductsData![index]
                                                        .price!,
                                                    date: DateTime.now(),
                                                  ),
                                                );
                                              },
                                              child: Icon(
                                                  Icons.add_shopping_cart,
                                                  color: kcOrangeColor),
                                              //icon: Icon(Icons.shopping_cart),
                                              //  color: Colors.blueGrey,
                                            ),
                                          ),
                                        ),
                                      ),
                                      //  verticalSpaceSmall,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  backgroundColor: kcOrangeColor,
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
                    progressColor: kcOrangeColor,
                    center: Text("100%"),
                  ),
                ),
              ),
        viewModelBuilder: () => GetProductByMerchantViewModel());
  }
}
