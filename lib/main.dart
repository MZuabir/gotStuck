import 'dart:async';

// import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:got_stuck/screens/homeScreen/HomeScreen.dart';
import 'package:got_stuck/screens/splashScreen/SplashScreen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_preview/device_preview.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  try {
    await Firebase.initializeApp();
  } catch (e) {
    debugPrint('Error initializing Firebase: $e');
  }

  configLoading();
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String photo = '';

  @override
  void initState() {
    super.initState();
    getEmailFromPrefs();
    // EasyLoading.removeCallbacks();
  }

  void getEmailFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      photo = prefs.getString('photo')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    // for device preview wrap Material app in device preview and uncomment lines below
    return DevicePreview(
      enabled: true,
      builder: (context) {
        return MaterialApp(
          builder: DevicePreview.appBuilder,
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),

          // builder: EasyLoading.init(
          //   builder: (context, child) {
          //     return MediaQuery(
          //       data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          //       child: child ?? const SizedBox.shrink(),
          //     );
          //   },
          // ),
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(useMaterial3: true),
          home: (photo.isEmpty) ? const SplashScreen() : const HomeScreen(),
          // home: SplashScreen(),
        );
      },
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(seconds: 2)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..userInteractions = false
    ..dismissOnTap = false;
}
