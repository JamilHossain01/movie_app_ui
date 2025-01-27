import 'package:get/get.dart';

class SliderViewModel extends GetxController {
  // Observables
  var currentIndex = 0.obs; // Current index for carousel slider
  var sliderItems = <String>[].obs; // List of image URLs for the slider

  // Initialization of data
  SliderViewModel() {
    loadSliderItems();
  }

  // Load slider items (this could fetch data from an API or local source)
  void loadSliderItems() {
    sliderItems.value = [
      "assets/images/carosel.png",
      "assets/images/carosel.png",
      "assets/images/carosel.png",
    ];
  }

  // Change the current index
  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
