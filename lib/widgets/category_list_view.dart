import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/category_model.dart';
import 'package:news_app_ui_setup/widgets/categories_card.dart';

class CategoeyListview extends StatelessWidget {
  List<CategoryModel> cards=[
    CategoryModel(image: 'assets/business.avif',categoryName: 'Business'),
    CategoryModel(image: 'assets/entertaiment.avif',categoryName: 'Entertainment'),
    CategoryModel(image: 'assets/health.avif',categoryName: 'Health'),
    CategoryModel(image: 'assets/science.avif',categoryName: 'Science'),
    CategoryModel(image: 'assets/sports.avif',categoryName: 'Sports'),
    CategoryModel(image: 'assets/technology.jpeg',categoryName: 'Technology'),
  ];
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 125.0,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context,index) {
            return SizedBox(width: 9.0,);
          },
          itemCount: cards.length,
          itemBuilder: (context,index) {
            return CategoryCard(Category: cards[index]);
          }
      ),
    );
  }
}
