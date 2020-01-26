import 'package:flutter/material.dart';
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

void call(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('โทรฉุกเฉิน'),
        ),
        body: Center(
          child: Image.asset('assets/images/one.jpg'),
        ),
      );
    },
  ));
}