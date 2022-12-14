// ignore_for_file: avoid_web_libraries_in_flutter
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:supercellostore/constance.dart';
import 'package:supercellostore/model/carousel_model.dart';
import 'package:supercellostore/view/open_image.dart';

class ImagesSlider extends StatefulWidget {
  final List<CarouselModel> carousel;

  const ImagesSlider({super.key, required this.carousel});

  @override
  State<ImagesSlider> createState() => _ImagesSliderState();
}

class _ImagesSliderState extends State<ImagesSlider> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
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
            itemCount: widget.carousel.length,
            itemBuilder: (context, index, realINdex) {
              final imageSlid = widget.carousel[index].image;
              return buildImage(imageSlid, index);
            },
          ),
          SizedBox(height: 12.h),
          buildIndicator(widget.carousel.length),
        ],
      ),
    );
  }

  Widget buildImage(String imageSlid, int index) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      child: GestureDetector(
        onTap: () {
          Get.to(() => OpenImageScreen(imageSlid: imageSlid));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.r),
          child: Image.network(
            imageSlid,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildIndicator(int index) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: index,
      effect: ScrollingDotsEffect(
        dotColor: Colors.grey.shade800,
        dotHeight: 10,
        dotWidth: 10,
        activeDotColor: primaryColor,
      ),
    );
  }
}
