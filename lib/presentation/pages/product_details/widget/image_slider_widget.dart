import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/color_resources.dart';

class ImageSliderWidget extends StatefulWidget {
  final List<String> images;

  const ImageSliderWidget({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  State<ImageSliderWidget> createState() => _ImageSliderWidgetState();
}

class _ImageSliderWidgetState extends State<ImageSliderWidget> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 24.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.w),
            child: Container(
              height: 140.h,
              color: ColorResources.productBgColor,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.width,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  // autoPlay: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                items: widget.images
                    .map((item) => Center(
                        child: Image.network(
                      item,
                      fit: BoxFit.cover,
                      height: 140.h,
                    )))
                    .toList(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.images.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 4.w,
                  height: 4.w,
                  margin: EdgeInsets.symmetric(vertical: 4.w, horizontal: 4.w),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : ColorResources.blue)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
