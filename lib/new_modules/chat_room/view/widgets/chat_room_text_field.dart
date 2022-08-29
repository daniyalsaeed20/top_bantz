import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_bantz/new_modules/chat_room/constants/custom_colors.dart';
import 'package:top_bantz/new_modules/chat_room/controller/recording_controller.dart';
import 'package:top_bantz/new_modules/chat_room/view/group_chat_screen.dart';

class ChatRoomTextField extends StatelessWidget {
  ChatRoomTextField({
    Key? key,
    required this.title,
    required this.controller,
    required this.recording,
    required this.groupChatId,
  }) : super(key: key);
  final String title;
  final TextEditingController controller;
  final RecordingController recording;
  final String groupChatId;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: CustomColors.textLightColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      cursorColor: CustomColors.textLightColor,
      decoration: InputDecoration(
        suffixIcon: InkWell(
          onTap: () => openPanel(
            recording: recording,
            groupchatId: groupChatId,
          ),
          child: Icon(
            Icons.more_vert,
            color: CustomColors.textLightColor,
            size: 45.r,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: const Color(0xFFEDEDED).withOpacity(0.2),
            width: 2.r,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: const Color(0xFFEDEDED).withOpacity(0.2),
            width: 2.r,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 0.0,
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: const Color(0xFFEDEDED).withOpacity(0.2),
            width: 2.r,
          ),
        ),
        fillColor: const Color(0xFFEDEDED).withOpacity(0.2),
        filled: true,
        focusColor: const Color(0xFFEDEDED).withOpacity(0.2),
        isDense: true,
        hintText: title,
        hintStyle: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: CustomColors.textLightColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
