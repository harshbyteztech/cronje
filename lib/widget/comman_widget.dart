import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utils/app_color.dart';
import '../utils/text_style.dart';

rowWidget(String text, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.start,
            style: TextStyleWidget.regularTextStyle1(
                fontSize: 4.w, height: 1.2, color: blackColor),
          ),
        ),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.end,
            overflow: TextOverflow.clip,
            maxLines: 3,
            style: TextStyleWidget.regularTextStyle1(
                fontSize: 4.w, height: 1.2, color: blackColor),
          ),
        ),
      ],
    ),
  );
}

rowWidget1(String text, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.start,
            style: TextStyleWidget.mediumTextStyle1(
                fontSize: 4.w, height: 1.2, color: blackColor),
          ),
        ),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.end,
            overflow: TextOverflow.clip,
            maxLines: 3,
            style: TextStyleWidget.mediumTextStyle1(
                fontSize: 4.w, height: 1.2, color: blackColor),
          ),
        ),
      ],
    ),
  );
}

cardWidget({String? text, String? icon, GestureTapCallback? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Card(
      margin: const EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Image.asset(
              icon!,
              height: 10.w,
              width: 10.w,
            ),
            SizedBox(
              width: 4.w,
            ),
            Expanded(
              child: Text(
                text!,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyleWidget.regularTextStyle(
                    fontSize: 4.w, height: 1.2),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
