import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_bantz/new_modules/chat_room/constants/custom_colors.dart';
import 'package:top_bantz/new_modules/chat_room/view/widgets/custom_text.dart';

class MultiMediaOption extends StatelessWidget {
  MultiMediaOption({
    required this.icon,
    required this.title,
    Key? key,
  }) : super(key: key);

  IconData icon;
  String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(3.r),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: CustomColors.blackColor.withOpacity(0.5),
              blurRadius: 0,
              spreadRadius: 0,
              offset: const Offset(0, 0),
            )
          ],
          border: Border.all(
            width: 2,
            color: CustomColors.backGroundColor,
          ),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: CustomColors.backGroundColor,
            ),
            CustomText(
              text: title,
              fontSize: 16.sp,
              color: CustomColors.backGroundColor,
            ),
          ],
        ),
      ),
    );
  }
}
