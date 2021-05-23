import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_handling/api_repository.dart';
import 'package:network_handling/bloc/movie/movie.dart';
import 'package:network_handling/features/no_connetion_view.dart';
import 'package:network_handling/model/movie_response.dart';
import 'package:network_handling/services/network_exceptions.dart';

import 'bloc/movie/movie.dart';
import 'features/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
          '/': (context) => SplashPage(),
          '/home': (context) => MyHomePage(),
          '/no_connection': (context) => NoConnectionPage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StreamSubscription<ConnectivityResult> _connectiveSubscription;

  @override
  void initState() {
    super.initState();

    _connectiveSubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      switch (result) {
        case ConnectivityResult.none:
          break;
        case ConnectivityResult.wifi:
          break;
        case ConnectivityResult.mobile:
          break;
        default:
      }
      context.bloc<MovieCubit>().loadMovies();
      print('*************** ${result}');
    });
  }

  @override
  dispose() {
    super.dispose();

    _connectiveSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
      ),
      body: BlocBuilder<MovieCubit, ResultState<dynamic>>(
        builder: (BuildContext context, ResultState<dynamic> state) {
          return state.when(
            loading: () {
              print('loadng...');
              return Center(child: CircularProgressIndicator());
            },
            idle: () {
              print('idle...');
              return Container();
            },
            data: (dynamic data) {
              print('data ... ${data.length}');
              return dataWidget(data);
            },
            error: (NetworkExceptions error) {
              print('error ... ${error}');
              return Center(
                  child: Text(NetworkExceptions.getErrorMessage(error)));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _pressFloatingActionbutton();
        },
        child: const Icon(Icons.navigation),
        backgroundColor: Colors.green,
      ),
    );
  }

  _pressFloatingActionbutton() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      print('******** SEM NONEXAO ');
    } else {
      setState(() {
        context.bloc<MovieCubit>().loadMovies();
      });
    }
  }

  Widget dataWidget(List<Movie> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 300,
          width: 300,
          child: Card(
            elevation: 1,
            child: Image.network(
              "https://image.tmdb.org/t/p/w342${data[index].posterPath}",
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace stackTrace) {
                print('----->>>>> errrorr | $exception | $stackTrace');
                return Text('-----');
              },
            ),
          ),
        );
      },
    );
  }
}
