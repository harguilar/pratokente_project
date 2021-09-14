import 'package:flutter/material.dart';
import 'package:pratokente/ui/widgets/create_list_awareness.dart';
import 'package:pratokente/ui/widgets/custom_search_delegate_merchant.dart';
import 'package:stacked/stacked.dart';
import 'merchant_viewModel.dart';

class MerchantView extends StatelessWidget {
  MerchantView({Key? key});

  @override
  Widget build(BuildContext context) {
    // final _global = Global();

    return ViewModelBuilder<MerchantsViewModel>.reactive(
        disposeViewModel: false,
        //initialiseSpecialViewModelsOnce: true,
        //Indicates if the onModelReady should fire every time the model is inserted into the widget tree
        // fireOnModelReadyOnce: true,
        onModelReady: (model) => model.listenToMerchants(),
        builder: (context, model, child) => model.getMerchants != null
            ? Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.orange,
                  title: Text('Lista de Restaurantes'),
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
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          // child: container(context),
                        ),
                        Container(
                          child: ListView.builder(
                            // controller: model.scrollController,
                            key: PageStorageKey('Merchants'),
                            itemCount: model.getMerchants!.length,
                            padding: EdgeInsets.only(top: 10.0),
                            shrinkWrap: true,
                            primary: false,
                            itemBuilder: (ctx, index) {
                              return CreationAwareListItem(
                                itemCreated: () {
                                  // when the item is created we request more data when it's the 20th index
                                  if (index % 10 == 0) {
                                    model.requestMoreMerchants();
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
                                                    image: NetworkImage(model
                                                        .getMerchants![index]
                                                        .image!),
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
                                                      model.getMerchants![index]
                                                          .name
                                                          .toString(),
                                                      // style: kcProductNameBody,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons.location_on,
                                                          size: 18.0,
                                                          color: Colors.black12,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10.0,
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
                                                    model.navToBookView();
                                                  },
                                                  child: Text(
                                                    'Book Now',
                                                    // style: kcMediumBody,
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
                                    onTap: () {},
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
              )
            : Container(
                child: Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Colors.orange,
                )),
              ),
        viewModelBuilder: () =>
            MerchantsViewModel(height: MediaQuery.of(context).size.height));
  }
}
