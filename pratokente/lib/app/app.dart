import 'package:places_service/places_service.dart';
import 'package:pratokente/core/services/environment_services.dart';
import 'package:pratokente/core/services/firestore_api.dart';
import 'package:pratokente/core/services/bottom_navigation_service.dart';
import 'package:pratokente/core/services/cart_service.dart';
import 'package:pratokente/core/services/orders_service.dart';
import 'package:pratokente/core/services/product_service.dart';
import 'package:pratokente/core/services/users_services.dart';
import 'package:pratokente/ui/addres_selection/address_selection_view.dart';
import 'package:pratokente/ui/create_account/create_accountview.dart';
import 'package:pratokente/ui/home/home_view.dart';
import 'package:pratokente/ui/login/login_view.dart';
import 'package:pratokente/ui/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView, initial: true),
    CupertinoRoute(page: AddressSelectionView),
    //CupertinoRoute(page: BookView),
    //CupertinoRoute(page: CartView),
    //CupertinoRoute(page: CategoryView),
    //CupertinoRoute(page: CateringServiceT2),
    CupertinoRoute(page: CreateAccountView),
    //CupertinoRoute(page: GetMerchantView),
    //CupertinoRoute(page: GetProuctByMerchantView),
    //CupertinoRoute(page: HomeMadeView),
    //CupertinoRoute(page: RestaurantView),
    //CupertinoRoute(page: StreetFoodView),
    //CupertinoRoute(page: CheckoutView),
    //CupertinoRoute(page: FoodDetailView),
    CupertinoRoute(page: HomeView),
    //CupertinoRoute(page: HomeViewDetailed),
    //CupertinoRoute(page: OrdersViewList),
    //CupertinoRoute(page: OrderCon),
    CupertinoRoute(page: LoginView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    Singleton(classType: FirebaseAuthenticationService),
    LazySingleton(classType: BottomNavigation),
    LazySingleton(classType: CartService),
    LazySingleton(classType: OrdersService),
    LazySingleton(classType: ProductService),
    LazySingleton(classType: EnvironmentService),
    LazySingleton(classType: DialogService),
    // LazySingleton(classType: SupportService),
    // LazySingleton(classType: CategoryViewModel),
    //LazySingleton(classType: LocalStorageService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: FirestoreApi),
    LazySingleton(classType: UserService),
    LazySingleton(classType: PlacesService),

    //LazySingleton(classType: ThirdPartyServicesModule),
    // LazySingleton(classType: OrderViewModelList),
  ],
  logger: StackedLogger(),
)
class AppSetup {}
