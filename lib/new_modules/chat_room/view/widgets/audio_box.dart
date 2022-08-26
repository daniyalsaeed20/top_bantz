import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_bantz/models/UserModel.dart';
import 'package:top_bantz/new_modules/chat_room/constants/custom_colors.dart';
import 'package:top_bantz/new_modules/chat_room/models/chat_message_model.dart';
import 'package:top_bantz/new_modules/chat_room/view/widgets/custom_text.dart';

class AudioBox extends StatefulWidget {
  AudioBox({Key? key, required this.messageModel, required this.userModel})
      : super(key: key);

  ChatMessageModel messageModel;
  UserModel userModel;

  @override
  State<AudioBox> createState() => _AudioBoxState(
        url: messageModel.message,
        userModel: userModel,
      );
}

class _AudioBoxState extends State<AudioBox> {
  _AudioBoxState({
    required this.url,
    required this.userModel,
  });
  UserModel userModel;
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool isAudioLoading = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  IconData playIcon = Icons.play_arrow;

  double playbackRate = 1.0;

  String url;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetchAudio();
    audioPlayer.setPlaybackRate(playbackRate);
    onPlayerStateChanged();
    onAudioDurationChanged();
    onAudioPositionChanged();
  }

  // Future fetchAudio() async {
  //   await audioPlayer.setSourceUrl(url);
  // }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.messageModel.send_by == userModel.fullname
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 16,
          left: widget.messageModel.send_by == userModel.fullname ? 48 : 16,
          right: widget.messageModel.send_by == userModel.fullname ? 16 : 48,
          top: 8,
        ),
        child: Container(
          height: 83.h,
          width: 250.w,
          decoration: BoxDecoration(
            color: widget.messageModel.send_by != userModel.fullname
                ? CustomColors.backGroundColor
                : CustomColors.themeColor,
            boxShadow: [
              BoxShadow(
                color: CustomColors.blackColor.withOpacity(0.5),
                blurRadius: 5,
                spreadRadius: 3,
                offset: const Offset(0, 3),
              )
            ],
            border: Border.all(
              width: 2,
              color: widget.messageModel.send_by == userModel.fullname
                  ? CustomColors.backGroundColor
                  : CustomColors.themeColor,
            ),
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.multitrack_audio,
                  color: widget.messageModel.send_by == userModel.fullname
                      ? CustomColors.backGroundColor
                      : CustomColors.themeColor,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    CustomText(
                      text: formatTime(duration: position),
                      fontSize: 16.sp,
                      color: widget.messageModel.send_by == userModel.fullname
                          ? CustomColors.backGroundColor
                          : CustomColors.themeColor,
                    ),
                    if (isAudioLoading)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: SizedBox(
                          height: 20.h,
                          width: 20.w,
                          child: CircularProgressIndicator(
                            strokeWidth: 1,
                            color: widget.messageModel.send_by ==
                                    userModel.fullname
                                ? CustomColors.backGroundColor
                                : CustomColors.themeColor,
                          ),
                        ),
                      ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    if (url == 'null')
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: SizedBox(
                          height: 20.h,
                          width: 20.w,
                          child: CircularProgressIndicator(
                            strokeWidth: 1,
                            color: widget.messageModel.send_by ==
                                    userModel.fullname
                                ? CustomColors.backGroundColor
                                : CustomColors.themeColor,
                          ),
                        ),
                      ),
                    if (url != 'null')
                      InkWell(
                        onTap: () async {
                          if (isPlaying) {
                            await audioPlayer.pause();
                            setState(() {
                              playIcon = Icons.play_arrow;
                            });
                          } else {
                            await audioPlayer.play(url);
                            setState(() {
                              playIcon = Icons.pause;
                            });
                          }
                        },
                        child: Icon(
                          playIcon,
                          color:
                              widget.messageModel.send_by == userModel.fullname
                                  ? CustomColors.backGroundColor
                                  : CustomColors.themeColor,
                        ),
                      ),
                    if (isPlaying)
                      InkWell(
                        onTap: () async {
                          await audioPlayer.stop();
                          setState(() {
                            isPlaying = false;
                            position = Duration.zero;
                            playIcon = Icons.play_arrow;
                          });
                        },
                        child: const Icon(
                          Icons.stop,
                          color: Colors.red,
                        ),
                      ),
                  ],
                ),
                InkWell(
                  onTap: () async {
                    setState(() {
                      if (playbackRate == 1.0) {
                        playbackRate = 1.5;
                      } else if (playbackRate == 1.5) {
                        playbackRate = 2.0;
                      } else if (playbackRate == 2.0) {
                        playbackRate = 3.0;
                      } else if (playbackRate == 3.0) {
                        playbackRate = 0.5;
                      } else if (playbackRate == 0.5) {
                        playbackRate = 1.0;
                      }
                    });
                    await audioPlayer.setPlaybackRate(playbackRate);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 2.h,
                      horizontal: 5.w,
                    ),
                    decoration: BoxDecoration(
                      color: widget.messageModel.send_by != userModel.fullname
                          ? CustomColors.backGroundColor
                          : CustomColors.themeColor,
                      border: Border.all(
                        width: 2,
                        color: widget.messageModel.send_by == userModel.fullname
                            ? CustomColors.backGroundColor
                            : CustomColors.themeColor,
                      ),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: CustomText(
                      text: playbackRate.toStringAsFixed(1),
                      fontSize: 16.sp,
                      color: widget.messageModel.send_by == userModel.fullname
                          ? CustomColors.backGroundColor
                          : CustomColors.themeColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String formatTime({required Duration duration}) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }

  onPlayerStateChanged() {
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
        isAudioLoading = state == PlayerState.PLAYING;
        if (PlayerState.COMPLETED == state) {
          position = Duration.zero;
          playIcon = Icons.play_arrow;
        }
      });
    });
  }

  onAudioDurationChanged() {
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
  }

  onAudioPositionChanged() {
    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
        isAudioLoading = false;
      });
    });
  }
}
