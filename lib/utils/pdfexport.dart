import 'package:cronje/model/merger_model.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';

import 'package:pdf/widgets.dart';
import 'package:sizer/sizer.dart';

import '../model/calculate_model.dart';
import 'app_asset.dart';
import 'app_string.dart';

Future<Uint8List> makePdf(
    int pdfPage, CalculateModel calculatorModel,MergerModel mergerModel,String titledropdownvalue, String persondropdownvalue,String leaseValue) async {
  final iconTree = MemoryImage(
      (await rootBundle.load(AppAssetsImage.iconTree)).buffer.asUint8List());
  final imageLogo = MemoryImage(
      (await rootBundle.load(AppAssetsImage.logoFull)).buffer.asUint8List());
  final imageCall = MemoryImage(
      (await rootBundle.load(AppAssetsImage.iconPhone)).buffer.asUint8List());
  final imageLocation = MemoryImage(
      (await rootBundle.load(AppAssetsImage.iconLocation))
          .buffer
          .asUint8List());
  final imageEmail = MemoryImage(
      (await rootBundle.load(AppAssetsImage.iconMail)).buffer.asUint8List());

  final pdf = Document();
  pdf.addPage(
    Page(
      margin: EdgeInsets.zero,
      build: (context) {
        return Stack(children: [
          Align(
            alignment: Alignment.bottomCenter,
            child:Column(
             mainAxisAlignment: MainAxisAlignment.end ,
            children: [
              Padding(
                padding: EdgeInsets.all(25.0),
              child:
              Text(strDisclaimerAll,
                  maxLines: 10,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    color: PdfColors.black,
                    fontSize: 2.5.w,
                  )),),
              Container(
                height: 25.w,
                width: double.infinity,
                color: PdfColor.fromInt(0xff282828),
                child: Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 10),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: rowBottom(imageCall, strPhonePDF)),
                          Expanded(child: rowBottom(imageEmail, strContactEmail)),
                          Expanded(
                              child: rowBottom(imageLocation, strAddressPDF3))
                        ])),
              ),

            ])

          ),
          Column(children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                  height: 30.w,
                  width: double.infinity,
                  color: PdfColor.fromInt(0xff282828),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image(imageLogo, height: 25.w, width: 50.w),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                  pdfPage == 1
                                      ? strBondCost
                                      : pdfPage == 2
                                          ? strTransferCost
                                          : pdfPage == 3
                                              ? strMemberTransfer:
                                  pdfPage == 5?mergerfiling
                                              : strLeaseStamp,
                                  style: TextStyle(
                                      color: PdfColors.white,
                                      fontSize: 6.w,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 2.w),
                              Text(
                                  "Date : ${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}",
                                  style: TextStyle(
                                      color: PdfColors.white,
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.bold)),
                            ]),
                      ])),
            ),

            Padding(
                padding: EdgeInsets.all(25.0),
                child:pdfPage ==5? Column(children: [
                  SizedBox(height: 5.w),
                  rowWidget3("Acquirer Turnover",
                      "N\$ ${mergerModel.acquirerTurnover.toString()}"),
                  SizedBox(height: 5.w),
                  rowWidget3("Acquirer Assets",
                      "N\$ ${mergerModel.acquirerAssets.toString()}"),
                  SizedBox(height: 15.w),
                  rowWidget3("Target Turnover",
                      "N\$ ${mergerModel.targetTurnover.toString()}"),
                  SizedBox(height: 5.w),
                  rowWidget3("Target Assets",
                      "N\$ ${mergerModel.targetAssets.toString()}"),
                  SizedBox(height: 10.w),
                  Padding(padding:EdgeInsets.symmetric(horizontal: 20),child:Divider(height: 5) ),

                  SizedBox(height: 5.w),
                  rowWidget2(
                      "Filing fee", "N\$ ${mergerModel.filingFee.toString()}"),
                  SizedBox(height: 5.w),
                  rowWidget2(
                      "Merger Required", "${mergerModel.mergerRequired.toString()}"),
                  SizedBox(height: 40.w),
                  // Text(strDisclaimerAll,
                  //     maxLines: 10,
                  //     textAlign: TextAlign.justify,
                  //     overflow: TextOverflow.clip,
                  //     style: TextStyle(
                  //       color: PdfColors.black,
                  //       fontSize: 2.5.w,
                  //     ))
                ]): pdfPage == 4
                    ? Column(children: [
                        rowWidget2("Stamp Duty ", "N\$ $leaseValue"),
                        SizedBox(height: 10.w),
                        rowWidget3("Total", "N\$ $leaseValue"),
                        SizedBox(height: 8.w),
                        // Text(strDisclaimerAll,
                        //     maxLines: 10,
                        //     textAlign: TextAlign.justify,
                        //     overflow: TextOverflow.clip,
                        //     style: TextStyle(
                        //       color: PdfColors.black,
                        //       fontSize: 2.5.w,
                        //     ))
                      ])
                    : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        SizedBox(height: 5.w),
                        rowWidget3("Sale Price",
                            "N\$ ${calculatorModel.sale_price.toString()}"),
                 pdfPage == 2? Text('${persondropdownvalue},${titledropdownvalue}',
                      style: TextStyle(
                        color: PdfColors.black,
                        fontSize: 4.w,
                      )):Text('${titledropdownvalue}',
                      style: TextStyle(
                        color: PdfColors.black,
                        fontSize: 4.w,
                      )),
                        SizedBox(height: 10.w),
                        rowWidget2(
                            pdfPage == 1
                                ? "Bond Fees"
                                : pdfPage == 2
                                    ? "Transfer Fees"
                                    : "Member Transfer Fees",
                            "N\$ ${calculatorModel.attorney.toString()}"),
                        SizedBox(height: 5.w),
                        rowWidget2("15% VAT on Fees",
                            "N\$ ${calculatorModel.vat.toString()}"),
                        SizedBox(height: 5.w),
                        rowWidget2("Stamp Duty",
                            "N\$ ${calculatorModel.stampduty.toString()}"),
                        pdfPage == 1 || pdfPage == 3
                            ? Container()
                            : SizedBox(height: 5.w),
                        pdfPage == 2
                            ? rowWidget2("Transfer Duty",
                                "N\$ ${calculatorModel.transferduty.toString()}")
                            : Container(),
                        SizedBox(height: 5.w),
                        rowWidget2("Deeds Office Fee",
                            "N\$ ${calculatorModel.deeds.toString()}"),
                        SizedBox(height: 5.w),
                        rowWidget2("Sundries and Postage + 15% VAT",
                            "N\$ ${calculatorModel.postage.toString()}"),
                        SizedBox(height: 10.w),
                        rowWidget3(
                            "Total", "N\$ ${calculatorModel.total.toString()}"),
                        SizedBox(height: 8.w),

                      ])),
          ])
        ]);
      },
    ),
  );

  return pdf.save();
}

Widget rowWidget2(String name, String value) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Text(name,
        style: TextStyle(
          color: PdfColors.black,
          fontSize: 5.w,
        )),
    Text(value,
        style: TextStyle(
          color: PdfColors.black,
          fontSize: 5.w,
        )),
  ]);
}

Widget rowWidget3(String name, String value) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Text(name,
        style: TextStyle(
            color: PdfColors.black,
            fontSize: 6.w,
            fontWeight: FontWeight.bold)),
    Text(value,
        style: TextStyle(
            color: PdfColors.black,
            fontSize: 6.w,
            fontWeight: FontWeight.bold)),
  ]);
}

Widget rowBottom(MemoryImage icon, String text) {
  return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Image(icon, height: 3.5.w, width: 3.5.w),
    SizedBox(width: 2.w),
    Expanded(
        child: Text(text,
            maxLines: 8,
            style: TextStyle(
                color: PdfColors.white,
                fontSize: 3.w,
                fontWeight: FontWeight.normal))),
  ]);
}
