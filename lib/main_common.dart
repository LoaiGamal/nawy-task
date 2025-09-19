import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:dio_request_inspector/dio_request_inspector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy_task/common/base/global.dart';
import 'package:nawy_task/common/base/route_manager.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

Future<void> mainCommon(ConfigType configType) async {
  const bool isProduction = bool.fromEnvironment('dart.vm.product');
  if (isProduction) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig().init(configType);
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  // await Network().initAppInterceptors();
  _runApp(configType);
}

void _runApp(ConfigType configType) {
  switch (configType) {
    case ConfigType.dev:
      // _runAppWithInspector();
    case ConfigType.production:
      // runApp(appWidget);
      runApp(const MyApp(),);
  }
}

// void _runAppWithInspector() {
//   runApp(
//     DioRequestInspectorMain(
//       inspector: dioRequestInspector,
//       child: appWidget,
//     ),
//   );
// }

// Widget appWidget = MultiProvider(
//   providers: <SingleChildWidget>[
//     // ChangeNotifierProvider<UserOutOfZoneProvider>(
//     //   create: (BuildContext context) => UserOutOfZoneProvider(),
//     // ),
//   ],
//   child: MultiBlocProvider(
//     providers: <SingleChildWidget>[
//       // BlocProvider<FoodCartCubit>(
//       //   create: (BuildContext context) => getIt<FoodCartCubit>(),
//       // ),
//     ],
//     child: const MyApp(),
//   ),
// );

// final RouteObserver<PageRoute<dynamic>> routeObserver =
// RouteObserver<PageRoute<dynamic>>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<void> _init() async {
    const SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    return;
  }

  @override
  Widget build(BuildContext context) {
    final Widget materialApp = MaterialApp.router(
      routerConfig: RouteManager.router,
      builder: (BuildContext context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(
            textScaler: const TextScaler.linear(1),
          ),
          child: child ?? const SizedBox(),
        );
      },
      title: 'Nawy Task',
      debugShowCheckedModeBanner: false,
    );

    return FutureBuilder<dynamic>(
      future: _init(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (BuildContext context, Widget? child) => materialApp,
        );
      },
    );
  }
}
