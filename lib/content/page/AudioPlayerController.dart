import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:rxdart/rxdart.dart';

import 'AudioPlayer.dart';

class AudioPlayerController extends BlocBase{

  BehaviorSubject<AudioPlayerObj> durB = new BehaviorSubject<AudioPlayerObj>();

  Stream<AudioPlayerObj> get outPlayer => durB.stream;
  Sink<AudioPlayerObj> get inPlayer => durB.sink;

  AudioPlayer advancedPlayer = new AudioPlayer();
  
  AudioPlayerObj audioObj;

  AudioPlayerController(){
    audioObj = new AudioPlayerObj(advancedPlayer,
    new AudioCache(fixedPlayer: advancedPlayer),'',0,
    new Duration(), new Duration(),
    '',false,'','');

    audioObj.advancedPlayer.onDurationChanged.listen((Duration d){
      audioObj.duration = d;
      inPlayer.add(audioObj);
    });

    audioObj.advancedPlayer.onAudioPositionChanged.listen((Duration p){
      audioObj.position = p;
      inPlayer.add(audioObj);
    });

    // audioObj.musicaAtual = "a.mp3";
    audioObj.musicaAtual = "จังหวะ.mp3";
    audioObj.musicaAtual = "เพลง.mp3";
    // audioObj.photo = "music.jpg";


    inPlayer.add(audioObj);
  }

  

  botaoPlayPause(){
    if (audioObj.play) {
      audioObj.play = false;
      audioObj.advancedPlayer.pause();
    } else {
      audioObj.play = true;
      audioObj.audioCache.play(audioObj.musicaAtual);
    }
    inPlayer.add(audioObj);
  }
  trocarMusica(String musica) {
    audioObj.musicaAtual = musica;
    print(musica);

    audioObj.audioCache.play(audioObj.musicaAtual);
    audioObj.play = true;
    inPlayer.add(audioObj);
  }

  tempoMusica(double newValue){
    Duration newDuration = Duration(seconds: newValue.toInt());

    audioObj.advancedPlayer.seek(newDuration);

    audioObj.tempoMusica = newValue.toStringAsFixed(0);
    audioObj.advancedPlayer.resume();
    audioObj.play = true;
    inPlayer.add(audioObj);
    print(newValue.toInt());
  }



  @override
  void dispose() {
    // TODO: implement dispose
  }

}

AudioPlayerController audioC = new AudioPlayerController();