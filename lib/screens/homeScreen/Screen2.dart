// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:got_stuck/config/app_text.dart';
import 'package:got_stuck/config/colors.dart';
import 'package:got_stuck/config/helpers/responsive.dart';
import 'package:got_stuck/screens/AddVehicle/addvehicleScreen.dart';
import 'package:got_stuck/widgets/AppText/medium_text.dart';
import 'package:got_stuck/widgets/RoundedButton.dart';
import 'package:got_stuck/widgets/customIconWidget.dart';

import '../../config/app_icons.dart';
import '../../widgets/AppText/large_text.dart';
import '../../widgets/CustomNumberPlateDetailWidget.dart';
import '../../widgets/CustomTitleAppBar.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key, this.isBacked = false});
  final bool isBacked;

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2>
    with AutomaticKeepAliveClientMixin<Screen2> {
  DataBaseService service = DataBaseService();
  Stream<List<MyVehicles>>? vehiclesList;
  List<MyVehicles>? retrievedVehiclesList;

  @override
  void initState() {
    super.initState();
    initRetrieval();
  }

  Future<void> initRetrieval() async {
    vehiclesList = service.fetchVehiclesStream();
    retrievedVehiclesList = await service.fetchVehiclesStream().first;
    debugPrint(retrievedVehiclesList.toString());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: CustomTitleAppBar(
            backGroundColor: AppColors.white,
            title: AppText.myVehicle,
            isBacked: widget.isBacked),
        body: SizedBox(
            height: screenHeight(context),
            width: screenWidth(context),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 0, bottom: 20, left: 20, right: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: StreamBuilder<List<MyVehicles>>(
                        stream: vehiclesList,
                        builder: (context, snapshot) {
                          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                            List<MyVehicles> retrievedVehiclesList =
                                snapshot.data!;
                            debugPrint(retrievedVehiclesList[0].carName);
                            double height = 172;
                            return ListView.builder(
                              padding:
                                  const EdgeInsets.only(bottom: 0, top: 40),
                              itemCount: retrievedVehiclesList.length,
                              itemBuilder: (context, index) {
                                return CustomCarExpansionTileWidget(
                                  onDelete: () async {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text(
                                            AppText.pleaseConfirm,
                                            textAlign: TextAlign.center,
                                          ),
                                          content: const Text(
                                            AppText.areYouSureToDelete,
                                            textAlign: TextAlign.center,
                                          ),
                                          actions: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 10,
                                                    ),
                                                    child: RoundedButton(
                                                        height: 45,
                                                        text: AppText.no,
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        txtColor:
                                                            AppColors.white,
                                                        backgroundColor:
                                                            AppColors.black),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10),
                                                    child: RoundedButton(
                                                        height: 45,
                                                        text: AppText.yes,
                                                        onTap: () async {
                                                          Navigator.pop(
                                                              context);
                                                          await service
                                                              .markVehicleAsDeleted(
                                                            {'isDeleted': true},
                                                            retrievedVehiclesList[
                                                                    index]
                                                                .carNumber,
                                                          ).then((value) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              const SnackBar(
                                                                  content: Text(
                                                                      AppText
                                                                          .deletedSuccessfully)),
                                                            );
                                                          });
                                                        },
                                                        txtColor:
                                                            AppColors.white,
                                                        backgroundColor:
                                                            AppColors
                                                                .appYellow),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  carName: retrievedVehiclesList[index].carName,
                                  carNumber:
                                      retrievedVehiclesList[index].carNumber,
                                  color: retrievedVehiclesList[index].color,
                                  cylinder:
                                      retrievedVehiclesList[index].cylinder,
                                  fuelType:
                                      retrievedVehiclesList[index].fuelType,
                                  power: retrievedVehiclesList[index].power,
                                  primaryDate:
                                      retrievedVehiclesList[index].primaryDate,
                                  motTillDate:
                                      retrievedVehiclesList[index].motTillDate,
                                  taxedTillDate: retrievedVehiclesList[index]
                                      .taxedTillDate,
                                  state: retrievedVehiclesList[index].isPressed,
                                  onChanged: (value) async {
                                    await service.markVehicleAsDeleted(
                                      {'isPressed': value},
                                      retrievedVehiclesList[index].carNumber,
                                    );
                                    setState(() {
                                      retrievedVehiclesList[index].isPressed =
                                          value;
                                    });
                                  },
                                  containerHeight: retrievedVehiclesList[index]
                                      .contHeight, //
                                  onExpandCloseTap: () {
                                    setState(() {
                                      if (retrievedVehiclesList[index]
                                              .contHeight ==
                                          172) {
                                        retrievedVehiclesList[index]
                                            .contHeight = 172;
                                      } else {
                                        retrievedVehiclesList[index]
                                            .contHeight -= 125;
                                      }
                                    });
                                  },
                                  onExpandTap: () {
                                    setState(() {
                                      if (retrievedVehiclesList[index]
                                              .contHeight ==
                                          172) {
                                        retrievedVehiclesList[index]
                                            .contHeight += 125;
                                      } else {
                                        retrievedVehiclesList[index]
                                            .contHeight = 172;
                                      }
                                    });
                                  },
                                );
                              },
                            );
                          } else if (snapshot.connectionState ==
                                  ConnectionState.waiting &&
                              (snapshot.data == null ||
                                  snapshot.data!.isNotEmpty)) {
                            return const Center(
                              child: CircularProgressIndicator(
                                  color: AppColors.appYellow),
                            );
                          } else {
                            return const Center(child: Text('No Cars Data'));
                          }
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: RoundedButton(
                            text: AppText.addVehicle,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AddVehicleScreen()));
                            },
                            txtColor: AppColors.white,
                            backgroundColor: AppColors.black),
                      ),
                    )
                  ]),
            )));
  }

  @override
  bool get wantKeepAlive => true;
}

