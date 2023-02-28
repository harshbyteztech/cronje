import 'package:cronje/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utils/app_asset.dart';
import '../utils/text_style.dart';

class AppBarWidget extends StatefulWidget {
  bool backPress;
  GestureTapCallback? onTap;
  int? page;
  AppBarWidget({Key? key, required this.backPress,this.onTap,this.page}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      color: whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          widget.backPress == true
              ? InkWell(
            onTap: widget.onTap,
                child: Image.asset(
                    AppAssetsImage.iconBack,
                    width: 10.w,
                    height: 10.w,
                  ),
              )
              : SizedBox(
            width: 10.w,
            height: 10.w,
                ),
         widget.page == 0 ?  Padding(
           padding: EdgeInsets.only(left: 10.w),
           child: Image.asset(
              AppAssetsImage.logoLand,
              width: 35.w,
              height: 8.h,
            ),
         ) :Padding(
            padding:  EdgeInsets.only(left: 10.w),
            child: Text(
             "Costs",
             textAlign: TextAlign.start,
             style: TextStyleWidget.regularTextStyle1(
                 fontSize: 6.w, color: blackColor),
         ),
          ),
          SizedBox(
            width: 8.h,
            height: 8.h,
          ),
        ],
      ),
    );
  }
}
