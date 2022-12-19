import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supercellostore/view/settings/themes.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(height: 10.0),
          Expanded(
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
