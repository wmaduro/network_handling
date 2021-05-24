import 'package:flutter/material.dart';

class DialogUtil {
  // final BuildContext context;

  static final instance = DialogUtil._();

  DialogUtil._() {
    // this._init();
    // this._addInterceptor(InterceptorApi());
  }

  showAlertNoConnection(BuildContext context) {
    _showAlertBasic(context,
        title: 'Disconnected!',
        list: [Text('Please, check your internet access before continue.')]);
  }

  _showAlertBasic(BuildContext context,
      {String title = 'Attention!',
      List<Widget> list,
      String textButtonOk = 'Ok'}) async {
    if (list == null) {
      list = [Text('Somthing went wrong!')];
    }
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: list,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(textButtonOk),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // var instance(Context) =DialogHelper._(context);

}

// class DialogHelper2 {
//   BuildContext _context = null;
//   static final DialogHelper2 _instance = DialogHelper2._internal();

//   factory DialogHelper2(BuildContext context) {
//     if (_context == null){
//       _context = context;
//     }

//     return _instance;
//   }

//   DialogHelper2._internal() {
//     // initialization logic
//   }
// }
