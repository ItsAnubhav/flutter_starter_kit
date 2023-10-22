import 'package:flutter/material.dart';

class Utils {
  static String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Email Id';
    }
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);
    return value.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  static bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    try {
      final num = double.parse(s);
      return true;
    } catch (e) {
      return false;
    }
  }

  static String getInitials(String value) {
    if (value.isNotEmpty) {
      List<String> name = value.trim().split(" ");
      if (name.length > 1) {
        return name.first.substring(0, 1).toUpperCase() +
            name.last.substring(0, 1).toUpperCase();
      } else {
        return name[0].substring(0, 1).toUpperCase();
      }
    } else {
      return "";
    }
  }

  static String? validatePassword(String? value) {
    //Password must be at least 6 characters and contains a letter and
    return value!.isNotEmpty && value.length < 6
        ? 'Password must be at least 6 characters'
        : null;
  }

  static void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static void showSnackBar(BuildContext context, String value) {
    SnackBar snackBar = SnackBar(
      backgroundColor: Colors.blueGrey,
      content: Text(value),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showToast(String value) {
    // Fluttertoast.showToast(
    //     msg: value,
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.BOTTOM,
    //     timeInSecForIosWeb: 1,
    //     textColor: Colors.white,
    //     fontSize: 16.0);
  }

  static void showLoaderDialog(BuildContext context,
      {String? loadingMessage, bool isDismissible = false}) {
    AlertDialog alert = AlertDialog(
        content: CircularProgressIndicator(
            //message: loadingMessage,
            ));
    showDialog(
      barrierDismissible: isDismissible,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static getadaptiveTextSize(BuildContext context, dynamic value) {
    // 720 is medium screen height
    return (value / 720) * MediaQuery.of(context).size.height;
  }

  static String getPrettyNumber(double number) {
    if (number >= 1000) {
      return "${(number / 1000).toStringAsFixed(0)}K";
    } else {
      return number.toStringAsFixed(0);
    }
  }

  static String convertDecimalToBinary({required int decimal, int bits = 7}) {
    String binary = decimal.toRadixString(2).padLeft(bits, '0');
    // binary = binary.substring(6, 8) +
    //     binary.substring(4, 6) +
    //     binary.substring(2, 4) +
    //     binary.substring(0, 2);
    return binary;
  }

  static List<int> convertBinary({required String binaryValue}) {
    int decimal = int.parse(binaryValue, radix: 2);
    List<int> integers = [];

    while (decimal > 0) {
      integers.add(decimal & 1);
      decimal >>= 1;
    }

    integers = integers.reversed.toList();
    return integers;
  }

  late BuildContext context;

  Utils(this.context);

  // this is where you would do your fullscreen loading
  Future<void> startLoading() async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const SimpleDialog(
          elevation: 0.0,
          backgroundColor:
              Colors.transparent, // can change this to your prefered color
          children: <Widget>[
            Center(
              child: CircularProgressIndicator(),
            )
          ],
        );
      },
    );
  }

  Future<void> stopLoading() async {
    Navigator.of(context).pop();
  }

  Future<void> showError(Object? error) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
        backgroundColor: Colors.red,
        //content: Text(handleError(error)),
        content: const Text('Error Found'),
      ),
    );
  }
}

List<List<T>> divideList<T>(List<T> list) {
  if (list.length < 3) {
    // If the list has less than 3 elements, return the original list as a single part
    return [list];
  }

  final firstElement = list.first;
  final lastElement = list.last;
  final middleElements = list.sublist(1, list.length - 1);

  final dividedList = <List<T>>[];

  final chunkSize = (middleElements.length / 3).ceil();

  for (var i = 0; i < middleElements.length; i += chunkSize) {
    final endIndex = (i + chunkSize < middleElements.length)
        ? i + chunkSize
        : middleElements.length;
    final chunk = [
      firstElement,
      ...middleElements.sublist(i, endIndex),
      lastElement
    ];
    dividedList.add(chunk);
  }

  return dividedList;
}
