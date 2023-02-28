import 'package:cronje/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/cupertino.dart';

import '../utils/text_style.dart';

class CustomDropDown extends StatelessWidget {
  // String dropdownValue = list.first;
  String? dropdownValue;
  List<String>? list;
  ValueChanged<String?>? onChanged;

  CustomDropDown({this.dropdownValue, this.list, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0,right: 15.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: [
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(
                Icons.expand_more,
                color: blackColor,
                size: 35,
              ),
              elevation: 16,
              isExpanded: true,
              style: TextStyleWidget.regularTextStyle1(fontSize: 3.w),
              underline: Container(
                height: 1,
                color: Colors.transparent,
              ),
              onChanged: onChanged,
              items: list?.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      value,
                      style: TextStyleWidget.regularTextStyle1(
                        fontSize: 4.0.w
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 10,),
            Container(
              height: 0.8,
              width: double.infinity,
              color: mainColor,
            )
          ],
        ),
      ),
    );
  }
}
