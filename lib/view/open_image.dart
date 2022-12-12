// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_saver/gallery_saver.dart';
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
            child: IconButton(
              icon: const Icon(Icons.download),
              onPressed: () async {
                await GallerySaver.saveImage(imageSlid,
                    albumName: 'Shal تشيللو');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تم التحميل ')),
                );
              },
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
              height: MediaQuery.of(context).size.height * 0.75,
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
                borderRadius: BorderRadius.circular(15.r),
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
