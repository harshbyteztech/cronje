import 'dart:io';

import 'package:cronje/utils/app_color.dart';
import 'package:dio/dio.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';

import '../widget/app_bar.dart';
import '../widget/custom_button.dart';

class ViewPDFScreen extends StatefulWidget {
  String pdfFile;

  ViewPDFScreen({required this.pdfFile});

  @override
  State<ViewPDFScreen> createState() => _ViewPDFScreenState();
}

class _ViewPDFScreenState extends State<ViewPDFScreen> {
  void getPermission() async {
    print("getPermission");
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    print(statuses[Permission.storage]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
            children: [
              AppBarWidget(
                backPress: false,
                page: 0,
              ),
              PDF().cachedFromUrl(
                widget.pdfFile,
                placeholder: (progress) =>
                const Center(
                    child: CircularProgressIndicator(
                      color: mainColor,
                    )),
                errorWidget: (error) => Center(child: Text(error.toString())),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: AppBarWidget(
                  backPress: false,
                  page: 0,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () async {
                    var first = widget.pdfFile
                        .split("/")
                        .last;
                    // getPermission();
                    final String
                    dir =
                        (await getApplicationDocumentsDirectory())
                            .path;
                    final String
                    path =
                        '$dir/$first';
                    // String path =
                    // await ExternalPath.getExternalStoragePublicDirectory(
                    //     ExternalPath.DIRECTORY_DOWNLOADS);
                    final file = File(path);

                    var response = await Dio().get(widget.pdfFile,
                        options: Options(
                            responseType: ResponseType.bytes,
                            followRedirects: false,
                            receiveTimeout: 0));
                    final ref = file.openSync(mode: FileMode.write);
                    ref.writeFromSync(response.data);
                    await ref.close();
                    Share.shareXFiles([XFile(file.path)]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 60,
                      width: 60,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: mainColor, borderRadius: BorderRadius.circular(10.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.share,size: 25,color: whiteColor),
                        ],
                      ),
                    ),
                  ),
                ),

                // Container(
                //   padding: const EdgeInsets.all(8.0),
                //   child:
                //   CustomButtonWithIcon(
                //       onTap: () async {
                //         var first = widget.pdfFile
                //             .split("/")
                //             .last;
                //         getPermission();
                //         String path =
                //         await ExternalPath.getExternalStoragePublicDirectory(
                //             ExternalPath.DIRECTORY_DOWNLOADS);
                //         final file = File('$path/${'$first'}');
                //
                //         var response = await Dio().get(widget.pdfFile,
                //             options: Options(
                //                 responseType: ResponseType.bytes,
                //                 followRedirects: false,
                //                 receiveTimeout: 0));
                //         final ref = file.openSync(mode: FileMode.write);
                //         ref.writeFromSync(response.data);
                //         await ref.close();
                //         Share.shareXFiles([XFile(file.path)]);
                //       },
                //       icon: Icons.share,
                //       text: "SHARE PDF"),
                // ),
              ),
            ],
          )),
    );
  }
}