class CustomCarExpansionTileWidget extends StatelessWidget {
  const CustomCarExpansionTileWidget({
    super.key,
    required this.state,
    required this.onExpandTap,
    required this.containerHeight,
    required this.onExpandCloseTap,
    required this.onChanged,
    required this.motTillDate,
    required this.taxedTillDate,
    required this.primaryDate,
    required this.color,
    required this.fuelType,
    required this.cylinder,
    required this.power,
    required this.carName,
    required this.carNumber,
    required this.onDelete,
  });
  final VoidCallback onExpandTap;
  final VoidCallback onDelete;
  final double containerHeight;
  final VoidCallback onExpandCloseTap;
  final bool state;
  final ValueChanged<bool> onChanged;
  final String motTillDate;
  final String taxedTillDate;
  final String primaryDate;
  final String color;
  final String fuelType;
  final String cylinder;
  final String power;
  final String carName;
  final String carNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: containerHeight,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(243, 246, 248, 1),
                borderRadius: BorderRadius.circular(10)),
            child: Stack(children: [
              Transform.translate(
                offset: const Offset(0, -25),
                child: CustomNumberPlateDetailWidget(
                    countryName: AppText.uk, carNumber: carNumber),
              ),
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: MediumText(
                        text: carName,
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 0),
                      child: Row(children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: GestureDetector(
                                onTap: () {
                                  Fluttertoast.showToast(msg: 'Coming soon');
                                },
                                child: SvgPicture.asset(AppIcons.reload))),
                        GestureDetector(
                            onTap: onDelete,
                            child: SvgPicture.asset(AppIcons.delete)),
                      ]),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: CustomIconWidget(icon: AppIcons.pyramids),
                            ),
                            MediumText(
                              text: AppText.motTIll,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        LargeText(
                          text: motTillDate,
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 5),
                                  child: CustomIconWidget(icon: AppIcons.tax),
                                ),
                                MediumText(
                                  text: AppText.taxedTill,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                            LargeText(
                              text: taxedTillDate,
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            )
                          ]),
                    ),
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: LargeText(
                            text: AppText.primary,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        Transform.scale(
                          scale: 0.8,
                          child: CupertinoSwitch(
                              activeColor: Colors.green,
                              value: state,
                              onChanged: onChanged),
                        )
                      ],
                    )
                  ],
                ),
                containerHeight == 172
                    ? IconButton(
                        onPressed: onExpandTap,
                        icon: const CustomIconWidget(
                          icon: AppIcons.more,
                        ))
                    : Container(),
                containerHeight > 172
                    ? Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Column(children: [
                          Row(children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const LargeText(
                                  text: AppText.primary,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                                LargeText(
                                  text: primaryDate,
                                  style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const LargeText(
                                    text: AppText.color,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  LargeText(
                                    text: color,
                                    style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            )
                          ]),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const LargeText(
                                        text: AppText.fuelType,
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      LargeText(
                                        text: fuelType,
                                        style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const LargeText(
                                          text: AppText.cylinder,
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        LargeText(
                                          text: cylinder.toString(),
                                          style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const LargeText(
                                        text: AppText.power,
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      LargeText(
                                        text: power,
                                        style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  )
                                ]),
                          ),
                          IconButton(
                              onPressed: onExpandTap,
                              icon: const CustomIconWidget(
                                icon: AppIcons.less,
                              ))
                        ]),
                      )
                    : Container()
              ]),
            ])));
  }
}

