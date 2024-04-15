import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/song.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [
   
         Song(
        songName: "Odamlar nima deydi?",
        artistName: "Konsta & Timur.A",
        albumArtImagePath: "assets/images/odam.jpg",
        audioPath: "audios/odamlar.mp3"),
          Song(
        songName: "Sevmayman dushanbadan",
        artistName: "Jaloliddin",
        albumArtImagePath: "assets/images/jalol.jpg",
        audioPath: "audios/jalol.mp3"),
           Song(
        songName: "Dadam",
        artistName: "Ulugbek rahmatullayev",
        albumArtImagePath: "assets/images/dadam.jpg",
        audioPath: "audios/dadam.mp3"),
           Song(
        songName: "Yolgonchi",
        artistName: "Jaloliddin",
        albumArtImagePath: "assets/images/jalol.jpg",
        audioPath: "audios/jalol.mp3"), Song(
        songName: "Men sen",
        artistName: "Yulduz",
        albumArtImagePath: "assets/images/yuldz.jpg",
        audioPath: "audios/yulya.mp3"),
    Song(
        songName: "Janona",
        artistName: "Lil huramov",
        albumArtImagePath: "assets/images/lil.jpeg",
        audioPath: "audios/lil.mp3"),
    Song(
        songName: "Janona ",
        artistName: " Umida",
        albumArtImagePath: "assets/images/rasm.jpg",
        audioPath: "audios/yulya.mp3"),
    Song(
        songName: "As fi",
        artistName: "Saadlam Jarred",
        albumArtImagePath: "assets/images/saad.jpg",
        audioPath: "audios/saad.mp3"),
  ];
  //current song playing index
  int? _currentSongIndex;

/*
A U D I O P L A Y E R
*/

//AUDIO PLAYER
  final AudioPlayer _audioPlayer = AudioPlayer();

//DURATION
  Duration _currentDruration = Duration.zero;
  Duration _totalDruration = Duration.zero;
//CONSTRUKTOR
  PlaylistProvider() {
    listenToDuration();
  }
//INITLY NOT PLAYING

  bool _isPlaying = false;

//PLAY THE SONG
  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop(); //stop current song
    await _audioPlayer.play(AssetSource(path)); //play the new song
    _isPlaying = true;
    notifyListeners();
  }

//pause current song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

//resumne playong
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

//pause or resume
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  //seek
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  //play next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        currentSongIndex = 0;
      }
    }
  }

//play previouns song
  void playPreviounsSong() async {
    if (_currentDruration.inSeconds > 2) {
      seek(Duration.zero);
    }
//if its
    else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        currentSongIndex = _playlist.length - 1;
      }
    }
  }

//listen to duration
  void listenToDuration() {
    //list for total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDruration = newDuration;
      notifyListeners();
    });

    //hghg
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDruration = newPosition;
      notifyListeners();
    });
    //hghg
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDruration;
  Duration get totalDuration => _totalDruration;

  set currentSongIndex(int? newIndex) {
    //update current song
    _currentSongIndex = newIndex;
    if (newIndex != null) {
      play(); //play the song at the new index
    }
    //update ui
    notifyListeners();
  }
}
