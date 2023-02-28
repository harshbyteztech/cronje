import 'package:cronje/bloc/member/member_bloc.dart';
import 'package:cronje/screen/splash_screen.dart';
import 'package:cronje/utils/app_color.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'bloc/document/document_bloc.dart';

void main() {
  runApp(const MyApp());
  // runApp(DevicePreview(
  //   builder: (context) => MyApp(), // Wrap your app
  // ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<MemberBloc>(create: (context) => MemberBloc()),
          BlocProvider<DocumentBloc>(create: (context) => DocumentBloc()),
        ],
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Sizer',
              home: SplashScreen(),
            );
          },
        ));
  }
}
