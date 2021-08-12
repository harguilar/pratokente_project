/* import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pratokente/app/app.router.dart';
import 'package:pratokente/ui/category_view/category_viewModel.dart';

import '../helpers/test_helpers.dart';

CategoryViewModel _getModel() => CategoryViewModel();
void main() {
  group('CategoryViewmodelTest -', () {
    test('Navigate To Selected Merchant', () async {
      final navigationService = getAndRegisterNavigationService();
      final productService = getAndRegisterProductService();
      final model = _getModel();
      // getAndRegisterUserService(hasLoggedInUser: true);
      model.setProductCategory(merchantCategory: 'Restaurante');
      productService.setProductCategory(productCategory: 'Restaurante');
      // verify(navigationService.navigateTo(Routes.getMerchantView));
    });
  });
} */
