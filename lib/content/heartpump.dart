//import 'package:flutter/material.dart';
//final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));
//
//void heartpump(BuildContext context) {
//  Navigator.push(context, MaterialPageRoute(
//    builder: (BuildContext context) {
//      return Scaffold(
//        appBar: AppBar(
//          title: const Text('จังหวะการปั้มหัวใจ'),
//        ),
//        body: Image.asset('assets/images/icon_one.png',fit:BoxFit.contain,),
//      );
//    },
//  ));
//}
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
//import 'package:music/supplements/photohero.dart';
import 'page/AudioPlayer.dart';
import 'page/AudioPlayerController.dart';
import 'package:flutter/widgets.dart';


class Homepage extends StatefulWidget {
  Homepage([Key key, this.title,]):
        super(key: key);
  final String title;
  @override
  _Homepage createState() => _Homepage();

}

class _Homepage extends State<Homepage> with TickerProviderStateMixin {
  AnimationController animationControllerScreen;
  Animation animationScreen;

  @override
  void initSate(){
    super.initState();

    animationControllerScreen = AnimationController(duration: Duration(seconds: 2),
        vsync: this);
    animationScreen = Tween(begin: 1.0,end: 0.0).animate(animationControllerScreen);
  }


  double _tela;

  Widget build(BuildContext context) {
    timeDilation = 2.0;
    _tela = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title:
      Text("Music"),

      ),
      body:
      Column(
        children: <Widget>[

          _player(),
        ],


      ),);
  }
  Widget _tap(List<Widget> children){
    return Container(child: Column(
      children: children.map((c) => Container(
        child: c,
        padding: EdgeInsets.all(6),
      )).toList(),
    ),);
  }
  Widget _player(){
    return SingleChildScrollView(
        child: Column(children: <Widget>[
          StreamBuilder(
              stream: audioC.outPlayer,
              builder: (cxt, AsyncSnapshot<AudioPlayerObj> snapshot){
                return _tap([

                  Text(snapshot.data.musicaAtual,style: TextStyle(fontSize: _tela * 0.1)),

                  _slider(snapshot.data),
                  Row(mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _retornarTempoMusica(snapshot.data.position),
                      Text(snapshot.data.duration.inMinutes.toString()+ ":" + (snapshot.data.duration.inSeconds - (snapshot.data.duration.inMinutes * 60 )).toString()),
                    ],
                  ),Image.asset(""),
                  _retornarTempoMusica2(snapshot.data.position),
                  _acoes(snapshot.data),

                ]

                );
              }
          ),
          Divider(),
          _listaMusica("จังหวะ.mp3"),
          _listaMusica("เพลง.mp3"),
          Divider(),
        ])
    );
  }
  double temp = 0;

  Widget _slider(AudioPlayerObj objto){
    return Slider(
      activeColor: Colors.blue,
      value: objto.position.inSeconds.toDouble() ,
      max: objto.duration.inSeconds.toDouble(),
      // min: 0.0,
      onChanged: (newVal){
        audioC.tempoMusica(newVal);
        print(objto.position.inSeconds.toDouble());


      },
    );
  }
  Widget _retornarTempoMusica(Duration position){
    String segundos = (position.inMinutes >= 1
        ? ((position.inSeconds - position.inMinutes * 60))
        : position.inSeconds).toString();

    if (position.inSeconds < 10){
      segundos = "0" + segundos;
    }

    String tempoMusica = position.inMinutes.toString() + ":" +segundos;
    return Text(tempoMusica);
  }
  Widget _retornarTempoMusica2(Duration position){
    String segundos = (position.inMinutes >= 1
        ? ((position.inSeconds - position.inMinutes * 60))
        : position.inSeconds).toString();

    if (position.inSeconds < 10){
      segundos = "0" + segundos;
    }

    String tempoMusica = position.inMinutes.toString() + ":" +segundos;
    return Text(tempoMusica,style: TextStyle(fontSize: _tela * 0.1),);
  }

  Widget _acoes(AudioPlayerObj objto){
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(iconSize: _tela*.1,
          icon: Icon(Icons.skip_previous),
          onPressed: (){



          },),
        IconButton(iconSize: _tela*.2,
          icon: Icon(objto.play == true
              ? Icons.pause_circle_filled
              : Icons.play_circle_filled),
          onPressed: (){
            audioC.botaoPlayPause();

          },),
        IconButton(iconSize: _tela*.1,
          icon: Icon(Icons.skip_next),
          onPressed: (){



          },),
      ],);
  }

  Widget _listaMusica(String musica){
    print("list Music");
    return ListTile(
      title: Text(musica),
      leading: Icon(Icons.music_note),

      onTap: (){
        audioC.trocarMusica(musica);
      },
    );
  }
}


