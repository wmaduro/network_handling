import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class NoConnectionPage extends StatelessWidget {
  const NoConnectionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 300,
          ),
          Text('Unfortunately you are not connected in the internet.'),
          SizedBox(
            height: 100,
          ),
          FlatButton(
            child: Text(
              'Refresh',
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () async {
              var connectivityResult =
                  await (Connectivity().checkConnectivity());

              if (connectivityResult != ConnectivityResult.none) {
                Navigator.pushNamed(
                  context,
                  '/home',
                );
              }
            },
          ),
        ],
      )),
    );
  }
}
