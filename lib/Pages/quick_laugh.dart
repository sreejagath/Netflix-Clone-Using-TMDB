import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class QuickLaughs extends StatefulWidget {
  const QuickLaughs({Key? key}) : super(key: key);

  @override
  _QuickLaughsState createState() => _QuickLaughsState();
}

class _QuickLaughsState extends State<QuickLaughs> {
  VideoPlayerController? _controller;
  late Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    _controller!.initialize().then((_) {
      setState(() {
        _controller!.play();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          //fullscreen video playing
          Stack(children: [
            Transform.scale(
              scale: _controller!.value.aspectRatio / deviceRatio,
              child: Center(
                child: AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: VideoPlayer(_controller!),
                ),
              ),
            ),
            Positioned(
              right: 10,
              //bottom: -5,
              child: Column(
                children: [
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.emoji_emotions,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      Text('LOL'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      Text('My List'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      Text('Share'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      Text('Play'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ]),
          // Container(
          //   child: _controller!.value.isInitialized
          //       ? AspectRatio(
          //           //aspectRatio: ,
          //           aspectRatio: _controller!.value.aspectRatio,
          //           child: VideoPlayer(_controller!),
          //         )
          //       : Container(),
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //     setState(() {
          //       _controller!.value.isPlaying
          //           ? _controller!.pause()
          //           : _controller!.play();
          //     });
          //   },
          //   child: Text(_controller!.value.isPlaying ? 'Pause' : 'Play'),
          //   //child: Text('Play'),
          // ),
        ],
      ),
    );
  }
}
