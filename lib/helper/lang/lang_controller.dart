import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:supercellostore/main.dart';

class LangController extends GetxController {
  Locale initialLang = sharepref!.getString('lang') == null
      ? Get.deviceLocale!
      : Locale(sharepref!.getString('lang')!);
  void changeLang(String codelang) async {
    Locale locale = Locale(codelang);
    sharepref!.setString('lang', codelang);
    Get.updateLocale(locale);
  }
}
