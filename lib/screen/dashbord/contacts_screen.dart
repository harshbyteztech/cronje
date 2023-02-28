import 'package:cronje/utils/app_color.dart';
import 'package:cronje/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../services/api_services.dart';
import '../../utils/app_asset.dart';
import '../../utils/app_string.dart';
import '../../widget/app_bar.dart';
import '../../widget/custom_button.dart';
import '../../widget/textField_widget.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  final GlobalKey<FormState> _formContact = GlobalKey<FormState>();

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(em);
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
          Form(
            key: _formContact,
            child: ListView(
              children: [
                SizedBox(
                  height: 25.w,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4.w),
                  child: Center(
                    child: Text(
                      strContacts,
                      style: TextStyleWidget.mediumTextStyle(fontSize: 6.w),
                    ),
                  ),
                ),
                TextFieldWidget1(
                  hintText: "Name",
                  controller: nameController,
                  fontSize: 4.w,
                  contentPadding: 5.0,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == "") {
                      return 'Name cannot be blank';
                    }
                    return null;
                  },
                ),
                TextFieldWidget1(
                  hintText: "Email",
                  controller: emailController,
                  fontSize: 4.w,
                  contentPadding: 5.0,
                  maxLines: 1,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == "") {
                      return 'Email cannot be blank';
                    } else if (isEmail(value!) == false) {
                      return 'Invalid Email Address';
                    }
                    return null;
                  },
                ),
                TextFieldWidget1(
                  hintText: "Contact Number",
                  controller: contactController,
                  fontSize: 4.w,
                  contentPadding: 5.0,
                  maxLines: 1,

                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == "") {
                      return 'Contact cannot be blank';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 200,
                  child: TextFieldWidget1(
                    hintText: "Message",
                    controller: messageController,
                    fontSize: 4.w,
                    contentPadding: 5.0,
                    maxLines: 10,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == "") {
                        return 'Message cannot be blank';
                      }
                      return null;
                    },
                  ),
                ),
                CustomButton(
                  text: "Send Message",
                  onTap: () {
                    if (_formContact.currentState!.validate()) {
                      var map = {
                        "email": emailController.text,
                        "name": nameController.text,
                        "number": contactController.text,
                        "message": messageController.text
                      };
                      ApiServices().postContact(map).then((value) {
                        emailController.clear();
                        nameController.clear();
                        contactController.clear();
                        messageController.clear();

                        final snackBar = SnackBar(
                          backgroundColor: mainColor,
                          content: Text(
                            'Email successfully sent',
                            style: TextStyleWidget.regularTextStyle(
                                color: whiteColor),
                          ),
                          action: SnackBarAction(
                            label: '',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        setState(() {});
                      });
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                AppAssetsImage.iconEmail,
                                height: 25,
                                width: 25,
                              ),
                              Text(
                                "  Email us at",
                                style: TextStyleWidget.mediumTextStyle1(
                                    color: blackColor,
                                    fontSize: 4.5.w,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            strContactEmail,
                            style: TextStyleWidget.regularTextStyle1(
                                fontSize: 3.5.w, color: mainColor, height: 1.4),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                AppAssetsImage.iconCalling,
                                height: 25,
                                width: 25,
                              ),
                              Text(
                                "  Office Hours",
                                style: TextStyleWidget.mediumTextStyle1(
                                    color: blackColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 4.5.w),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: strStreet1,
                                style: TextStyleWidget.boldTextStyle1(
                                    fontSize: 3.5.w,
                                    color: mainColor,
                                    height: 1.4),
                              ),
                              TextSpan(
                                text: strAddress1,
                                style: TextStyleWidget.regularTextStyle1(
                                    fontSize: 3.5.w,
                                    color: mainColor,
                                    height: 1.4),
                              ),
                            ]),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: strAddress2,
                                style: TextStyleWidget.regularTextStyle1(
                                    fontSize: 3.5.w,
                                    color: mainColor,
                                    height: 1.4),
                              ),
                              TextSpan(
                                text: strStreet2,
                                style: TextStyleWidget.boldTextStyle1(
                                    fontSize: 3.5.w,
                                    color: mainColor,
                                    height: 1.4),
                              ),
                              TextSpan(
                                text: strAddress3,
                                style: TextStyleWidget.regularTextStyle1(
                                    fontSize: 3.5.w,
                                    color: mainColor,
                                    height: 1.4),
                              ),
                            ]),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: AppBarWidget(
              backPress: false,
              page: 0,
            ),
          ),
        ],
      ),
    ));
  }
}
