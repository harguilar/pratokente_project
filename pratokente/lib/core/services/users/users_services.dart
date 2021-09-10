import 'package:pratokente/app/app.locator.dart';
import 'package:pratokente/app/app.logger.dart';
import 'package:pratokente/core/datamodels/user/user_models.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

import '../../../apis/firestore_api.dart';

class UserService {
  final log = getLogger('UserService');
  final _firestoreApi = locator<FirestoreApi>();
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();
  User? _currentUser;

  User get getCurrentUser => _currentUser!;

  bool get hasLoggedInUser => _firebaseAuthenticationService.hasUser;

  Future<void> syncUserAccount() async {
    final firebaseUserId =
        _firebaseAuthenticationService.firebaseAuth.currentUser!.uid;
    log.v('The current User Id is: $firebaseUserId');

    final userAccount = await _firestoreApi.getUser(userId: firebaseUserId);
    if (userAccount != null) {
      log.v('User Exists. Save To Current User');
      _currentUser = userAccount;
    }
  }

  Future<void> syncOrCreateUserAccount({required User user}) async {
    log.i('The User is: $user');

    //Sync the User Account
    await syncUserAccount();
    if (_currentUser == null) {
      log.v('We Have no User Account. Please Create One');
      await _firestoreApi.createUser(user: user);
      _currentUser = user;
      log.v('Current User Has Been Saved');
    }
  }

  Future<void> updateUserAccount(
      {required String userId, required String userAddress}) async {
    await _firestoreApi.updateUserAddress(userId: userId, address: userAddress);
  }
}
