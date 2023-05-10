  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:etrade_actions/data/repositories/auth/authentication_repository.dart';
  import 'package:etrade_actions/features/shop/models/address_model.dart';
  import 'package:get/get.dart';

  class AddressRepository extends GetxController {
    static AddressRepository get instance => Get.find();

    final _db = FirebaseFirestore.instance;

    Future<List<AddressModel>> fetchUserAddresses() async {
      try {
        final userId = AuthenticationRepository.instance.authUser!.uid;
        if (userId.isEmpty) throw 'User not found';
        final result = await _db
            .collection('Users')
            .doc(userId)
            .collection('Addresses')
            .get();
        return result.docs
            .map((doc) => AddressModel.fromDocumentSnapshot(doc))
            .toList();
      } catch (e) {
        throw 'Something went wrong. Please try again';
      }
    }

    Future<void> updateSelectedField(String addressId, bool selected) async {
      try {
        final userId = AuthenticationRepository.instance.authUser!.uid;
        await _db.collection('Users').doc(userId).collection('Addresses').doc(addressId).update({
          'SelectedAddress': selected,
        });
        
      } catch (e) {
        throw 'Unable to update your address selection. Try again later';
      }
    }

    Future<String> addNewAddress(AddressModel address) async {
      try {
        final userId = AuthenticationRepository.instance.authUser!.uid;
        final currentAddress = await _db.collection('Users').doc(userId).collection('Addresses').add(address.toJson());
        return currentAddress.id;
      } catch (e) {
        throw 'Unable to add your address. Try again later';
      }
    }
  }
