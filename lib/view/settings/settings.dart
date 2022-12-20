import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supercellostore/helper/lang/lang_controller.dart';
import 'package:supercellostore/view/settings/themes.dart';
import 'package:supercellostore/view/widgets/custom_button.dart';
import 'package:supercellostore/view/widgets/custom_text.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool isDark = false;
  LangController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CustomText(
                  text: 'Switch Mode To',
                  alignment: Alignment.center,
                ),
                const SizedBox(height: 10.0),
                isDark
                    ? const CustomText(text: 'Dark')
                    : const CustomText(text: 'Light'),
                IconButton(
                  icon: isDark
                      ? const Icon(CupertinoIcons.moon_stars)
                      : const Icon(CupertinoIcons.sun_dust),
                  onPressed: () {
                    setState(() {
                      ThemesCus().changeTheme();
                      isDark = !isDark;
                    });
                  },
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomText(
                text: 'Switch Language To',
                alignment: Alignment.center,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomButton(
                    text: 'Arabic',
                    onPressed: () {
                      controller.changeLang('ar');
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomButton(
                    text: 'English',
                    onPressed: () {
                      controller.changeLang('en');
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
