import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_bantz/new_modules/chat_room/constants/custom_colors.dart';

class ChatRoomTextField extends StatelessWidget {
  ChatRoomTextField({
    Key? key,
    required this.title,
    required this.controller,
  }) : super(key: key);
  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      controller: controller,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: CustomColors.textDarkColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      cursorColor: CustomColors.textMediumColor,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            color: const Color(0xFFF5F5F5),
            width: 2.r,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            color: const Color(0xFFF5F5F5),
            width: 2.r,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 0.0,
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            color: const Color(0xFFF5F5F5),
            width: 2.r,
          ),
        ),
        fillColor: const Color(0xFFF5F5F5),
        filled: true,
        focusColor: const Color(0xFFF5F5F5),
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
