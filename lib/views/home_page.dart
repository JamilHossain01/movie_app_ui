import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_ui/models/movie_model.dart';
import 'package:movie_app_ui/widgets/carosel_slider.dart';
import '../controllers/home_controller.dart';
import '../widgets/category_section.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E1E),
      body: Column(
        children: [
          // Top Section
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello Jamil",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Let’s watch today",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 24,

                      backgroundColor: Colors
                          .transparent, // Transparent to show the gradient properly
                      child: Image.asset(
                          width: 46, height: 46, "assets/images/Ellipse 4.png"),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Search Box with Filter Button
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        height: 48,
                        decoration: BoxDecoration(
                          color: Color(0xFF1E1E1E), // Dark gray background
                          border: Border.all(
                              color: Color(0xFF888A8F)), // Light gray border
                          borderRadius: BorderRadius.circular(
                              35), // Rounded corners with a radius of 35
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.search, color: Colors.grey),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: "Search",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.tune,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => _buildCategories(controller)),
                    SizedBox(height: 20),
                    HomePageSlider(),
                    SizedBox(height: 20),
                    _buildSectionTitle("Trending Movies"),
                    SizedBox(height: 10),
                    Obx(
                      () => buildHorizontalList(
                        movies: controller.trendingMovies,
                        imageHeight: 127,
                        imageWidth: 99,
                        textSize: 12,
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildSectionTitle("Continue Watching"),
                    SizedBox(height: 10),
                    Obx(
                      () => buildHorizontalList(
                        movies: controller.continueWatching,
                        imageHeight: 98,
                        imageWidth: 167,
                        textSize: 12,
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildSectionTitle("Recommended For You"),
                    SizedBox(height: 10),
                    Obx(
                      () => buildHorizontalList(
                        movies: controller.recommendedMovies,
                        imageHeight: 127,
                        imageWidth: 99,
                        textSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildCategories(HomeController controller) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          final category = controller.categories[index];
          return GestureDetector(
            onTap: () {
              controller.selectCategory(index);
            },
            child: Container(
              margin: EdgeInsets.only(right: 8),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color:
                    category.isSelected ? Color(0xFFFF3440) : Color(0xFF221821),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  category.name,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "See More",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildHorizontalList(RxList<Movie> movies) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];

          return Container(
            margin: EdgeInsets.only(right: 10),
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[700],
                    image: DecorationImage(
                      image: AssetImage(
                          movie.imagePath), // Directly use the imagePath
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  movie.title,
                  style: TextStyle(fontSize: 12, color: Colors.white),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFF1E1E1E),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(icon: Icons.home, isSelected: true),
          _buildNavItem(icon: Icons.chat_bubble_outline),
          _buildNavItem(icon: Icons.download),
          _buildNavItem(icon: Icons.person_outline),
        ],
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, bool isSelected = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isSelected ? Colors.red : Colors.grey,
        ),
        if (isSelected)
          Container(
            margin: EdgeInsets.only(top: 4),
            height: 4,
            width: 4,
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}
