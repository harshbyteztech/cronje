import 'package:cronje/model/merger_model.dart';
import 'package:cronje/utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:sizer/sizer.dart';

import '../../model/calculate_model.dart';
import '../../utils/app_asset.dart';
import '../../utils/app_color.dart';
import '../../utils/pdfexport.dart';
import '../../utils/text_style.dart';

class PdfPreviewScreen extends StatelessWidget {
  int pdf;
  CalculateModel? calculateModel = CalculateModel();
  MergerModel? merger = MergerModel();
  String leaseValue = "";
  String? titledropDownValue;
  String? personDropdownValue;

  PdfPreviewScreen(
      {required this.pdf,
      this.calculateModel,
      this.merger,
        this.titledropDownValue,
        this.personDropdownValue,
      required this.leaseValue});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: whiteColor,
          centerTitle: true,
          title: Text(
            pdf == 1
                ? strBondCost
                : pdf == 2
                    ? strTransferCost
                    : pdf == 3
                        ? strMemberTransfer:
                pdf == 5?mergerfiling
                        : strLeaseStamp,
            textAlign: TextAlign.start,
            style: TextStyleWidget.regularTextStyle1(
                fontSize: 4.w, color: blackColor),
          ),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Image.asset(
                AppAssetsImage.iconBack,
                width: 7.w,
                height: 7.w,
              ),
            ),
          ),
        ),
        body: PdfPreview(
          canChangePageFormat: false,
          allowPrinting: false,
          allowSharing: false,
          previewPageMargin: EdgeInsets.only(top: 15.0),
          padding: EdgeInsets.only(top: 15.0),
          build: (context) => pdf == 5
              ? makePdf(pdf, CalculateModel(), merger!, "","",leaseValue)
              : makePdf(pdf, calculateModel!, MergerModel(),titledropDownValue!,personDropdownValue!, leaseValue),
          maxPageWidth: double.infinity,
        ),
      ),
    );
  }
}
