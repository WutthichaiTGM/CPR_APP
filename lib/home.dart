import 'package:flutter/material.dart';
import 'content/1669.dart';
import 'content/heartpump.dart';
import 'content/help.dart';
import 'content/video.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

void tmpFunction() {
  print('Function Called.');
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            'CPR',
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/wa.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListView(children: <Widget>[
              Card(
                child: new InkWell(
                  onTap: () {
                    call(context);
                  },
                  child: Container(
                    child:
                        Image.asset('assets/images/one.jpg', fit: BoxFit.cover),
                  ),
                ),
              ),
              Card(
                child: new InkWell(
                  onTap: () {
                    helps(context);
                  },
                  child: Container(
                    child:
                        Image.asset('assets/images/Tow.png', fit: BoxFit.cover),
                  ),
                ),
              ),
              Card(
                child: new InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Homepage()),
                    );
                  },
                  child: Container(
                    child: Image.asset('assets/images/three.png',
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Card(
                child: new InkWell(
                  onTap: () {
                    video(context);
                  },
                  child: Container(
                    child: Image.asset('assets/images/video.png',
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ]),
          ],
        ));
  }
}
