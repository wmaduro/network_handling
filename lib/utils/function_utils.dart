import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

import 'dialog_utils.dart';

performNetworkRequest(Function runMethod, BuildContext context) async {
  var connectivityResult = await Connectivity().checkConnectivity();

  if (connectivityResult == ConnectivityResult.none) {
    DialogUtil.instance.showAlertNoConnection(context);
  } else {
    runMethod();
  }
}
