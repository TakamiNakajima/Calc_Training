import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AudioPlayer _audioPlayer;

  List<String> _text = [
    "おめでとうございます",
    "合格です",
    "よくできました",
    "残念でした",
    "不合格です",
    "頑張りましょう",
  ];

  List<String> _soundPaths = [
    "assets/sounds/sound1.mp3",
    "assets/sounds/sound2.mp3",
    "assets/sounds/sound3.mp3",
    "assets/sounds/sound4.mp3",
    "assets/sounds/sound5.mp3",
    "assets/sounds/sound6.mp3",
  ];

  @override
  void initState() {
    super.initState();
    _initSounds();
  }

  void _initSounds() async {
    await _audioPlayers[0].setAsset(_soundPaths[0]);
    await _audioPlayers[1].setAsset(_soundPaths[1]);
    await _audioPlayers[2].setAsset(_soundPaths[2]);
    await _audioPlayers[3].setAsset(_soundPaths[3]);
    await _audioPlayers[4].setAsset(_soundPaths[4]);
    await _audioPlayers[5].setAsset(_soundPaths[5]);
  }

  List<AudioPlayer> _audioPlayers = [
    AudioPlayer(),
    AudioPlayer(),
    AudioPlayer(),
    AudioPlayer(),
    AudioPlayer(),
    AudioPlayer(),
  ];

  @override
  void dispose() {
    _audioPlayers[0].dispose();
    _audioPlayers[1].dispose();
    _audioPlayers[2].dispose();
    _audioPlayers[3].dispose();
    _audioPlayers[4].dispose();
    _audioPlayers[5].dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ツッコミマシーン"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: _soundButton(0),
                  ),
                  Expanded(
                    flex: 1,
                    child: _soundButton(1),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: _soundButton(2),
                  ),
                  Expanded(
                    flex: 1,
                    child: _soundButton(3),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: _soundButton(4),
                  ),
                  Expanded(
                    flex: 1,
                    child: _soundButton(5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _soundButton(int index) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => _playSound(index),
        child: Text(_text[index]),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.brown,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
    );
  }

  _playSound(int index) async {
    await _audioPlayers[index].seek(Duration.zero);
    _audioPlayers[index].play();
  }
}
