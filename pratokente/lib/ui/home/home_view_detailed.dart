/* import 'package:flutter/material.dart';
import 'package:pratokente/core/datamodels/breakfast_data.dart';
import 'package:pratokente/core/datamodels/dinner.dart';
import 'package:pratokente/core/datamodels/discover_newPlaceHome_data.dart';
import 'package:pratokente/core/datamodels/lunch.dart';
import 'package:pratokente/ui/category_view/detail_category/restaurant_view.dart';
//import 'package:pratokente/ui/views/category_view/detail_category/restaurant_view.dart';
//import 'package:pratokente/ui/views/home/food_detail_view.dart';
import 'package:pratokente/ui/widgets/breakfast.dart';
import 'package:pratokente/ui/widgets/carousel.dart';
import 'package:pratokente/ui/widgets/categories.dart';
//import 'package:pratokente/ui/widgets/custom_search_delegate.dart';
import 'package:pratokente/ui/widgets/dinner.dart';
import 'package:pratokente/ui/widgets/lunch.dart';
import 'food_detail_view.dart';
//import 'component_home_view/app_bar_gradient.dart';

class HomeViewDetailed extends StatelessWidget {
  HomeViewDetailed({Key? key}) : super(key: key);
  //Harguilar Commented This out

  //get model => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Home',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                carousel(context),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Conheça Novos Lugares",
                    style: TextStyle(
                        fontFamily: "Sofia",
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 320.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (ctx, index) {
                      return card(discoverArray[index]);
                    },
                    itemCount: discoverArray.length,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Categoria de Comidas",
                        style: TextStyle(
                            fontFamily: "Sofia",
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700),
                      ),
                      InkWell(
                        child: Text(
                          "Ver tudo",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            fontFamily: "Sofia",
                          ),
                        ),
                        onTap: () {
                          /*
                          showSearch(
                            context: context,
                            /*delegate: CustomSearchDelegate(

                               // model.getFeaturedProducts(),
                              ),*/
                          );*/
                          /*showSearch(
                            context: context,
                            delegate: CustomSearchDelegate(
                                model.getFeaturedProducts())
                        );*/
                        },
                      )
                    ],
                  ),
                ),
/*                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: category(),
                ),*/
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        category(image: "category5.jpg", name: "Caseira"),
                        category(image: "category7.jpg", name: "Restaurante"),
                        category(image: "category6.jpg", name: "Rua"),
                        category(
                            image: "category3.jpg", name: "Catering Service"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                SizedBox(
                  height: 25.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Pequeno Almoço",
                        style: TextStyle(
                            fontFamily: "Sofia",
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700),
                      ),
                      InkWell(
                        splashColor: Colors.orangeAccent,
                        onTap: () {
                          // showSearch(
                          // context: context,
                          /*delegate: CustomSearchDelegate(

                                model.getFeaturedProducts(),
                              ),*/
                          //);
                          // model.getFeaturedProducts();
                        },
                        child: Text(
                          "Ver tudo",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            fontFamily: "Sofia",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                breakfast(context),
                SizedBox(
                  height: 25.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Almoço",
                        style: TextStyle(
                            fontFamily: "Sofia",
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700),
                      ),
                      InkWell(
                        child: Text(
                          "Ver tudo",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            fontFamily: "Sofia",
                          ),
                        ),
                        onTap: () {
                          /*
                          showSearch(
                            context: context,
                            /*delegate: CustomSearchDelegate(

                               // model.getFeaturedProducts(),
                              ),*/
                          );*/
                          /*showSearch(
                            context: context,
                            delegate: CustomSearchDelegate(
                                model.getFeaturedProducts())
                        );*/
                        },
                      )
                    ],
                  ),
                ),
                lunchWidget(context),
                SizedBox(
                  height: 25.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Jantar",
                          style: TextStyle(
                              fontFamily: "Sofia",
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700),
                        ),
                        FlatButton(
                          child: Text(
                            "Ver tudo",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              fontFamily: "Sofia",
                            ),
                          ),
                          onPressed: () {
                            //Harguilar Commented This out

/*                             showSearch(
                              context: context,
                              delegate: CustomSearchDelegate(
                                model.getFeaturedProducts(),
                              ),
                            ); */
                            /*showSearch(
                            context: context,
                            delegate: CustomSearchDelegate(
                                model.getFeaturedProducts())
                        );*/
                          },
                        )
                      ]),
                ),
                dinnerWidget(context),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),

          /// Get a class AppbarGradient
          /// This is a Appbar in HomeScreenT2 activity
          /// //Harguilar
          //AppbarGradient(),
        ],
      ),
    );
  }
}

