import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supercellostore/helper/binding.dart';
import 'package:supercellostore/view/control_view.dart';
import 'package:supercellostore/view/settings/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => ScreenUtilInit(
        designSize: orientation == Orientation.portrait
            ? const Size(375, 812)
            : const Size(812, 375),
        builder: (BuildContext context, child) => GetMaterialApp(
          initialBinding: Binding(),
          theme: ThemesCus().lightTheme,
          darkTheme: ThemesCus().darkTheme,
          themeMode: ThemesCus().getThemeMode(),
          home: const ControlView(),
          debugShowCheckedModeBanner: false,
          title: 'Cello Store',
        ),
      ),
    );
  }
}
