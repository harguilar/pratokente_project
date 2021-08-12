import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pratokente/app/app.logger.dart';
import 'package:pratokente/constants/app_keys.dart';
import 'package:pratokente/constants/constants.dart';
import 'package:pratokente/core/datamodels/cart/cart_product.dart';
import 'package:pratokente/core/datamodels/products/product_data.dart';
import 'package:pratokente/core/datamodels/user/user_models.dart';
import 'package:pratokente/expections/firestore_api_exceptions.dart';

class FirestoreApi {
  final log = getLogger('FirestoreApi');
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection(UsersFirestoreKey);

  final CollectionReference regionsCollection =
      FirebaseFirestore.instance.collection(RegionsFirestoreKey);
  // final _userService = locator<UserService>();

  // Users Section
  Future<void> createUser({required User user}) async {
    log.i('user:$user');
    try {
      final userDocument = userRef.doc(user.id);
      await userDocument.set(user.toJson());
      log.v('User Created at ${userDocument.path}');
    } catch (error) {
      throw FirestoreApiExceptions(
        message: 'Failed To Create New User',
        devDetails: '$error',
      );
    }
  }

  Future<User?> getUser({required String userId}) async {
    log.i('UserId: $userId');
    if (userId.isNotEmpty) {
      final userDoc = await userRef.doc(userId).get();
      if (!userDoc.exists) {
        log.v('We do not have User with Id: $userId in our Database');
        return null;
      } else {
        final userData = userDoc.data();
        log.v('User Found. Data: $userData');
        return User.fromJson(userData!);
      }
    } else {
      throw FirestoreApiExceptions(
        message: 'User ID Passed is Empty',
      );
    }
  }

  Future<void> updateUser(User? userData) async {
    userRef.doc(userData!.id).set(userData.toJson());
  }

  Future updateUserAddress(
      {required String userId, required String address}) async {
    try {
      await userRef.doc(userId).update({'defaultAddress': address});
    } catch (e) {
      // debugPrint(e.toString());
    }
  }

  Future<bool> isCityServiced({required String city}) async {
    log.i('city:$city');
    final cityDocument = await regionsCollection.doc(city).get();
    return cityDocument.exists;
  }

  CollectionReference getAddressCollectionForUser(String userId) {
    return usersCollection.doc(userId).collection(AddressesFirestoreKey);
  }
  // End of Users Section

  //Get Products By Users Section

  Future<ProductData?> getProductById(String productId) async {
    log.i('ProductId: ' + productId);
    if (productId.isNotEmpty) {
      final productById = await productsReference.doc(productId).get();
      if (!productById.exists) {
        log.v('We do not have User with Id: $productId in our Database');
      } else {
        final productByIdData = productById.data();
        return ProductData.fromJson(productByIdData!);
      }
    } else {
      throw FirestoreApiExceptions(
        message: 'Product ID Passed is Empty',
      );
    }
  }

  //Cart Products Section

  Future<List<CartProduct>?> getCartProducts({required String userId}) async {
    try {
      if (userId.isNotEmpty) {
        //QuerySnapshot query;
        final query = await userRef
            .doc(userId)
            .collection('cart')
            .where('status', isEqualTo: "1")
            .get();

        if (query.docs.isEmpty) {
          log.v(
              'We do not have Cart Product for the User Id: $userId in our Database');
          return null;
        } else {
          //final userCartProducts = query.docs;
          //log.v('User Found. Data: $query');
          //return query.docs.map((docs) => CartProduct.fromJson(docs)));
          return query.docs
              .map((docs) => CartProduct.fromJson(docs.data()))
              .toList();
        }
      } else {
        throw FirestoreApiExceptions(
          message: 'User ID Passed is Empty',
        );
      }
      // if (query.docs.isNotEmpty)
      // return query.docs.map((doc) => CartProduct.fromJson(doc)).toList();
    } catch (err) {
      print('Caught error: $err');
      //return query.docs.map((doc) => CartProduct.fromJson(doc)).toList();
    }
  }

  //Update Cart
  void updateCartstatus({required String userId}) async {
    //final userId = _userService.getCurrentUser.id;
    var snapshots = userRef.doc(userId).collection('cart').snapshots();
    try {
      await snapshots.forEach((snapshot) async {
        List<DocumentSnapshot> documents = snapshot.docs;

        for (var document in documents) {
          await document.reference.update(<String, dynamic>{'status': "2"});
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool> saveAddress(
      {required Address address, required User user}) async {
    log.i('address: $address');
    try {
      final addressDoc = getAddressCollectionForUser(user.id).doc();
      final newAddressId = addressDoc.id;
      log.v('Address will be stored with id: $newAddressId');

      await addressDoc.set(address.copyWith(id: newAddressId).toJson());

      final hasDefaultAddress = user.hasAddress;
      log.v('Address save complete. hasDefaultAddress:$hasDefaultAddress');
      if (!hasDefaultAddress) {
        log.v(
            'This user has no default address. We need to set the current one as default');
        await userRef
            .doc(user.id)
            .set(user.copyWith(defaultAddress: newAddressId).toJson());
        log.v('User ${user.id} defaultAddress set to $newAddressId');
      }
      return true;
    } on Exception catch (e) {
      log.e('we could not save the users address. $e');
      return false;
    }
  }
}
