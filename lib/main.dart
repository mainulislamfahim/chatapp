import 'package:chatapp/services/local_store_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await _setupApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, child) => GetMaterialApp(
        textDirection: TextDirection.ltr,
        theme: ThemeData(
          primaryColor: Colors.green, // Set your desired primary color
          primarySwatch: Colors.green,
        ),
        title: "Shopaholic",
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        // translations: Languages(),
        // locale: HelperUtils.locateLanguage(),
        // fallbackLocale: HelperUtils.locateLanguage(),
      ),
      designSize: const Size(360, 800),
    );
  }
}

Future<void> _setupApp() async {
  // DependencyInjection.init();
  await HiveService.initHive();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // await NotificationManager().initialize();
  // String? token = await FirebaseMessaging.instance.getToken();
  // if (kDebugMode) {
  //   print("Token: $token");
  // }
}
