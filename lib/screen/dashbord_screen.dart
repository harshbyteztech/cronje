import 'dart:async';

import 'package:cronje/utils/app_color.dart';
import 'package:cronje/utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sizer/sizer.dart';
import '../utils/app_asset.dart';
import '../utils/app_dimens.dart';
import '../utils/text_style.dart';
import 'dashbord/calculator_screen.dart';
import 'dashbord/contacts_screen.dart';
import 'dashbord/document_screen.dart';
import 'dashbord/our_team_screen.dart';

class DashBordScreen extends StatefulWidget {
  const DashBordScreen({Key? key}) : super(key: key);

  @override
  State<DashBordScreen> createState() => _DashBordScreenState();
}

class _DashBordScreenState extends State<DashBordScreen> {
  int indexOfPage = 0;
  double widthContainer = 20.w;

  bool isCheckInternet = false;

  List<Widget> listPage = [
    const CalculatorScreen(),
    const OurTeamScreen(),
    const DocumentScreen(),
    const ContactsScreen()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkIt();
  }

  checkIt() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      setState(() {
        isCheckInternet = true;
      });
      print('YAY! Free cute dog pics!');
    } else {
      setState(() {
        isCheckInternet = false;
      });
      print(InternetConnectionChecker().hasListeners);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: isCheckInternet == false
          ? Container(
              color: Colors.transparent,
              height: 0.0.w,
            )
          : Container(
              child: bottomNavigationBarWidget(),
            ),
      body: WillPopScope(
        onWillPop: showExitPopup,
        child: Stack(
          children: [
            listPage.elementAt(indexOfPage),
            isCheckInternet == false
                ? Container(
                    color: Colors.black54,
                    height: double.infinity,
                    width: double.infinity,
                    child: Center(
                        child: Card(
                      color: Colors.white,
                      elevation: 100.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        height: 20.h,
                        width: 80.w,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "NO INTERNET",
                                style: TextStyleWidget.regularTextStyle(
                                    color: mainColor, fontSize: 2.0.h),
                              ),
                              const Center(
                                  child: Icon(
                                Icons.wifi_tethering_error,
                                color: Colors.red,
                                size: 50,
                              )),
                              Text(
                                "Please Check internet connection and try again",
                                textAlign: TextAlign.center,
                                style: TextStyleWidget.regularTextStyle(
                                    color: mainColor, fontSize: 1.5.h),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                  )
                : Container(),
          ],
        ),
      ),
    ));
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  'Cronje Law',
                  style: TextStyleWidget.mediumTextStyle(
                      color: mainColor, fontSize: AppDimens.large_font),
                ),
                content: Text(
                  "Are you sure you want to exit?",
                  style: TextStyleWidget.regularTextStyle(color: mainColor),
                ),
                actions: [
                  TextButton(
                    child: Text(
                      'No',
                      style: TextStyleWidget.mediumTextStyle(color: blackColor),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  TextButton(
                    child: Text(
                      'Yes',
                      style: TextStyleWidget.mediumTextStyle(color: blackColor),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              );
            }) ??
        false;
  }

  bottomNavigationBarWidget() {
    return Container(
      color: whiteColor,
      height: 20.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                indexOfPage = 0;
              });
            },
            child: navigationButton(
                indexOfPage == 0
                    ? AppAssetsImage.iconCalculator
                    : AppAssetsImage.iconCalculatorOutline,
                indexOfPage == 0 ? strCalculators : "",
                indexOfPage,
                indexOfPage == 0 ? bgColor : whiteColor,
                indexOfPage == 0 ? 40.w : widthContainer),
          ),
          InkWell(
            onTap: () {
              setState(() {
                indexOfPage = 1;
              });
            },
            child: navigationButton(
                indexOfPage == 1
                    ? AppAssetsImage.iconTeam
                    : AppAssetsImage.iconTeamOutline,
                indexOfPage == 1 ? strOurTeam : "",
                indexOfPage,
                indexOfPage == 1 ? bgColor : whiteColor,
                indexOfPage == 1 ? 40.w : widthContainer),
          ),
          InkWell(
            onTap: () {
              setState(() {
                indexOfPage = 2;
              });
            },
            child: navigationButton(
                indexOfPage == 2
                    ? AppAssetsImage.iconDocument
                    : AppAssetsImage.iconDocumentOutline,
                indexOfPage == 2 ? strDocument : "",
                indexOfPage,
                indexOfPage == 2 ? bgColor : whiteColor,
                indexOfPage == 2 ? 40.w : widthContainer),
          ),
          InkWell(
            onTap: () {
              setState(() {
                indexOfPage = 3;
              });
            },
            child: navigationButton(
                indexOfPage == 3
                    ? AppAssetsImage.iconContact1
                    : AppAssetsImage.iconContact,
                indexOfPage == 3 ? strContacts : "",
                indexOfPage,
                indexOfPage == 3 ? bgColor : whiteColor,
                indexOfPage == 3 ? 40.w : widthContainer),
          ),
        ],
      ),
    );
  }

  navigationButton(
      String icon, String text, int index, Color color, double widthContainer) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: widthContainer,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(50), color: color),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          3.5.w,
          2.w,
          3.5.w,
          2.w,
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 8.w,
              height: 8.w,
            ),
            SizedBox(
              width: 1.w,
            ),
            Expanded(
              child: Text(
                text,
                overflow: TextOverflow.clip,
                maxLines: 1,
                style: TextStyleWidget.regularTextStyle(color: textColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
