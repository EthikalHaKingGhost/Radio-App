import 'dart:developer';
import 'package:flutter/material.dart';
// import 'package:http/http.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

final AudioPlayer _audioPlayer = AudioPlayer();

class RadioPlayer extends StatefulWidget {
  const RadioPlayer({super.key});

  @override
  State<RadioPlayer> createState() => _RadioPlayerState();
}

class _RadioPlayerState extends State<RadioPlayer> {
  bool _isPlaying = false;
  IconData musicIcon = Icons.play_arrow;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    playSong();
  }

  void playSong() {
    try {
      _audioPlayer.setAudioSource(
        AudioSource.uri(
          Uri.parse(
              "https://centova47.instainternet.com/proxy/hggradio?mp=/stream"),
          tag: MediaItem(
            id: '1',
            album: "radio_app_v2",
            title: "Live Stream",
            artUri: Uri.parse(
                'https://hggradio.ca/wp-content/uploads/2022/07/HGG-RADIO-GOLD-LOGO.png'),
          ),
        ),
      );
      //Start the audio onetime and set the pause button.
      setState(() {
        _audioPlayer.play();
        musicIcon = Icons.pause;
      });
      _isPlaying = true;
    } catch (e) {
      log("Error loading audio source: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.black, Colors.purple])),
      child: Scaffold(
        // By defaut, Scaffold background is white
        // Set its value to transparent
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Live Radio'),
          elevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.asset(
                  "assets/cover.jpg",
                  width: 250,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "radio_app_v2",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  overflow: TextOverflow.fade,
                  letterSpacing: 6,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 8.0,
                      color: Colors.purple,
                      offset: Offset(3.0, 4.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Live Stream",
                style: TextStyle(
                  color: Colors.white,
                  overflow: TextOverflow.fade,
                  fontSize: 16.0,
                  letterSpacing: 6,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              //https://centova47.instainternet.com/proxy/hggradio?mp=/stream
              InkWell(
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.black87,
                  child: IconButton(
                    icon: Icon(musicIcon),
                    onPressed: () {
                      setState(() {
                        if (_isPlaying) {
                          _audioPlayer.pause();
                          musicIcon = Icons.play_arrow;
                        } else {
                          _audioPlayer.play();
                          musicIcon = Icons.pause;
                        }
                        _isPlaying = !_isPlaying;
                      });
                    },
                    // icon: Icon(_isPlaying ? Icons.play_arrow : Icons.pause)),
                  ),
                ),
              ),
              //Thank you for choosing radio_app_v2, you can now minimize your app and play the stream in the brackground
            ],
          ),
        ),
      ),
    );
  }
}
