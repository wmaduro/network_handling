import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_handling/utils/dialog_utils.dart';
import 'package:network_handling/utils/function_utils.dart';

import '../api_repository.dart';
import '../bloc/movie/movie_cubit.dart';
import '../bloc/movie/result_state.dart';
import '../model/movie_response.dart';
import '../services/network_exceptions.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    performNetworkRequest(() => _refreshMovies(), context);
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
          performNetworkRequest(() => _refreshMovies(), context);
        },
        child: const Icon(Icons.navigation),
        backgroundColor: Colors.green,
      ),
    );
  }

  // static Route<Object> _dialogBuilder(BuildContext context, Object arguments) {
  //   return DialogRoute<void>(
  //     context: context,
  //     builder: (BuildContext context) =>
  //         const AlertDialog(title: Text('FUDEU NO CONNECTION')),
  //   );
  // }

  

  _refreshMovies() {
    // var connectivityResult = await (Connectivity().checkConnectivity());

    // if (connectivityResult == ConnectivityResult.none) {
    //   print('******** SEM NONEXAO ');
    //   // Navigator.of(context).restorablePush(_dialogBuilder);

    //   DialogUtil.instance.showAlertBasic(context);
    // } else {
    //   setState(() {
    context.bloc<MovieCubit>().loadMovies();
    // });
    // }
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
