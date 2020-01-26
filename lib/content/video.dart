import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

// final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
// final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

class ChewieListItem extends StatefulWidget{
  final VideoPlayerController videoPlayerController;
  final bool looping;

  ChewieListItem({
    @required this.videoPlayerController,
    this.looping,
    Key key,
  }) : super(key:key);

  @override
  _ChewieListItemState createState() => _ChewieListItemState();
  }
  

class _ChewieListItemState extends State<ChewieListItem> {
  ChewieController _chewieController;

  @override
  void initState(){
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      looping: widget.looping,
      errorBuilder: (context, errorMessage){
        return Center(
          child: Text(errorMessage,style: TextStyle(color: Colors.white),),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(0.8),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }

  @override
  void dispose(){
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
    
  }

}
void video(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('วีดีโอสอน'),
        ),
        body: ListView(
          children: <Widget>[
            ChewieListItem(
              videoPlayerController: VideoPlayerController.asset('assets/videos/1.mp4'),
              looping: true,
            ),
            ChewieListItem(
              videoPlayerController: VideoPlayerController.asset('assets/videos/2.mp4'),
              looping: true,
            ),
            ChewieListItem(
              videoPlayerController: VideoPlayerController.asset('assets/videos/3.mp4'),
              looping: true,
            ),
          ],
        )
      );
    },
  ));
}