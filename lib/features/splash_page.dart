import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Future<void> initState() {
    super.initState();
    // Future.delayed(Duration(seconds: 2), () {
    //   _pressFloatingActionbutton();
    // });
  }

  _pressFloatingActionbutton() async {
    // var connectivityResult = await (Connectivity().checkConnectivity());

    // if (connectivityResult == ConnectivityResult.none) {
    //   Navigator.pushNamed(
    //     context,
    //     '/no_connection',
    //   );
    // } else {
    // Navigator.pushNamed(
    //   context,
    //   '/login',
    // );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Text('Hi, Wellcome!'),
          SizedBox(
            height: 200,
          ),
          FlatButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/home',
                );
              },
              child: Text('Home')),
          FlatButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/login',
                );
              },
              child: Text('Login'))
        ],
      )),
    );
  }
}
