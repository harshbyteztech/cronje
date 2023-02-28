import 'package:cronje/utils/app_color.dart';
import 'package:cronje/utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utils/text_style.dart';

class CustomButton extends StatelessWidget {

  GestureTapCallback? onTap;
  String? text;

  CustomButton({this.onTap,this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        height: 60,
        margin: const EdgeInsets.all(20.0),
        width: double.infinity,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: mainColor, borderRadius: BorderRadius.circular(10.0)),
        child: Center(
          child: Text(
            text!,
            style: TextStyleWidget.regularTextStyle1(
                color: whiteColor, fontSize: 5.0.w),
          ),
        ),
      ),
    );
  }
}

class CustomButtonWithIcon extends StatelessWidget {

  GestureTapCallback? onTap;
  IconData? icon;
  String? text;

  CustomButtonWithIcon({this.onTap,this.icon,this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        height: 60,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: mainColor, borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,size: 25,color: whiteColor),
            SizedBox(width: 10,),
            Text(
              text?? "",
              style: TextStyleWidget.regularTextStyle1(
                  color: whiteColor, fontSize: 4.w),
            ),
          ],
        ),
      ),
    );
  }
}
