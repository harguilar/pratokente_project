import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pratokente/ui/shared/shared_styles.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      //Commented By Harguilar Nhanga
      // onModelReady: (model) => model.loadCurrentUser(),
      //Verify Network Connection.
      builder: (context, model, child) => Scaffold(
        body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 300),
          reverse: model.reverse,
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return SharedAxisTransition(
              child: child,
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
            );
          },
          child: getViewForIndex(model.currentIndex),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
              textTheme: Theme.of(context).textTheme.copyWith(
                  caption: TextStyle(color: Colors.black26.withOpacity(0.15)))),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: model.currentIndex,
            onTap: model.setIndex,
            fixedColor: Color(0xFFF48522),
            items: [
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.home),
                title: Text(
                  "Home",
                  style: kcBottomNav,
                ),
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.cartPlus),
                title: Text(
                  "Cart",
                  style: kcBottomNav,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.grain),
                title: Text(
                  "Categorias",
                  style: kcBottomNav,
                ),
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.listAlt),
                title: Text(
                  "Encomendas",
                  style: kcBottomNav,
                ),
              ),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.user),
                  title: Text("Profile", style: kcBottomNav)),
            ],
          ),
        ),
      ),

      viewModelBuilder: () => HomeViewModel(),
    );
  }

  Widget getViewForIndex(int? index) {
    switch (index) {
      case 0:
        return Container();
      //return HomeViewDetailed();
      case 1:

      //return Container();
      //Harguilar
      //return CartView();
      case 2:
      //return Container();
      //return CategoryView();
      case 3:
      // return Container();
      //Harguilar Commented This
      //return OrdersViewList();
      case 4:
      //return ProfileViewEmail();
      //return ProfileViewEmail();
      default:
        return Container();
      // return HomeViewDetailed();
      //return HomeScreenT2();
    }
  }
}
