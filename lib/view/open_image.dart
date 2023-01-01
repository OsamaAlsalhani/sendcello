// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages, deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'widgets/custom_text.dart';

class OpenImageScreen extends StatelessWidget {
  final String imageSlid;

  const OpenImageScreen({super.key, required this.imageSlid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'عارض الصور',
          fontWeight: FontWeight.bold,
          fontSize: 24,
          alignment: Alignment.center,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                IconButton(
                  onPressed: () async {
                    final url = Uri.parse(imageSlid);
                    final response = await http.get(url);
                    final bytes = response.bodyBytes;

                    final temp = await getTemporaryDirectory();
                    final path = '${temp.path}/image.png';
                    File(path).writeAsBytesSync(bytes);

                    await Share.shareFiles([path], text: 'shal تشيللو');
                  },
                  icon: const Icon(Icons.share),
                ),
                IconButton(
                  onPressed: () async {
                    await GallerySaver.saveImage(imageSlid,
                        albumName: 'Shal تشيللو');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('تم التحميل ')),
                    );
                  },
                  icon: const Icon(Icons.download),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 25,
                    color: Colors.black54,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Hero(
                  tag: imageSlid,
                  child: Image.network(
                    imageSlid,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
