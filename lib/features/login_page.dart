import 'package:flutter/material.dart';
import 'package:network_handling/utils/function_utils.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Movies"),
        ),
        body: _body());
  }

  Widget _body() {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 300,
          ),
          TextField(onChanged: (value) {}),
          SizedBox(
            height: 30,
          ),
          FlatButton(
              onPressed: () {
                performNetworkRequest(() {}, context);
              },
              child: Text('Login')),
        ],
      ),
    );
  }
}
