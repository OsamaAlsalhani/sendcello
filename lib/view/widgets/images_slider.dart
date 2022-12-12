// ignore_for_file: avoid_web_libraries_in_flutter
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:supercellostore/constance.dart';
import 'package:supercellostore/core/view&model/cart_viewmodel.dart';
import 'package:supercellostore/model/carousel_model.dart';

class ImagesSlider extends StatefulWidget {
  final CarouselModel imagescar;

  const ImagesSlider({super.key, required this.imagescar});

  @override
  State<ImagesSlider> createState() => _ImagesSliderState();
}

class _ImagesSliderState extends State<ImagesSlider> {
  int activeIndex = 0;
  toListOfString(CarouselModel list) {
    List<String> stringList = [];
    for (var i = 0; i < list.imageSlider.length; i++) {
      stringList.add(list.imageSlider[i]);
    }

    return stringList;
  }

  @override
  Widget build(BuildContext context) {
    List<String> images = toListOfString(widget.imagescar);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.circular(15),
      ),
      height: 200.h,
      width: 300.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 8.h),
          CarouselSlider.builder(
            options: CarouselOptions(
                enableInfiniteScroll: false,
                height: 150,
                initialPage: 0,
                autoPlay: true,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                autoPlayInterval: const Duration(seconds: 2),
                onPageChanged: (index, reason) {
                  setState(() => activeIndex = index);
                }),
            itemCount: images.length,
            itemBuilder: (context, index, realINdex) {
              final imageSlid = images[index];
              return buildImage(imageSlid, index);
            },
          ),
          SizedBox(height: 12.h),
          buildIndicator(images),
        ],
      ),
    );
  }

  Widget buildImage(String imageSlid, int index) {
    return GetBuilder<CartViewModel>(
      builder: (controller) => Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
        margin: EdgeInsets.symmetric(horizontal: 12.w),
        child: GestureDetector(
          onTap: () {
            // Get.to(() => OpenImageScreen(imageSlid: imageSlid));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Image.network(
              imageSlid,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildIndicator(List<String> images) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: images.length,
      effect: ScrollingDotsEffect(
        dotColor: Colors.grey.shade800,
        dotHeight: 10,
        dotWidth: 10,
        activeDotColor: primaryColor,
      ),
    );
  }
}
