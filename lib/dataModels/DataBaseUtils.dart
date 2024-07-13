import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;
final CollectionReference Collection = firestore.collection('vehicles');

class FirebaseCrud {
  static Future vehicles(
      {required String vehicleName,
      required String vehicleNumber,
      required String motTellDate,
      required String taxedDate,
      required String primaryDate,
      required String color,
      required String fuelType,
      required String cylinder,
      required String power}) async {
        // ignore: unused_local_variable
        DocumentReference documentReferencer =
        Collection.doc();
      }


      static Stream<QuerySnapshot> getVehicleData() {
    CollectionReference vehicles =
        Collection;

    return vehicles.snapshots();
  }
}
