// import 'dart:async';

// import 'package:connectivity/connectivity.dart';
// import 'package:flutter/material.dart';
// import 'package:rx_notifier/rx_notifier.dart';

// class ConnectionController {
//   StreamSubscription<ConnectivityResult> _connectiveSubscription;

//   var _status = RxNotifier<bool>(false);
//   RxNotifier<bool> get status => _status;

//   ConnectionController() {
//     _connectiveSubscription = Connectivity()
//         .onConnectivityChanged
//         .listen((ConnectivityResult result) {
//       print('*************** ${result}');

//       switch (result) {
//         case ConnectivityResult.none:
//           // Navigator.pushNamed(
//           //   context,
//           //   '/no_connection',
//           // );

//           _status.value = false;
//           break;
//         // case ConnectivityResult.wifi:
//         //   break;
//         // case ConnectivityResult.mobile:
//         //   break;
//         default:
//         _status.value = true;
//           // Navigator.pushNamed(
//           //   context,
//           //   '/home',
//           // );
//       }
//     });
//   }
// }
