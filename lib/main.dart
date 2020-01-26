import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'home.dart';

// void main() => runApp(
//   MyApp()
//   );

void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//             scaffoldBackgroundColor: Color(0xffe9ebee),
//             primaryColor: Colors.blue,
//             accentColor: Colors.pinkAccent),
//         title: 'Your App Name',
//         home: HomeScreen());
//     //   title: 'Flutter Demo',
//     //   theme: ThemeData(
//     //     primarySwatch: Colors.blue,
//     //   ),
//     //   home: MyHomePage(title: 'Flutter Demo Home Page'),
//     // );
    

//   }
// }
  
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var text = new Text('ยินดีต้อนรับสู่ CPR(TH)', textAlign: TextAlign.center,
        style: new TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 30
        ),
      );
    return new SplashScreen(
      seconds: 2,
      navigateAfterSeconds: new HomeScreen(),
      title: text,
      image: Image.asset('assets/images/Splash.png'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("Flutter Egypt"),
      loaderColor: Colors.red,
    );
  }
}