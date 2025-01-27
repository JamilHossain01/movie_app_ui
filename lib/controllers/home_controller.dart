import 'package:get/get.dart';
import 'package:movie_app_ui/models/category_model.dart';
import 'package:movie_app_ui/models/movie_model.dart';

class HomeController extends GetxController {
  var categories = <Category>[].obs;
  var trendingMovies = <Movie>[].obs;
  var continueWatching = <Movie>[].obs;
  var recommendedMovies = <Movie>[].obs;

  HomeController() {
    categories.value = [
      Category("All", true),
      Category("Action", false),
      Category("Comedy", false),
      Category("Drama", false),
      Category("Thriller", false),
    ];

    trendingMovies.value = [
      Movie("Soul Mate", "assets/images/soul_mate.png"),
      Movie("UB's Secret", "assets/images/sceret.png"),
      Movie("Yes I Do", "assets/images/yes_i_do.png"),
      Movie("War", "assets/images/war.png"), // Adjusted for uniqueness
    ];

    continueWatching.value = [
      Movie("Wednesday", "assets/images/wednesday.png"),
      Movie("Emily in Paris ", "assets/images/image.png"),
      Movie("Emily in Paris ", "assets/images/image.png"),
    ];

    recommendedMovies.value = [
      Movie("Double Love", "assets/images/dlove.png"),
      Movie("Curse of the River", "assets/images/river.png"),
      Movie("Sunita", "assets/images/sunita.png"),
      Movie("War", "assets/images/war.png"), // Adjusted for uniqueness
    ];
  }

  void selectCategory(int index) {
    for (var i = 0; i < categories.length; i++) {
      categories[i].isSelected = i == index;
    }
    categories.refresh();
  }
}
