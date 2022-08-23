import 'package:flutter/cupertino.dart';
import 'package:flutter_sound_lite/public/flutter_sound_player.dart';
import 'package:top_bantz/new_modules/audio_texts/sound_recorder.dart';

class SoundPlayer {
  FlutterSoundPlayer? _audioPlayer;

  bool get isPlaying => _audioPlayer!.isPlaying;

  Future init() async {
    _audioPlayer = FlutterSoundPlayer();

    await _audioPlayer!.openAudioSession();
  }

  Future dispose() async {
    await _audioPlayer!.closeAudioSession();
    _audioPlayer = null;
  }

  Future _play(VoidCallback whenFinished, url) async {
    await _audioPlayer!.startPlayer(
      fromURI: url,
      whenFinished: whenFinished,
    );
  }

  Future _stop() async {
    await _audioPlayer!.stopPlayer();
  }

  Future togglePlaying(
      {required VoidCallback whenFinished, required String url}) async {
    if (_audioPlayer!.isStopped) {
      await _play(whenFinished, url);
    } else {
      await _stop();
    }
  }
}