class MyVehicles {
  double contHeight;
  final String carName;
  final String motTillDate;
  final String taxedTillDate;
  final String primaryDate;
  final String color;
  final String fuelType;
  final String cylinder;
  final String power;
  final String carNumber;
  bool isPressed;
  int? isdeleted;
  final String? id;
  int? key;

  MyVehicles(
      {this.key,
      required this.isPressed,
      required this.contHeight,
      required this.carNumber,
      required this.carName,
      required this.motTillDate,
      required this.taxedTillDate,
      required this.primaryDate,
      required this.color,
      required this.fuelType,
      required this.cylinder,
      required this.power,
      this.isdeleted,
      this.id});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isPressed': isPressed,
      'contHeight': contHeight,
      'carNumber': carNumber,
      'carName': carName,
      'motTillDate': motTillDate,
      'taxedTillDate': taxedTillDate,
      'primaryDate': primaryDate,
      'color': color,
      'fuelType': fuelType,
      'cylinder': cylinder,
      'power': power
    };
  }
  

  MyVehicles.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.data()!['id'] ?? '',
        isPressed = doc.data()!['isPressed'] ?? false,
        contHeight = doc.data()!['contHeight'] ?? 0.0,
        carNumber = doc.data()!['carNumber'] ?? '',
        carName = doc.data()!['carName'] ?? '',
        motTillDate = doc.data()!['motTillDate'] ?? '',
        taxedTillDate = doc.data()!['taxedTillDate'] ?? '',
        primaryDate = doc.data()!['primaryDate'] ?? '',
        color = doc.data()!['color'] ?? '',
        fuelType = doc.data()!['fuelType'] ?? '',
        cylinder = doc.data()!['cylinder'] ?? '',
        power = doc.data()!['power'] ?? '';
}

class DataBaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  addVehicles(MyVehicles vehiclesData) async {
    await _db.collection("vehicles").add(vehiclesData.toMap());
  }

  Future<void> updateVehicles(MyVehicles vehiclesData) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await _db
        .collection("vehicles")
        .where('carNumber', isEqualTo: vehiclesData.carNumber)
        .get();

    if (snapshot.docs.isNotEmpty) {
      String docId = snapshot.docs[0].id;
      await _db
          .collection("vehicles")
          .doc(docId)
          .update(vehiclesData.toMap())
          .then((value) {
        debugPrint('$docId Document Updated successfully');
        debugPrint('Document Updated successfully');
      });
    } else {
      throw Exception('Document not found');
    }
  }

  Future<void> updateContHeight(MyVehicles vehiclesData) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await _db
        .collection("vehicles")
        .where('carNumber', isEqualTo: vehiclesData.carNumber)
        .get();

    if (snapshot.docs.isNotEmpty) {
      String docId = snapshot.docs[0].id;
      await _db
          .collection("vehicles")
          .doc(docId)
          .update(vehiclesData.toMap())
          .then((value) {
        debugPrint('$docId Document Updated successfully');
        debugPrint('Document Updated successfully');
      });
    } else {
      throw Exception('Document not found');
    }
  }

  Future<void> markVehicleAsDeleted(
    Map<String, dynamic> data,
    String carNumber,
  ) async {
    try {
      var collectionRef = FirebaseFirestore.instance.collection('vehicles');
      var querySnapshot =
          await collectionRef.where('carNumber', isEqualTo: carNumber).get();

      if (querySnapshot.docs.isNotEmpty) {
        var documentRef = collectionRef.doc(querySnapshot.docs[0].id);
        await documentRef.update(data);
        debugPrint('Successfully updated $carNumber to isDeleted = true.');
      } else {
        debugPrint('No document found for carNumber: $carNumber');
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<void> deleteVehicle(String vehicleNumber) async {
    await _db.collection("vehicles").doc().delete();
  }

  Stream<List<MyVehicles>> fetchVehiclesStream() {
    return _db
        .collection("vehicles")
        .where("isDeleted", isEqualTo: false)
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs
            .map((docSnapshot) => MyVehicles.fromDocumentSnapshot(docSnapshot))
            .toList());
  }

  Stream<List<Map<String, String>>> fetchUserStream({required String mail}) {
    return _db
        .collection("users")
        .where("Mail", isEqualTo: mail)
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs.map((docSnapshot) {
              String imageUrl = docSnapshot.data()['img'];
              String name = docSnapshot.data()['Name'];
              debugPrint('this is imageUrl from stream  $imageUrl');
              debugPrint('this is name from stream  $name');
              return {'Name': name, 'imageUrl': imageUrl};
            }).toList());
  }
}

class Users {
  final String name;
  final String image;
  Users({
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'Name': name,
      'img': image,
    };
  }

  Users.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : name = doc.data()!['Name'] ?? '',
        image = doc.data()!['img'] ?? '';
}
