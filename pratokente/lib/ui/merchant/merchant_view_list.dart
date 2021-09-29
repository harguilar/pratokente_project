import 'package:flutter/material.dart';
import 'package:pratokente/ui/widgets/custom_search_delegate_merchant.dart';
import 'package:pratokente_ui/pratokente_ui.dart';
import 'package:stacked/stacked.dart';
import 'merchant_viewModel.dart';

class MerchantViewList extends StatefulWidget {
  @override
  _MerchantViewListState createState() => _MerchantViewListState();
}

class _MerchantViewListState extends State<MerchantViewList> {
  final scrollController = ScrollController;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MerchantsViewModel>.reactive(
        onModelReady: (model) => model.fetchMerchants(),
        builder: (BuildContext, model, child) => model.getMerchants != null
            ? Scaffold(
                appBar: AppBar(
                  backgroundColor: kcOrangeColor,
                  title: PratokenteText.headingThree('Lista de Vendedores'),
                  centerTitle: true,
                  actions: [
                    IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          showSearch(
                              context: context,
                              delegate: CustomSearchDelegateMerchant(
                                  model.getMerchants!));
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
                        itemCount: model.getMerchants!.length,
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
                                              image: NetworkImage((model
                                                  .getMerchants![index]
                                                  .image)!),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      verticalSpaceSmall,
                                      Container(
                                        child: PratokenteText.headingThree(
                                            model.getMerchants![index].name!),
                                      ),
                                      verticalSpaceSmall,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          /*         PratokenteText.body(
                                            _global
                                                .formatPrice(model
                                                    .getProductsData![index]
                                                    .price!)
                                                .toString(),
                                          ), */
                                          horizontalSpaceSmall,
                                          /*                                         Expanded(
                                            child: PratokenteText.body(model
                                                .getProductsData![index]
                                                .category!),
                                          ), */
                                          horizontalSpaceSmall,
                                        ],
                                      ),
                                      verticalSpaceSmall,
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: InkWell(
                                          splashColor: Colors.deepPurple,
                                          // width: double.maxFinite,
                                          onTap: () {
                                            model.navToBookView(
                                                merchantData:
                                                    model.getMerchants![index]);
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
                                    model.setToMerchants(
                                        merchantData:
                                            model.getMerchants![index]);
                                    model.navToProductByMerchant();
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
        viewModelBuilder: () =>
            MerchantsViewModel(height: MediaQuery.of(context).size.height));
  }
}