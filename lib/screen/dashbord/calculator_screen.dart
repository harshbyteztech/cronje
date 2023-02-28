import 'dart:io';
import 'dart:typed_data';
import 'package:cronje/model/merger_model.dart';
import 'package:cronje/screen/dashbord/pdf_preview_screen.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';

import '../../model/calculate_model.dart';
import '../../services/api_services.dart';
import '../../utils/app_asset.dart';
import '../../utils/app_color.dart';
import '../../utils/app_string.dart';
import '../../utils/pdfexport.dart';
import '../../utils/text_style.dart';
import '../../widget/app_bar.dart';
import '../../widget/comman_widget.dart';
import '../../widget/customDropDown.dart';
import '../../widget/custom_button.dart';
import '../../widget/my_doted_widget.dart';
import '../../widget/textField_widget.dart';
import '../../widget/comman_widget.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int pageChange = 5;
  int pdf = 1;
  TextEditingController priceController = TextEditingController();
  TextEditingController periodController = TextEditingController();
  TextEditingController acquirerAssetsController = TextEditingController();
  TextEditingController acquirerTurnoverController = TextEditingController();
  TextEditingController targetAssetsController = TextEditingController();
  TextEditingController targetTurnoverController = TextEditingController();

  List<String> title = <String>[ 'Free Standing Erven','Sectional Title'];

  final GlobalKey<FormState> _formBond = GlobalKey<FormState>();
  final GlobalKey<FormState> _formTransfer = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyShare = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyPeriod = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyMerger = GlobalKey<FormState>();

  List<String> person = <String>[
    'Natural Person',
    'Affirmative Action',
    'other'
  ];
  String? titleDropdownValue;
  String? personDropdownValue;
  CalculateModel calculate = CalculateModel();
  MergerModel merger = MergerModel();
  String leaseValue = "";
  String mergerValue = "";
  String dropvalue = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // bondController.text = "\$";
    // transferController.text = "\$";
    titleDropdownValue = title.first;
    personDropdownValue = person.first;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                AppAssetsImage.logoBlack,
                height: 95.w,
                width: 80.w,
                fit: BoxFit.fill,
              ),
            ),
            ListView(
              children: [
                SizedBox(
                  height: pageChange == 5 ? 30.w : 20.w,
                ),
                pageChange == 5 || pageChange == 6
                    ? Container()
                    : Container(
                        height: 28.w,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: calculatorList.length,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    pageChange = index;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(8.0),
                                  height: 25.w,
                                  width: 28.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: pageChange == index
                                          ? textColor
                                          : whiteColor),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        calculatorList[index].icon!,
                                        height: 11.w,
                                        width: 11.w,
                                        color: pageChange == index
                                            ? whiteColor
                                            : textColor,
                                      ),
                                      SizedBox(
                                        height: 2.w,
                                      ),
                                      Text(
                                        calculatorList[index].text!,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyleWidget.regularTextStyle(
                                            color: pageChange == index
                                                ? whiteColor
                                                : blackColor,
                                            fontSize: 3.w,
                                            height: 1.2),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                Padding(
                  padding: EdgeInsets.only(top: 4.w),
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      pageChange == 5
                          ? strCalculators
                          : pageChange == 0
                              ? strBondCost1
                              : pageChange == 1
                                  ? strTransferCost1
                                  : pageChange == 2
                                      ? strMemberTransfer
                                      : pageChange == 3
                                          ? strLeaseStamp
                                          : "",
                      style: TextStyleWidget.mediumTextStyle(fontSize: 5.w),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.w,
                ),

                ///First page
                pageChange == 5
                    ? Padding(
                        padding: EdgeInsets.all(2.0.w),
                        child: Column(
                          children: [
                            cardWidget(
                                text: strBondCost,
                                icon: AppAssetsImage.iconBond,
                                onTap: () {
                                  setState(() {
                                    pageChange = 0;
                                    priceController.clear();
                                  });
                                }),
                            cardWidget(
                                text: strTransferCost,
                                icon: AppAssetsImage.iconTransfer,
                                onTap: () {
                                  setState(() {
                                    pageChange = 1;
                                    priceController.clear();
                                  });
                                }),
                            cardWidget(
                                text: strMemberTransfer,
                                icon: AppAssetsImage.iconMember,
                                onTap: () {
                                  setState(() {
                                    pageChange = 2;
                                    priceController.clear();
                                  });
                                }),
                            cardWidget(
                                text: strLeaseStamp,
                                icon: AppAssetsImage.iconStamp,
                                onTap: () {
                                  setState(() {
                                    pageChange = 3;
                                    priceController.clear();
                                  });
                                }),
                            cardWidget(
                                text: mergerfiling,
                                icon: AppAssetsImage.iconMember,
                                onTap: () {
                                  setState(() {
                                    pageChange = 4;
                                    targetTurnoverController.clear();
                                    targetAssetsController.clear();
                                    acquirerAssetsController.clear();
                                    acquirerTurnoverController.clear();
                                  });
                                }),
                          ],
                        ),
                      )

                    ///Bond page
                    : pageChange == 0
                        ? Form(
                            key: _formBond,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10.0.w,
                                ),
                                Center(
                                    child: Text(
                                  hintBond,
                                  style: TextStyleWidget.regularTextStyle1(
                                      color: textHint),
                                )),
                                SizedBox(
                                  height: 7.0.w,
                                ),
                                TextFieldWidget(
                                  hintText: "",
                                  controller: priceController,
                                  fontSize: 12.w,
                                  contentPadding: 20.0,
                                  maxLines: 1,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == "") {
                                      return strPriceErrorMessage;
                                    }
                                    return null;
                                  },
                                ),
                                CustomDropDown(
                                  list: title,
                                  dropdownValue: titleDropdownValue,
                                  onChanged: (String? value) {
                                    setState(() {
                                      titleDropdownValue = value!;
                                    });
                                  },
                                ),
                                CustomButton(
                                  text: strCalculator,
                                  onTap: () {
                                    if (_formBond.currentState!.validate()) {
                                      var map = {
                                        "price": priceController.text,
                                        "person": "natural",
                                        "title": titleDropdownValue
                                      };
                                      ApiServices()
                                          .postCalculate("bond", map)
                                          .then((value) {
                                        setState(() {
                                          calculate = value!;
                                          pageChange = 6;
                                          pdf = 1;
                                        });
                                      });
                                    }
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, bottom: 10),
                                  child: Text(
                                    strDisclaimer,
                                    textAlign: TextAlign.start,
                                    style: TextStyleWidget.mediumTextStyle1(
                                        fontSize: 4.5.w, height: 1.2),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10),
                                  child: Text(
                                    strDisclaimerAll,
                                    textAlign: TextAlign.start,
                                    style: TextStyleWidget.regularTextStyle1(
                                        fontSize: 4.w,
                                        height: 1.2,
                                        color: textHint),
                                  ),
                                ),
                              ],
                            ),
                          )

                        ///Transfer page
                        : pageChange == 1
                            ? Form(
                                key: _formTransfer,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10.0.w,
                                    ),
                                    Center(
                                        child: Text(
                                      hintTransfer,
                                      style: TextStyleWidget.regularTextStyle1(
                                          color: textHint),
                                    )),
                                    SizedBox(
                                      height: 7.0.w,
                                    ),
                                    TextFieldWidget(
                                      hintText: "",
                                      controller: priceController,
                                      fontSize: 12.w,
                                      contentPadding: 20.0,
                                      maxLines: 1,
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value == "") {
                                          return strPriceErrorMessage;
                                        }
                                        return null;
                                      },
                                    ),
                                    CustomDropDown(
                                      list: person,
                                      dropdownValue: personDropdownValue,
                                      onChanged: (String? value) {
                                        setState(() {
                                          personDropdownValue = value!;
                                        });
                                      },
                                    ),
                                    CustomDropDown(
                                      list: title,
                                      dropdownValue: titleDropdownValue,
                                      onChanged: (String? value) {
                                        setState(() {
                                          titleDropdownValue = value!;
                                        });
                                      },
                                    ),
                                    CustomButton(
                                      text: strCalculator,
                                      onTap: () {
                                        if (_formTransfer.currentState!
                                            .validate()) {
                                          var map = {
                                            "price": priceController.text,
                                            "person": personDropdownValue,
                                            "title": titleDropdownValue
                                          };
                                          ApiServices()
                                              .postCalculate("transfer", map)
                                              .then((value) {
                                            setState(() {
                                              calculate = value!;
                                              pageChange = 6;
                                              pdf = 2;
                                            });
                                          });
                                        }
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, bottom: 10),
                                      child: Text(
                                        strDisclaimer,
                                        textAlign: TextAlign.start,
                                        style: TextStyleWidget.mediumTextStyle1(
                                            fontSize: 4.5.w, height: 1.2),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20, bottom: 10),
                                      child: Text(
                                        strDisclaimerAll,
                                        textAlign: TextAlign.start,
                                        style:
                                            TextStyleWidget.regularTextStyle1(
                                                fontSize: 4.w,
                                                height: 1.2,
                                                color: textHint),
                                      ),
                                    ),
                                  ],
                                ),
                              )

                            ///Share page
                            : pageChange == 2
                                ? Form(
                                    key: _formKeyShare,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10.0.w,
                                        ),
                                        Center(
                                            child: Text(
                                          hintShare,
                                          style:
                                              TextStyleWidget.regularTextStyle1(
                                                  color: textHint),
                                        )),
                                        SizedBox(
                                          height: 7.0.w,
                                        ),
                                        TextFieldWidget(
                                          hintText: "",
                                          controller: priceController,
                                          fontSize: 12.w,
                                          contentPadding: 20.0,
                                          maxLines: 1,
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value == "") {
                                              return strPriceErrorMessage;
                                            }
                                            return null;
                                          },
                                        ),
                                        CustomDropDown(
                                          list: title,
                                          dropdownValue: titleDropdownValue,
                                          onChanged: (String? value) {
                                            setState(() {
                                              titleDropdownValue = value!;
                                            });
                                          },
                                        ),
                                        CustomButton(
                                          text: strCalculator,
                                          onTap: () {
                                            if (_formKeyShare.currentState!
                                                .validate()) {
                                              var map = {
                                                "price": priceController.text,
                                                "person": "natural",
                                                "title": titleDropdownValue
                                              };
                                              ApiServices()
                                                  .postCalculate("share", map)
                                                  .then((value) {
                                                setState(() {
                                                  calculate = value!;
                                                  pageChange = 6;
                                                  pdf = 3;
                                                });
                                              });
                                            }
                                          },
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, bottom: 10),
                                          child: Text(
                                            strDisclaimer,
                                            textAlign: TextAlign.start,
                                            style: TextStyleWidget
                                                .mediumTextStyle1(
                                                    fontSize: 4.5.w,
                                                    height: 1.2),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20, bottom: 10),
                                          child: Text(
                                            strDisclaimerAll,
                                            textAlign: TextAlign.start,
                                            style: TextStyleWidget
                                                .regularTextStyle1(
                                                    fontSize: 4.w,
                                                    height: 1.2,
                                                    color: textHint),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )

                                /// Lease Page
                                : pageChange == 3
                                    ? Form(
                                        key: _formKeyPeriod,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 10.0.w,
                                            ),
                                            Center(
                                                child: Text(
                                              hintLease,
                                              style: TextStyleWidget
                                                  .regularTextStyle1(
                                                      color: textHint),
                                            )),
                                            SizedBox(
                                              height: 5.0.w,
                                            ),
                                            TextFieldWidget(
                                              hintText: "",
                                              controller: priceController,
                                              fontSize: 12.w,
                                              contentPadding: 20.0,
                                              maxLines: 1,
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: (value) {
                                                if (value == "") {
                                                  return strPriceErrorMessage;
                                                }
                                                return null;
                                              },
                                            ),
                                            Center(
                                                child: Text(
                                              hintPeriod,
                                              style: TextStyleWidget
                                                  .regularTextStyle1(
                                                      color: textHint),
                                            )),
                                            SizedBox(
                                              height: 5.0.w,
                                            ),
                                            TextFieldWidget1(
                                              hintText: "",
                                              controller: periodController,
                                              fontSize: 12.w,
                                              contentPadding: 20.0,
                                              maxLines: 1,
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: (value) {
                                                if (value == "") {
                                                  return strPeriodErrorMessage;
                                                }
                                                return null;
                                              },
                                            ),
                                            CustomButton(
                                              text: strCalculator,
                                              onTap: () {
                                                if (_formKeyPeriod.currentState!
                                                    .validate()) {
                                                  var map = {
                                                    "price":
                                                        priceController.text,
                                                    "period":
                                                        periodController.text
                                                  };
                                                  ApiServices()
                                                      .postLease("lease", map)
                                                      .then((value) {
                                                    setState(() {
                                                      leaseValue = value!;
                                                      pageChange = 6;
                                                      pdf = 4;
                                                    });
                                                  });
                                                }
                                              },
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, bottom: 10),
                                              child: Text(
                                                strDisclaimer,
                                                textAlign: TextAlign.start,
                                                style: TextStyleWidget
                                                    .mediumTextStyle1(
                                                        fontSize: 4.5.w,
                                                        height: 1.2),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                  bottom: 10),
                                              child: Text(
                                                strDisclaimerAll,
                                                textAlign: TextAlign.start,
                                                style: TextStyleWidget
                                                    .regularTextStyle1(
                                                        fontSize: 4.w,
                                                        height: 1.2,
                                                        color: textHint),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )

                                    /// Merger Page
                                    : pageChange == 4
                                        ? Form(
                                            key: _formKeyMerger,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 10.0.w,
                                                ),
                                                Center(
                                                    child: Text(
                                                  hintMergerAssets,
                                                  style: TextStyleWidget
                                                      .regularTextStyle1(
                                                          color: textHint),
                                                )),
                                                SizedBox(
                                                  height: 5.0.w,
                                                ),
                                                TextFieldWidget(
                                                  hintText: "",
                                                  controller:
                                                      acquirerAssetsController,
                                                  fontSize: 12.w,
                                                  contentPadding: 20.0,
                                                  maxLines: 1,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  validator: (value) {
                                                    if (value == "") {
                                                      return strPriceErrorMessage;
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                Center(
                                                    child: Text(
                                                  hintMergerTurnover,
                                                  style: TextStyleWidget
                                                      .regularTextStyle1(
                                                          color: textHint),
                                                )),
                                                SizedBox(
                                                  height: 5.0.w,
                                                ),
                                                TextFieldWidget(
                                                  hintText: "",
                                                  controller:
                                                      acquirerTurnoverController,
                                                  fontSize: 12.w,
                                                  contentPadding: 20.0,
                                                  maxLines: 1,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  validator: (value) {
                                                    if (value == "") {
                                                      return strPeriodErrorMessage;
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                Center(
                                                    child: Text(
                                                  hintMergerAssetsT,
                                                  style: TextStyleWidget
                                                      .regularTextStyle1(
                                                          color: textHint),
                                                )),
                                                SizedBox(
                                                  height: 5.0.w,
                                                ),
                                                TextFieldWidget(
                                                  hintText: "",
                                                  controller:
                                                      targetAssetsController,
                                                  fontSize: 12.w,
                                                  contentPadding: 20.0,
                                                  maxLines: 1,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  validator: (value) {
                                                    if (value == "") {
                                                      return strPriceErrorMessage;
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                Center(
                                                    child: Text(
                                                  hintMergerTurnoverT,
                                                  style: TextStyleWidget
                                                      .regularTextStyle1(
                                                          color: textHint),
                                                )),
                                                SizedBox(
                                                  height: 5.0.w,
                                                ),
                                                TextFieldWidget(
                                                  hintText: "",
                                                  controller:
                                                      targetTurnoverController,
                                                  fontSize: 12.w,
                                                  contentPadding: 20.0,
                                                  maxLines: 1,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  validator: (value) {
                                                    if (value == "") {
                                                      return strPeriodErrorMessage;
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                CustomButton(
                                                  text: strCalculator,
                                                  onTap: () {
                                                    if (_formKeyMerger
                                                        .currentState!
                                                        .validate()) {
                                                      var map = {
                                                        "acquirer_assets":
                                                            acquirerAssetsController
                                                                .text,
                                                        "acquirer_turnover":
                                                            acquirerTurnoverController
                                                                .text,
                                                        "target_assets":
                                                            targetAssetsController
                                                                .text,
                                                        "target_turnover":
                                                            targetTurnoverController
                                                                .text,
                                                      };
                                                      ApiServices()
                                                          .postMerger(
                                                              "merger", map)
                                                          .then((value) {
                                                        setState(() {
                                                          merger = value!;
                                                          pageChange = 6;
                                                          pdf = 5;
                                                        });
                                                      });
                                                    }
                                                  },
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20, bottom: 10),
                                                  child: Text(
                                                    strDisclaimer,
                                                    textAlign: TextAlign.start,
                                                    style: TextStyleWidget
                                                        .mediumTextStyle1(
                                                            fontSize: 4.5.w,
                                                            height: 1.2),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20,
                                                          right: 20,
                                                          bottom: 10),
                                                  child: Text(
                                                    strDisclaimerAll,
                                                    textAlign: TextAlign.start,
                                                    style: TextStyleWidget
                                                        .regularTextStyle1(
                                                            fontSize: 4.w,
                                                            height: 1.2,
                                                            color: textHint),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )

                                        ///PDF page
                                        : pageChange == 6
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.all(20.0),
                                                child: Column(
                                                  children: [
                                                    Card(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(15.0),
                                                        child: pdf == 4
                                                            ? Column(
                                                                children: [
                                                                  rowWidget(
                                                                      "Stamp Duty ",
                                                                      "N\$ $leaseValue"),
                                                                  const MySeparator(
                                                                    height: 2.0,
                                                                    color:
                                                                        blackColor,
                                                                  ),
                                                                  rowWidget1(
                                                                      "Total",
                                                                      "N\$ $leaseValue"),
                                                                ],
                                                              )
                                                            : pdf == 5
                                                                ? Column(
                                                                    children: [
                                                                      rowWidget1(
                                                                          "Acquirer Turnover",
                                                                          "N\$ ${merger.acquirerTurnover}"),
                                                                      // const MySeparator(
                                                                      //   height:
                                                                      //       1.0,
                                                                      //   color:
                                                                      //       textHint,
                                                                      // ),
                                                                      rowWidget(
                                                                          "Acquirer Assets",
                                                                          "N\$ ${merger.acquirerAssets}"),
                                                                      // const MySeparator(
                                                                      //   height:
                                                                      //       1.0,
                                                                      //   color:
                                                                      //       textHint,
                                                                      // ),
                                                                      rowWidget(
                                                                          "Target Turnover",
                                                                          "N\$ ${merger.targetTurnover}"),
                                                                      // const MySeparator(
                                                                      //   height:
                                                                      //       1.0,
                                                                      //   color:
                                                                      //       textHint,
                                                                      // ),
                                                                      rowWidget(
                                                                          "Target Assets",
                                                                          "N\$ ${merger.targetAssets}"),

                                                                      const MySeparator(
                                                                        height:
                                                                            2.0,
                                                                        color: blackColor,

                                                                      ),
                                                                      SizedBox(height: 15,),
                                                                      rowWidget(
                                                                          "Filing Fee",
                                                                          "N\$ ${merger.filingFee}"),
                                                                      // const MySeparator(
                                                                      //   height:
                                                                      //       1.0,
                                                                      //   color:textHint,
                                                                      //
                                                                      // ),
                                                                      rowWidget1(
                                                                          "Merger Required",
                                                                          "${merger.mergerRequired}"),
                                                                    ],
                                                                  )
                                                                : Column(
                                                                    children: [
                                                                      rowWidget1(
                                                                          "Sale Price",
                                                                          "N\$ ${calculate.sale_price}"),
                                                                      const MySeparator(
                                                                        height:
                                                                            1.0,
                                                                        color:
                                                                            textHint,
                                                                      ),
                                                                      rowWidget(
                                                                          pdf == 1
                                                                              ? "Bond Fees"
                                                                              : pdf == 2
                                                                                  ? "Transfer Fees"
                                                                                  : "Member Transfer Fees",
                                                                          "N\$ ${calculate.attorney}"),
                                                                      const MySeparator(
                                                                        height:
                                                                            1.0,
                                                                        color:
                                                                            textHint,
                                                                      ),
                                                                      rowWidget(
                                                                          "15% VAT on Fees",
                                                                          "N\$ ${calculate.vat}"),
                                                                      const MySeparator(
                                                                        height:
                                                                            1.0,
                                                                        color:
                                                                            textHint,
                                                                      ),
                                                                      rowWidget(
                                                                          "Stamp Duty ",
                                                                          "N\$ ${calculate.stampduty}"),
                                                                      const MySeparator(
                                                                        height:
                                                                            1.0,
                                                                        color:
                                                                            textHint,
                                                                      ),
                                                                      pdf == 2
                                                                          ? rowWidget(
                                                                              "Transfer Duty",
                                                                              "N\$ ${calculate.transferduty}")
                                                                          : Container(),
                                                                      pdf == 2
                                                                          ? const MySeparator(
                                                                              height: 1.0,
                                                                              color: textHint,
                                                                            )
                                                                          : Container(),
                                                                      rowWidget(
                                                                          "Deeds Office Fee",
                                                                          "N\$ ${calculate.deeds}"),
                                                                      const MySeparator(
                                                                        height:
                                                                            1.0,
                                                                        color:
                                                                            textHint,
                                                                      ),
                                                                      rowWidget(
                                                                          "Sundries and Postage + 15% VAT",
                                                                          "N\$ ${calculate.postage}"),
                                                                      const MySeparator(
                                                                        height:
                                                                            2.0,
                                                                        color:
                                                                            blackColor,
                                                                      ),
                                                                      rowWidget1(
                                                                          "Total",
                                                                          "N\$ ${calculate.total}"),
                                                                    ],
                                                                  ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5.w,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                            child:
                                                                CustomButtonWithIcon(
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (_) {
                                                              return pdf == 5
                                                                  ? PdfPreviewScreen(
                                                                      pdf: pdf,
                                                                     merger: merger,
                                                                      leaseValue:
                                                                          mergerValue, calculateModel:CalculateModel(),)
                                                                  : PdfPreviewScreen(
                                                                      pdf: pdf,
                                                                      calculateModel:
                                                                          calculate,
                                                                      personDropdownValue: personDropdownValue,
                                                                      titledropDownValue: titleDropdownValue,
                                                                      leaseValue:
                                                                          leaseValue,
                                                                    );
                                                            }));
                                                          },
                                                          icon: Icons
                                                              .remove_red_eye_rounded,
                                                          text: " VIEW PDF",
                                                        )),
                                                        SizedBox(
                                                          width: 5.w,
                                                        ),
                                                        Expanded(
                                                            child:
                                                                CustomButtonWithIcon(
                                                                    onTap:
                                                                        () async {
                                                                      final String
                                                                          dir =
                                                                          (await getApplicationDocumentsDirectory())
                                                                              .path;
                                                                      final String
                                                                          path =
                                                                          '$dir/Cronje_Inc.pdf';
                                                                      final File
                                                                          file =
                                                                          File(
                                                                              path);
                                                                      Uint8List
                                                                          val =
                                                                          await makePdf(
                                                                              pdf,
                                                                              calculate,
                                                                              merger,
                                                                              leaseValue,
                                                                              leaseValue,
                                                                              leaseValue,);
                                                                      await file
                                                                          .writeAsBytes(
                                                                              val);
                                                                      print(
                                                                          "file ${file.path}");
                                                                      Share
                                                                          .shareXFiles([
                                                                        XFile(file
                                                                            .path)
                                                                      ]);
                                                                    },
                                                                    icon: Icons
                                                                        .share,
                                                                    text:
                                                                        "SHARE PDF")),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : Container(),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: AppBarWidget(
                backPress: pageChange == 5 ? false : true,
                onTap: () {
                  setState(() {
                    priceController.clear();
                    titleDropdownValue = title.first;
                    personDropdownValue = person.first;
                    pageChange = 5;
                  });
                },
                page: pageChange == 6 ? 1 : 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
