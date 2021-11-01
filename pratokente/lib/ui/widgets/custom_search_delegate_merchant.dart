import 'package:flutter/material.dart';
import 'package:pratokente/core/datamodels/merchants/merchant_data.dart';
import 'package:pratokente/global/global.dart';
import 'package:pratokente/ui/merchant/merchant_viewModel.dart';

class CustomSearchDelegateMerchant extends SearchDelegate<MerchantData?> {
  // final Stream<List<ProductData>> products;
  List<MerchantData> _merchantList;
  //final model = MerchantsViewModel();
  CustomSearchDelegateMerchant(this._merchantList);
  // final model = SearchDelegateViewModel();

  @override
  String get searchFieldLabel => 'Pesquisar por Nome';

  // CustomSearchDelegateMerchant(this.products);

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
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
    // TODO: implement buildLeading
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    final merchantList = query.isNotEmpty
        ? _merchantList
        : _merchantList
            .where((element) => Global.removeDiacritics(element.name!)
                .toLowerCase()
                .startsWith(Global.removeDiacritics(query).toLowerCase()))
            .toList();

    return merchantList.isEmpty
        ? Center(child: Text('Sua pesquisa não trouxe resultados!'))
        : ListView.builder(
            itemCount: merchantList.length,
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
                                      merchantList.elementAt(index).image!),
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
                                    merchantList
                                        .elementAt(index)
                                        .name
                                        .toString(),
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
/*
                                Expanded(
                                  child: Text(
                                    merchantList
                                                .elementAt(index)
                                                .openningTimes!
                                                .hour <
                                            12
                                        ? merchantList
                                                .elementAt(index)
                                                .openningTimes!
                                                .minute
                                                .toString() +
                                            " AM"
                                        : merchantList
                                                .elementAt(index)
                                                .openningTimes!
                                                .hour
                                                .toString() +
                                            ":" +
                                            merchantList
                                                .elementAt(index)
                                                .openningTimes!
                                                .minute
                                                .toString() +
                                            " PM",
                                    style: kcProductNameBody,
                                  ),
                                ),
                                */
                                SizedBox(
                                  height: 10.0,
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
                                  showResults(context);
                                },
                                child: Text(
                                  'Book Now',
                                  style: TextStyle(
                                      fontFamily: "Sofia",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.0,
                                      color: Colors.orange),
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
                  onTap: () {
                    showResults(context);
/*                  model.setMerchants(merchantData: model.getMerchantData[index]);
                  model.navToProductByMerchant();
                  print("Harguilar Nhanga " +model.getMerchantData[index].name.toLowerCase().toString());*/
                  },
                ),
              );
            },
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final merchantList = _merchantList.where((element) {
      return Global.removeDiacritics(element.name!)
              .toLowerCase()
              .contains(Global.removeDiacritics(query).toLowerCase()) ||
          Global.removeDiacritics(element.name!)
              .toLowerCase()
              .contains(Global.removeDiacritics(query).toLowerCase());
    });
    return merchantList.isEmpty
        ? Center(child: Text('Sua pesquisa não trouxe resultados!'))
        : ListView.builder(
            itemCount: merchantList.length,
            itemBuilder: (context, index) {
              //  return ListTile(title:Text(merchantList.elementAt(index).name));
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
                                      merchantList.elementAt(index).image!),
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
                                    merchantList
                                        .elementAt(index)
                                        .name
                                        .toString(),
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
/*
                                Expanded(
                                  child: Text(
                                    merchantList
                                                .elementAt(index)
                                                .openningTimes!
                                                .hour <
                                            12
                                        ? merchantList
                                                .elementAt(index)
                                                .openningTimes!
                                                .minute
                                                .toString() +
                                            " AM"
                                        : merchantList
                                                .elementAt(index)
                                                .openningTimes!
                                                .hour
                                                .toString() +
                                            ":" +
                                            merchantList
                                                .elementAt(index)
                                                .openningTimes!
                                                .minute
                                                .toString() +
                                            " PM",
                                    style: kcProductNameBody,
                                  ),
                                ),
                                */
                                SizedBox(
                                  height: 10.0,
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
                                  if (merchantList.isNotEmpty) {
/*                                     model.setMerchants(
                                        merchantData:
                                            merchantList.elementAt(index)); */
/*                                     Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BookView())); */
                                  }
                                },
                                child: Text(
                                  'Book Now',
                                  style: TextStyle(
                                      fontFamily: "Sofia",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.0,
                                      color: Colors.orange),
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
                  onTap: () {
                    //showResults(context);
/*                     model.setMerchants(
                        merchantData: merchantList.elementAt(index)); */
                    // model.navToProductByMerchant();
                    print("Harguilar Nhanga " +
                        merchantList
                            .elementAt(index)
                            .name!
                            .toLowerCase()
                            .toString());
                  },
                ),
              );
            },
          );
  }
}
