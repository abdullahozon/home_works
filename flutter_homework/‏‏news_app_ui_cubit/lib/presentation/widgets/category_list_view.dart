import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/data/models/category_model.dart';
import 'package:news_app_ui_setup/presentation/widgets/category_card.dart';


class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });

  final List<CategoryModel> categories = const [
    CategoryModel(image: 'assets/technology.jpeg', categoryName: 'technology'),
    CategoryModel(image: 'assets/11.jpg', categoryName: 'sports'),
    CategoryModel(image: 'assets/science.avif', categoryName: 'science'),
    CategoryModel(image: 'assets/health.avif', categoryName: 'health'),
    CategoryModel(image: 'assets/12.jpg', categoryName: 'general'),
    CategoryModel(
        image: 'assets/entertaiment.avif', categoryName: 'entertainment'),
    CategoryModel(image: 'assets/13.jpg', categoryName: 'business')
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(category: categories[index]);
        },
      ),
    );
  }
}
