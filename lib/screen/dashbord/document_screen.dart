import 'dart:io';
import 'dart:math';

import 'package:cronje/bloc/document/document_bloc.dart';
import 'package:cronje/bloc/document/document_event.dart';
import 'package:cronje/bloc/document/document_state.dart';
import 'package:cronje/utils/app_string.dart';
import 'package:cronje/utils/text_style.dart';
import 'package:dio/dio.dart';

// import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';
import '../../model/document_model.dart';
import '../../model/insight_model.dart';
import '../../services/api_services.dart';
import '../../utils/app_asset.dart';
import '../../utils/app_color.dart';
import '../../widget/app_bar.dart';
import 'package:intl/intl.dart';

import '../view_pdf_screen.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({Key? key}) : super(key: key);

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  List<DocumentData> listDocument = [];
  List<InsightsModel> listInsights = [];
  DocumentBloc documentBloc = DocumentBloc();
  bool isLoading = false;

  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    documentBloc = BlocProvider.of<DocumentBloc>(context);
    documentBloc.add(DocumentListGetEvent());
    ApiServices().getInsights().then((value) {
      setState(() {
        listInsights = value!;
        isLoading = true;
      });
    });
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
            Column(
              children: [
                AppBarWidget(
                  backPress: false,
                  page: 0,
                ),
                SizedBox(
                  height: 10.w,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          index = 0;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            strDocument,
                            style: TextStyleWidget.mediumTextStyle(
                                fontSize: 6.w,
                                color: index == 0 ? textColor : mainColor),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 15),
                            child: Container(
                              height: 2,
                              width: 40.w,
                              color:
                                  index == 0 ? textColor : Colors.transparent,
                            ),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            strInsights,
                            style: TextStyleWidget.mediumTextStyle(
                                fontSize: 6.w,
                                color: index == 1 ? textColor : mainColor),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 15),
                            child: Container(
                              height: 2,
                              width: 40.w,
                              color:
                                  index == 1 ? textColor : Colors.transparent,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                index == 0
                    ? Expanded(
                        child: BlocConsumer<DocumentBloc, DocumentListState>(
                            builder: (context, state) {
                        return state is DocumentStateLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: mainColor,
                                ),
                              )
                            : ListView.builder(
                                padding: const EdgeInsets.all(5.0),
                                itemCount: listDocument.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    margin: const EdgeInsets.all(10.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          listDocument[index].isExpande =
                                              !listDocument[index].isExpande;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: whiteColor),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      listDocument[index].name,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 4,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyleWidget
                                                          .boldTextStyle(
                                                              fontSize: 4.5.w,
                                                              height: 1.2),
                                                    ),
                                                    SizedBox(
                                                      height: 2.w,
                                                    ),
                                                    Text(
                                                      listDocument[index]
                                                          .description,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: listDocument[
                                                                      index]
                                                                  .isExpande ==
                                                              true
                                                          ? 100
                                                          : 4,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyleWidget
                                                          .regularTextStyle(
                                                              fontSize: 3.5.w,
                                                              height: 1.3),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 4.w,
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  Navigator.push(context,
                                                      MaterialPageRoute(
                                                          builder: (_) {
                                                    return ViewPDFScreen(
                                                      pdfFile:
                                                          listDocument[index]
                                                              .file,
                                                    );
                                                  }));
                                                },
                                                child: const Icon(
                                                  Icons.remove_red_eye_outlined,
                                                  color: blackColor,
                                                  size: 35,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                      }, listener: (context, state) {
                        if (state is DocumentStateSuccess) {
                          listDocument = state.list!;
                        }
                      }))
                    : Expanded(
                        child: isLoading == false
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: mainColor,
                                ),
                              )
                            : ListView.builder(
                                padding: const EdgeInsets.all(5.0),
                                itemCount: listInsights.length,
                                itemBuilder: (context, index) {
                                  final DateTime? now =
                                      listInsights[index].date;
                                  final DateFormat formatter =
                                      DateFormat('dd, MMMM yyyy');
                                  final String formatted =
                                      formatter.format(now!);
                                  print(
                                      "${listInsights[index].embedded!.wpFeaturedmedia![0].mediaDetails!.sizes!["medium"]?.sourceUrl}");
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        listInsights[index].isExpande =
                                            !listInsights[index].isExpande;
                                      });
                                    },
                                    child: Card(
                                      margin: const EdgeInsets.all(10.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10.0),
                                                    topRight:
                                                        Radius.circular(10.0)),
                                            child: Image.network(
                                              listInsights[index]
                                                      .embedded!
                                                      .wpFeaturedmedia![0]
                                                      .mediaDetails!
                                                      .sizes!["medium"]
                                                      ?.sourceUrl ??
                                                  "",
                                              height: 50.w,
                                              fit: BoxFit.fill,
                                              width: double.infinity,
                                              loadingBuilder:
                                                  (BuildContext context,
                                                      Widget child,
                                                      ImageChunkEvent?
                                                          loadingProgress) {
                                                if (loadingProgress == null)
                                                  return child;
                                                return SizedBox(
                                                  height: 50.w,
                                                  width: double.infinity,
                                                  child: Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: mainColor,
                                                      strokeWidth: 2.0,
                                                      value: loadingProgress
                                                                  .expectedTotalBytes !=
                                                              null
                                                          ? loadingProgress
                                                                  .cumulativeBytesLoaded /
                                                              loadingProgress
                                                                  .expectedTotalBytes!
                                                          : null,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10.0, 12.0, 10.0, 0.0),
                                            child: Text(
                                              listInsights[index]
                                                      .title
                                                      ?.rendered ??
                                                  "",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 4,
                                              textAlign: TextAlign.start,
                                              style:
                                                  TextStyleWidget.boldTextStyle(
                                                      fontSize: 4.5.w,
                                                      height: 1.2),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                              formatted,
                                              style: TextStyleWidget
                                                  .regularTextStyle1(
                                                      color: textHint,
                                                      fontSize: 3.5.w,
                                                      height: 1.3),
                                            ),
                                          ),
                                          listInsights[index].isExpande == true
                                              ? Html(
                                                  shrinkWrap: true,
                                                  data: listInsights[index]
                                                      .content
                                                      ?.rendered,
                                                )
                                              : Html(
                                                  shrinkWrap: true,
                                                  data: listInsights[index]
                                                      .content
                                                      ?.rendered,
                                                  style: {
                                                      "#": Style(
                                                          maxLines: 2,
                                                          textOverflow:
                                                              TextOverflow
                                                                  .ellipsis)
                                                    }),
                                        ],
                                      ),
                                    ),
                                  );
                                }))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
