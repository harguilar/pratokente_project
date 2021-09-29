// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/addres_selection/address_selection_view.dart';
import '../ui/booking/book_view.dart';
import '../ui/booking/restaurant/restaurant_book_view.dart';
import '../ui/create_account/create_accountview.dart';
import '../ui/home/home_view.dart';
import '../ui/login/login_view.dart';
import '../ui/merchant/merchant_view.dart';
import '../ui/merchant/merchant_view_list.dart';
import '../ui/products/get_products_by_merchant_view.dart';
import '../ui/startup/startup_view.dart';

class Routes {
  static const String startupView = '/';
  static const String addressSelectionView = '/address-selection-view';
  static const String createAccountView = '/create-account-view';
  static const String merchantView = '/merchant-view';
  static const String getProuctByMerchantView = '/get-prouct-by-merchant-view';
  static const String homeView = '/home-view';
  static const String loginView = '/login-view';
  static const String bookView = '/book-view';
  static const String restaurantBookView = '/restaurant-book-view';
  static const String merchantViewList = '/merchant-view-list';
  static const all = <String>{
    startupView,
    addressSelectionView,
    createAccountView,
    merchantView,
    getProuctByMerchantView,
    homeView,
    loginView,
    bookView,
    restaurantBookView,
    merchantViewList,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.addressSelectionView, page: AddressSelectionView),
    RouteDef(Routes.createAccountView, page: CreateAccountView),
    RouteDef(Routes.merchantView, page: MerchantView),
    RouteDef(Routes.getProuctByMerchantView, page: GetProuctByMerchantView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.bookView, page: BookView),
    RouteDef(Routes.restaurantBookView, page: RestaurantBookView),
    RouteDef(Routes.merchantViewList, page: MerchantViewList),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StartupView(),
        settings: data,
      );
    },
    AddressSelectionView: (data) {
      var args = data.getArgs<AddressSelectionViewArguments>(
        orElse: () => AddressSelectionViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => AddressSelectionView(key: args.key),
        settings: data,
      );
    },
    CreateAccountView: (data) {
      var args = data.getArgs<CreateAccountViewArguments>(
        orElse: () => CreateAccountViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => CreateAccountView(key: args.key),
        settings: data,
      );
    },
    MerchantView: (data) {
      var args = data.getArgs<MerchantViewArguments>(
        orElse: () => MerchantViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => MerchantView(key: args.key),
        settings: data,
      );
    },
    GetProuctByMerchantView: (data) {
      var args = data.getArgs<GetProuctByMerchantViewArguments>(
        orElse: () => GetProuctByMerchantViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => GetProuctByMerchantView(key: args.key),
        settings: data,
      );
    },
    HomeView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    LoginView: (data) {
      var args = data.getArgs<LoginViewArguments>(
        orElse: () => LoginViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => LoginView(key: args.key),
        settings: data,
      );
    },
    BookView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => BookView(),
        settings: data,
      );
    },
    RestaurantBookView: (data) {
      var args = data.getArgs<RestaurantBookViewArguments>(
        orElse: () => RestaurantBookViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => RestaurantBookView(key: args.key),
        settings: data,
      );
    },
    MerchantViewList: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => MerchantViewList(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// AddressSelectionView arguments holder class
class AddressSelectionViewArguments {
  final Key? key;
  AddressSelectionViewArguments({this.key});
}

/// CreateAccountView arguments holder class
class CreateAccountViewArguments {
  final Key? key;
  CreateAccountViewArguments({this.key});
}

/// MerchantView arguments holder class
class MerchantViewArguments {
  final Key? key;
  MerchantViewArguments({this.key});
}

/// GetProuctByMerchantView arguments holder class
class GetProuctByMerchantViewArguments {
  final Key? key;
  GetProuctByMerchantViewArguments({this.key});
}

/// LoginView arguments holder class
class LoginViewArguments {
  final Key? key;
  LoginViewArguments({this.key});
}

/// RestaurantBookView arguments holder class
class RestaurantBookViewArguments {
  final Key? key;
  RestaurantBookViewArguments({this.key});
}
