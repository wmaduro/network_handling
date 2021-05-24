import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_handling/api_repository.dart';
import 'package:network_handling/bloc/movie/movie.dart';
import 'package:network_handling/controllers/connection_controller.dart';
import 'package:network_handling/features/login_page.dart';
import 'package:network_handling/features/no_connetion_page.dart';
import 'package:network_handling/model/movie_response.dart';
import 'package:network_handling/services/network_exceptions.dart';

import 'bloc/movie/movie.dart';
import 'features/home_page.dart';
import 'features/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // StreamSubscription<ConnectivityResult> _connectiveSubscription;

  // @override
  // void initState() {
  //   super.initState();

  //   _connectiveSubscription = Connectivity()
  //       .onConnectivityChanged
  //       .listen((ConnectivityResult result) {
  //     print('*************** $result | $context');

  //     switch (result) {
  //       case ConnectivityResult.none:
  //         // Navigator. pushNamed(
  //         //   context,
  //         //   '/no_connection',
  //         // );
  //         break;
  //       // case ConnectivityResult.wifi:
  //       //   break;
  //       // case ConnectivityResult.mobile:
  //       //   break;
  //       default:
  //       // Navigator.pushNamed(
  //       //   context,
  //       //   '/home',
  //       // );
  //     }
  //   });
  // }

  // @override
  // dispose() {
  //   super.dispose();

  //   _connectiveSubscription.cancel();
  // }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieCubit>(
          create: (BuildContext context) {
            return MovieCubit(apiRepository: APIRepository());
          },
          child: MyHomePage(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: NoConnectionPage(),
        routes: {
          //  '/': (context) => MyHomePage(),
          '/': (context) => SplashPage(),
          '/home': (context) => MyHomePage(),
          '/login': (context) => LoginPage(),
          // '/no_connection': (context) => NoConnectionPage(),
        },
      ),
    );
  }
}
