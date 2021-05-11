import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'View/home_store.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType){
        return MaterialApp(home: MyHomePage());
      },
    );
  }

}

