import 'dart:async';

import 'package:flutter/material.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class DialogService {
  static final DialogService _instance = DialogService._internal();

  factory DialogService() => _instance;

  DialogService._internal();

  final List<DialogRequest> _dialogRequestList = [];

  final Completer<bool> _dialogCompleter = Completer<bool>();

  void showLoadingDialog() {}

  void requestDialog(DialogRequest dialogRequest) {
    _dialogRequestList.add(dialogRequest);
    try {
      if (navigatorKey.currentContext == null) {
        throw Exception("Navigator context is null");
      }
      showDialog(
        context: navigatorKey.currentContext!,
        builder: (context) => dialogRequest.dialogWidget,
      ).then((value) {
        _dialogCompleter.complete(true);
        _dialogRequestList.remove(dialogRequest);
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

class DialogRequest {
  final int dialogId;
  final Widget dialogWidget;

  DialogRequest({required this.dialogId, required this.dialogWidget});
}
