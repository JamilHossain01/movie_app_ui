import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/category_model.dart';
import '../models/movie_model.dart';

Widget buildHorizontalList({
  required RxList<Movie> movies,
  required double imageHeight,
  required double imageWidth,
  required double textSize,
}) {
  return SizedBox(
    height: imageHeight + 30, // Adding space for the text
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];

        return Container(
          margin: EdgeInsets.only(right: 10),
          width: imageWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: imageHeight,
                width: imageWidth,
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
                style: TextStyle(fontSize: textSize, color: Colors.white),
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
