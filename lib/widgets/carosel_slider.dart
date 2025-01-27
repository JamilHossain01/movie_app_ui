import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:movie_app_ui/models/slider_model.dart';

class HomePageSlider extends StatelessWidget {
  final SliderViewModel sliderViewModel = Get.put(SliderViewModel());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Carousel Slider
        Obx(() => CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.5,
                enableInfiniteScroll: true,
                onPageChanged: (index, reason) {
                  sliderViewModel.changeIndex(index);
                },
              ),
              items: sliderViewModel.sliderItems.map((imageUrl) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                );
              }).toList(),
            )),
        SizedBox(height: 10),

        // Custom Indicators
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  sliderViewModel.sliderItems.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => sliderViewModel.changeIndex(entry.key),
                  child: Container(
                    width: 6,
                    height: 6,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: sliderViewModel.currentIndex.value == entry.key
                          ? Colors.red
                          : Colors.grey,
                    ),
                  ),
                );
              }).toList(),
            )),
      ],
    );
  }
}
