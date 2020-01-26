import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';


class AudioPlayerObj {
  AudioPlayer _advancedPlayer;
  AudioCache _audioCasche;
  String _localFilePath;
  double _sliderVal;
  Duration _duration;
  Duration _position;
  String _tempoMusica = " ";
  bool _play = false;
  String _musicaAtual = "";
  String _photo = "";

  AudioPlayerObj(this._advancedPlayer,this._audioCasche,this._localFilePath,this._sliderVal
  ,this._duration,this._position,this._tempoMusica,this._play,this._musicaAtual,this._photo);
  
  String get musicaAtual => _musicaAtual;

  set musicaAtual(String value){
    _musicaAtual=value;
  }

  String get photo => _photo;

  set photo(String value){
    _photo=value;
  }
  
  bool get play => _play;

  set play(bool value){
    _play = value;
  }

  String get tempoMusica => _tempoMusica;

  set tempoMusica(String value){
    _tempoMusica = value;
  }

  Duration get position => _position;
  set position(Duration value){
    _position = value;
  }

  Duration get duration => _duration;
  set duration(Duration value){
    _duration = value;
  }

  double get SliderVal => _sliderVal;

  set sliderVar(double value){
    _sliderVal = value;
  }

  String get localFilePath => _localFilePath;

  set localFilePath(String value){
    _localFilePath = value;
  }

  AudioCache get audioCache => _audioCasche;
  set audioCache(AudioCache value){
    _audioCasche = value;
  }

  AudioPlayer get advancedPlayer => _advancedPlayer;

  set advancedPlayer(AudioPlayer value){
    _advancedPlayer = value;
  }

}