class card extends StatelessWidget {
  discover _discover;
  card(this._discover);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: (_, __, ___) => new FoodDetailView(
              title: _discover.title!,
              id: _discover.id!,
              image: _discover.image!,
              location: _discover.location!,
              price: _discover.price!,
            ),
            transitionDuration: Duration(milliseconds: 600),
            transitionsBuilder:
                (_, Animation<double> animation, __, Widget child) {
              return Opacity(
                opacity: animation.value,
                child: child,
              );
            },
          ));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: 'hero-tag-${_discover.id}',
              child: Material(
                child: Container(
                  height: 200.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(_discover.image!),
                          fit: BoxFit.cover),
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5.0,
                            color: Colors.black12.withOpacity(0.1),
                            spreadRadius: 2.0)
                      ]),
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              width: 160.0,
              child: Text(
                _discover.title!,
                style: TextStyle(
                    fontFamily: "Sofia",
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                    color: Colors.black87),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 2.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  size: 15.0,
                  color: Colors.black12,
                ),
                Text(
                  _discover.location!,
                  style: TextStyle(
                      fontFamily: "Sofia",
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      color: Colors.black26),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.star,
                  size: 18.0,
                  color: Colors.yellow,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Text(
                    _discover.ratting!,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: "Sofia",
                        fontSize: 13.0),
                  ),
                ),
                SizedBox(
                  width: 35.0,
                ),
                Container(
                  height: 23.0,
                  width: 79.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFF48522),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Free Delivery",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 10.0),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class cardFood extends StatelessWidget {
  Color? colorTop, colorBottom;
  String? image, name, place;
  cardFood(
      {this.colorTop, this.colorBottom, this.name, this.image, this.place});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => RestaurantView(
                    name: name!,
                  ),
                ),
              );
            },
            child: Material(
              child: Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(blurRadius: 8.0, color: Colors.black12)
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  gradient: LinearGradient(
                      colors: [colorTop!, colorBottom!],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      image!,
                      height: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              name!,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Sofia",
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              place!,
              style: TextStyle(
                  color: Colors.black12,
                  fontFamily: "Sofia",
                  fontSize: 13.0,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class cardBreakfast extends StatelessWidget {
  cardBreakfast(this._breakFast);

  breakFast _breakFast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (_, __, ___) => FoodDetailView(
                    title: _breakFast.title!,
                    id: _breakFast.id!,
                    image: _breakFast.image!,
                    location: _breakFast.location!,
                    price: _breakFast.price!,
                  ),
              transitionDuration: Duration(milliseconds: 600),
              transitionsBuilder:
                  (_, Animation<double> animation, __, Widget child) {
                return Opacity(
                  opacity: animation.value,
                  child: child,
                );
              }));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: 'hero-tag-${_breakFast.id}',
              child: Material(
                child: Container(
                  height: 140.0,
                  width: 140.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(_breakFast.image!),
                          fit: BoxFit.cover),
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5.0,
                            color: Colors.black12.withOpacity(0.1),
                            spreadRadius: 2.0)
                      ]),
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              _breakFast.title!,
              style: TextStyle(
                  fontFamily: "Sofia",
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                  color: Colors.black87),
            ),
            SizedBox(
              height: 2.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  size: 15.0,
                  color: Colors.black12,
                ),
                Text(
                  _breakFast.location!,
                  style: TextStyle(
                      fontFamily: "Sofia",
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      color: Colors.black26),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.star,
                  size: 18.0,
                  color: Colors.yellow,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Text(
                    _breakFast.ratting!,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: "Sofia",
                        fontSize: 13.0),
                  ),
                ),
                SizedBox(
                  width: 35.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class cardLunch extends StatelessWidget {
  lunch _lunch;
  cardLunch(this._lunch);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: (_, __, ___) => FoodDetailView(
                  title: _lunch.title!,
                  id: _lunch.id!,
                  image: _lunch.image!,
                  location: _lunch.location!,
                  price: _lunch.price!,
                ),
            transitionDuration: Duration(milliseconds: 600),
            transitionsBuilder:
                (_, Animation<double> animation, __, Widget child) {
              return Opacity(
                opacity: animation.value,
                child: child,
              );
            }));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: 'hero-tag-${_lunch.id}',
              child: Material(
                child: Container(
                  height: 110.0,
                  width: 180.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(_lunch.image!), fit: BoxFit.cover),
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5.0,
                            color: Colors.black12.withOpacity(0.1),
                            spreadRadius: 2.0)
                      ]),
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              _lunch.title!,
              style: TextStyle(
                  fontFamily: "Sofia",
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                  color: Colors.black87),
            ),
            SizedBox(
              height: 2.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  size: 18.0,
                  color: Colors.black12,
                ),
                Text(
                  _lunch.location!,
                  style: TextStyle(
                      fontFamily: "Sofia",
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      color: Colors.black26),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.star,
                  size: 18.0,
                  color: Colors.yellow,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Text(
                    _lunch.ratting!,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: "Sofia",
                        fontSize: 13.0),
                  ),
                ),
                SizedBox(
                  width: 35.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class cardDinner extends StatelessWidget {
  dinner _dinner;
  cardDinner(this._dinner);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: (_, __, ___) => FoodDetailView(
                  title: _dinner.title!,
                  id: _dinner.id!,
                  image: _dinner.image!,
                  location: _dinner.location!,
                  price: _dinner.price!,
                ),
            transitionDuration: Duration(milliseconds: 600),
            transitionsBuilder:
                (_, Animation<double> animation, __, Widget child) {
              return Opacity(
                opacity: animation.value,
                child: child,
              );
            }));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: 'hero-tag-${_dinner.id}',
              child: Material(
                child: Container(
                  height: 106.0,
                  width: 106.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3.0,
                            color: Colors.black12.withOpacity(0.1),
                            spreadRadius: 1.0)
                      ],
                      image: DecorationImage(
                          image: AssetImage(_dinner.image!),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _dinner.title!,
                    style: TextStyle(
                        fontFamily: "Sofia",
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        size: 16.0,
                        color: Colors.black12,
                      ),
                      Text(
                        _dinner.location!,
                        style: TextStyle(
                            fontFamily: "Sofia",
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            color: Colors.black26),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        size: 18.0,
                        color: Colors.yellow,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Text(
                          _dinner.ratting!,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: "Sofia",
                              fontSize: 13.0),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 */