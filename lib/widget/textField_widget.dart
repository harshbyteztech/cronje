import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utils/app_color.dart';
import '../utils/text_style.dart';

class TextFieldWidget extends StatelessWidget {
  TextEditingController? controller;
  double? fontSize;
  double? contentPadding;
  String? hintText;
  bool? expands = false;
  int? maxLines;
  TextInputType? keyboardType;
  FormFieldValidator<String> validator;


  TextFieldWidget(
      {this.controller,
      this.hintText,
      this.fontSize,
      this.contentPadding,
      this.expands,
      this.maxLines,
      this.keyboardType,
      required this.validator,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60,
          width: double.infinity,
          child: TextFormField(
            controller: controller,
            textAlign: TextAlign.start,
            keyboardType: keyboardType,
            style: TextStyleWidget.regularTextStyle1(
                color: mainColor, fontSize: fontSize),
            maxLines: maxLines == 0 ? null : maxLines,
            expands: expands == null ? false : true,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.zero,
              hintStyle: TextStyleWidget.regularTextStyle1(
                  color: mainColor, fontSize: fontSize),
              helperStyle: const TextStyle(color: textHint),
              prefixIcon: Text(
                "N\$",
                style: TextStyleWidget.regularTextStyle1(
                    color: mainColor, fontSize: fontSize),
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: mainColor)),
              disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: mainColor)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: mainColor)),
            ),
          ),
        ),
      ),
    );
  }
}
class TextFieldWidget1 extends StatelessWidget {
  TextEditingController? controller;
  double? fontSize;
  double? contentPadding;
  String? hintText;
  bool? expands = false;
  int? maxLines;
  TextInputType? keyboardType;
  FormFieldValidator<String> validator;


  TextFieldWidget1(
      {this.controller,
        this.hintText,
        this.fontSize,
        this.contentPadding,
        this.expands,
        this.maxLines,
        this.keyboardType,
        required this.validator,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60,
          width: double.infinity,
          child: TextFormField(
            controller: controller,
            textAlign: TextAlign.start,
            keyboardType: keyboardType,
            style: TextStyleWidget.regularTextStyle1(
                color: mainColor, fontSize: fontSize),
            maxLines: maxLines == 0 ? null : maxLines,
            expands: expands == null ? false : true,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.zero,
              hintStyle: TextStyleWidget.regularTextStyle1(
                  color: mainColor, fontSize: fontSize),
              helperStyle: const TextStyle(color: textHint),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: mainColor)),
              disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: mainColor)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: mainColor)),
            ),
          ),
        ),
      ),
    );
  }
}