import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:music/supplements/photohero.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'AudioPlayerController.dart';
import 'package:project_cpr/content/page/AudioPlayer.dart';
import 'package:project_cpr/content/page/AudioPlayerController.dart';
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
      _tela = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
            centerTitle: true,
            title: Text('AudioPlayer'),
          ),
          body: Column(children: <Widget>[
            Container(

            ),
            localAsset()
          ],)
          
    );
  }

  Widget _tab(List<Widget> children) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: children
              .map((w) => Container(child: w, padding: EdgeInsets.all(6.0)))
              .toList(),
        ),
      ),
    );
  }

  Widget localAsset() {
    return Column(
      children: <Widget>[
        StreamBuilder(
          stream: audioController.outDuration,
          builder: (context, AsyncSnapshot<AudioPlayerObjeto> snapshot) {
            if(snapshot.hasData){
            return SingleChildScrollView(
              child: _tab([
                Text(snapshot.data.musicaAtual, style: TextStyle(fontSize: _tela * .05,color: Colors.white),),
                slider(snapshot.data),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(_retornarTempoMusica(snapshot.data.position,),style: TextStyle(color: Colors.white  ),),
                    Text(snapshot.data.duration.inMinutes.toString() + ":" + (snapshot.data.duration.inSeconds - (snapshot.data.duration.inMinutes * 60)).toString(),style: TextStyle(color: Colors.white),),              ],
                ),
                Text(_retornarTempoMusica(snapshot.data.position), style: TextStyle(fontSize: _tela * 0.05,color: Colors.white),),
                Divider(),
                acoes(snapshot.data),



              ]),
            );
          }else{
              return Container();
            }
          }
        ),
        Divider(),
        listaMusica("a.mp3"),
        listaMusica("b.mp3"),
        
        Divider(),
      ],
    );
  }

  Widget listaMusica(String musica){

    return ListTile(
      title: Text(musica,style: TextStyle(color: Colors.white,),),
      leading: Icon(Icons.music_note,color: Colors.white,),

      onTap: (){
        audioController.trocarMusica(musica);

      },
    );
  }


  String _retornarTempoMusica(Duration position) {
    String segundos = (position.inMinutes >= 1
            ? ((position.inSeconds - position.inMinutes * 60))
            : position.inSeconds)
        .toString();

    if (position.inSeconds < 10) {
      segundos = "0" + segundos;
    }
    return position.inMinutes.toString() + ":" + segundos;
  }

  Widget acoes(AudioPlayerObjeto objeto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
            iconSize: _tela * .1,color: Colors.white,
            icon: Icon(Icons.skip_previous),
            onPressed: () {
            }),

        IconButton(
            iconSize: _tela * .2,color: Colors.white,
            icon: Icon(objeto.play == true
                ? Icons.pause_circle_filled
                : Icons.play_circle_filled),
            onPressed: () {
              audioController.botaoPlayPause();

            }),
        IconButton(
            iconSize: _tela * .1,color: Colors.white,
            icon: Icon(Icons.skip_next),
            onPressed: () {
             
            }),
      ],
    );
  }

  Widget slider(AudioPlayerObjeto objeto) {
    return Slider(
        activeColor: Colors.amber,
        onChanged: (newValue) {
            print(newValue);
           audioController.tempoMusica(newValue);
            print(objeto.position.inSeconds.toDouble());
        },
        value: objeto.position.inSeconds.toDouble(),
        min: 0.0,
        max: objeto.duration.inSeconds.toDouble());
  }

}


