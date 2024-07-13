import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/src/intl/date_format.dart';

import 'package:got_stuck/config/colors.dart';
// import 'package:got_stuck/config/helpers/responsive.dart';
// import 'package:got_stuck/screens/SinglePetrolPumpScreen/SinglePetrolPumpScreen.dart';
// import 'package:got_stuck/widgets/AppText/CustomScreenNameAppBar.dart';
// import 'package:got_stuck/widgets/AppText/CustomWhiteButtonWidget.dart';
import 'package:got_stuck/widgets/AppText/large_text.dart';
import 'package:got_stuck/widgets/AppText/medium_text.dart';
// import 'package:got_stuck/widgets/SubTitleTextWidget.dart';
import 'package:got_stuck/widgets/customIconWidget.dart';
import 'package:got_stuck/widgets/roundedTextInput.dart';
import '../../config/app_text.dart';
// import '../../widgets/CustomWalletTiles.dart';
import '../../widgets/CustomTitleAppBar.dart';
import '../../widgets/RoundedButton.dart';

class WalletFormScreen extends StatefulWidget {
  const WalletFormScreen({super.key});

  @override
  State<WalletFormScreen> createState() => _WalletFormScreenState();
}

class _WalletFormScreenState extends State<WalletFormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController expiryController = TextEditingController();
  TextEditingController cvcController = TextEditingController();
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: const CustomTitleAppBar(
              backGroundColor: AppColors.white, title: AppText.wallet),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 35),
                            child: MediumText(
                              text: 'Please enter your card details carefully',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                              align: TextAlign.center,
                            ),
                          ),
                          const Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 20),
                              child: Row(children: [
                                CustomIconWidget(icon: 'assets/icons/card.svg'),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: LargeText(
                                    text: 'Credit Cards',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ])),
                          CustomInputFieldWithIndicator(
                            onTap: () {},
                            cursorColor: AppColors.appYellow,
                            inputType: TextInputType.name,
                            controller: nameController,
                            fieldColor: AppColors.socialIcon,
                            fieldName: 'Name',
                            hinTextColor: AppColors.black,
                            hintText: 'M Taimoor',
                          ),
                          CustomInputFieldWithIndicator(
                            onTap: () {},
                            cursorColor: AppColors.appYellow,
                            inputType: TextInputType.number,
                            controller: numberController,
                            fieldColor: AppColors.socialIcon,
                            fieldName: 'Your Card No.',
                            hinTextColor: AppColors.black,
                            hintText: '0000 0000 0000 0000',
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              CardNumberInputFormatter(),
                              LengthLimitingTextInputFormatter(19),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomInputFieldWithIndicator(
                                  onTap: () async {
                                    var currentYear = DateTime.now().year;
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime(currentYear + 1),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2101));

                                    if (pickedDate != null) {
                                      String formattedDate =
                                          DateFormat('d/M/yyyy')
                                              .format(pickedDate);

                                      setState(() {
                                        expiryController.text = formattedDate;
                                      });
                                    } else {}
                                  },
                                  cursorColor: AppColors.appYellow,
                                  readOnly: true,
                                  inputType: TextInputType.number,
                                  controller: expiryController,
                                  fieldColor: AppColors.socialIcon,
                                  fieldName: 'Expiry Date',
                                  hinTextColor: AppColors.black,
                                  hintText: '4/2/2023',
                                  // inputFormatters: [
                                  //   FilteringTextInputFormatter.digitsOnly,
                                  //   CardDateInputFormatter(),
                                  //   LengthLimitingTextInputFormatter(10),
                                  // ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: CustomInputFieldWithIndicator(
                                  onTap: () {},
                                  cursorColor: AppColors.appYellow,
                                  inputType: TextInputType.number,
                                  controller: cvcController,
                                  fieldColor: AppColors.socialIcon,
                                  fieldName: 'CVC',
                                  hinTextColor: AppColors.black,
                                  hintText: '123',
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(3)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: RoundedButton(
                        backgroundColor: AppColors.black,
                        onTap: () {
                          // var enteredDate = expiryController.text;
                          // var year = '';
                          // var currentYear = DateTime.now().year;
                          // var currentMonth = DateTime.now().month;
                          // var month = '';
                          // int monthInteger = 0;
                          // int yearInteger = 0;

                          // debugPrint('splitted date is $year');
                          if (nameController.text.trim().isEmpty &&
                              numberController.text.trim().isEmpty &&
                              expiryController.text.trim().isEmpty &&
                              cvcController.text.trim().isEmpty) {
                            Fluttertoast.showToast(
                              msg: 'Enter all fields',
                              backgroundColor: AppColors.appYellow,
                            );
                          } else {
                            if (nameController.text.isEmpty) {
                              Fluttertoast.showToast(
                                  backgroundColor: AppColors.appYellow,
                                  msg: 'Enter your name');
                            } else if (numberController.text.isEmpty ||
                                numberController.text.length < 16) {
                              Fluttertoast.showToast(
                                  backgroundColor: AppColors.appYellow,
                                  msg: 'Enter valid card number');
                            } else if (expiryController.text.isEmpty) {
                              Fluttertoast.showToast(
                                  backgroundColor: AppColors.appYellow,
                                  msg: 'Enter expiry date');
                            }
                            // else if (expiryController.text.trim().isNotEmpty) {
                            //   year = enteredDate.split('/').elementAt(2);
                            //   month = enteredDate.split('/').elementAt(1);
                            //   print(year);
                            //   print(month);
                            // }
                            else if (cvcController.text.isEmpty ||
                                cvcController.text.length < 3) {
                              Fluttertoast.showToast(
                                  backgroundColor: AppColors.appYellow,
                                  msg: 'Enter valid cvc');

                              // print('this is entered month $monthInteger');
                              // print('this is entered year $yearInteger');
                              // print('this is current month $currentMonth');
                              // print('this is current year $currentYear');
                            } else {
                              // print('this is entered month $monthInteger');
                              // print('this is entered year $yearInteger');
                              // print('this is current month $currentMonth');
                              // print('this is current year $currentYear');

                              Fluttertoast.showToast(
                                msg: 'Card entered successfully',
                                backgroundColor: AppColors.appYellow,
                              );
                              Navigator.pop(context);
                            }
                          }
                        },
                        text: 'Add New Card',
                        txtColor: AppColors.white),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class CustomInputFieldWithIndicator extends StatelessWidget {
  const CustomInputFieldWithIndicator({
    super.key,
    required this.controller,
    required this.fieldName,
    required this.fieldColor,
    required this.hintText,
    required this.hinTextColor,
    required this.inputType,
    this.inputFormatters,
    this.cursorColor,
    this.readOnly,
    this.onTap,
  });
  final String fieldName;
  final Color fieldColor;
  final String hintText;
  final Color hinTextColor;
  final TextEditingController controller;
  final TextInputType inputType;
  final List<TextInputFormatter>? inputFormatters;
  final Color? cursorColor;
  final VoidCallback? onTap;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: MediumText(
              text: fieldName,
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 12),
            ),
          ),
          RoundedInputField(
              redOnly: readOnly ?? false,
              onTap: onTap,
              cursorColor: cursorColor ?? AppColors.black,
              inputFormatters: inputFormatters,
              inputType: inputType,
              fieldColor: AppColors.socialIcon,
              hintTextColor: AppColors.black,
              controllerData: controller,
              hintText: hintText)
        ],
      ),
    );
  }
}

class CardDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    var nonZeroIndex = 0;
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      nonZeroIndex++;
      if ((nonZeroIndex == 2 || nonZeroIndex == 4) &&
          nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }

    var string = buffer.toString();

    // Validate day, month, and year
    var parts = string.split('/');
    var isValidDate = true;

    if (parts.length == 3) {
      var day = int.tryParse(parts[0]);
      var month = int.tryParse(parts[1]);
      // var year = int.tryParse(parts[2]);

      if (day == null || day < 1 || day > 31) {
        Fluttertoast.showToast(msg: 'Day is not valid');
        isValidDate = false;
      }
      if (month == null || month < 1 || month > 12) {
        Fluttertoast.showToast(msg: 'Month is not valid');
        isValidDate = false;
      }

      if (!isValidDate) {
        return oldValue;
      }
    } else {
      // Fluttertoast.showToast(msg: 'Enter valid date');
      isValidDate = false;
    }

    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write(' '); // Add double spaces.
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
