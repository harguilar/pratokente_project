import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pratokente/ui/widgets/notification_counter.dart';
import 'package:pratokente_ui/pratokente_ui.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'products_viewmodel.dart';

class ProductView extends StatefulWidget {
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final scrollController = ScrollController;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductsViewModel>.reactive(
        onModelReady: (model) => model.fetchProducts(),
        builder: (BuildContext, model, child) => model.getProducts != null
            ? Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: kcOrangeColor,
                  title:
                      PratokenteText.headingThree(model.getMerchantData!.name),
                  centerTitle: true,
                  actions: [
                    IconButton(
                        icon: NotificationCounter(
                          icon: SvgPicture.asset(
                            'assets/icon/cart_icon.svg',
                            width: 32,
                          ),
                          // counter:  Global.products.length > 0 ? Global.products.length : 0,
                          //counter: model.getCartLength,
                        ),
                        onPressed: () {
                          // model.navToCart();
                        })
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                  child: SingleChildScrollView(
                    child: Container(
                      child: ListView.builder(
                        controller: model.scrollController,
                        key: PageStorageKey('products category'),
                        itemCount: model.getProducts!.length,
                        padding: EdgeInsets.only(top: 10.0),
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (ctx, index) {
                          return Container(
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
                                child: InkWell(
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
                                              image: CachedNetworkImageProvider(
                                                  model.getProducts![index]
                                                      .toString()),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      verticalSpaceSmall,
                                      Container(
                                        child: PratokenteText.headingThree(
                                            model.getProducts![index].name!),
                                      ),
                                      verticalSpaceSmall,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          PratokenteText.body(
                                            model.getProducts![index].category
                                                .toString(),
                                          ),
                                          horizontalSpaceRegular,
                                          PratokenteText.body(model
                                              .getProducts![index].price
                                              .toString()),
                                          horizontalSpaceRegular,
                                          PratokenteText.body(
                                            model.getProducts![index]
                                                .description!,
                                          ),
                                        ],
                                      ),
                                      verticalSpaceSmall,
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: InkWell(
                                          splashColor: Colors.deepPurple,
                                          // width: double.maxFinite,
                                          onTap: () {
                                            model.getProducts![index];
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 26.0),
                                            child: PratokenteText.book(
                                              'Book Now',
                                              // style: kcMediumBody,
                                            ),
                                          ),
                                          //icon: Icon(Icons.shopping_cart),
                                          //  color: Colors.blueGrey,
                                        ),
                                      ),
                                      //  verticalSpaceSmall,
                                    ],
                                  ),
                                  onTap: () {
                                    /*  model.setToMerchants(
                                        merchantData:
                                            model.getProducts![index]);
                                    model.navToProductByMerchant(); */
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              )
            : Container(
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.orange,
                  ),
                ),
              ),
        viewModelBuilder: () => ProductsViewModel(
            height: MediaQuery.of(context).size.height,
            scrollController: scrollController));
  }
}
