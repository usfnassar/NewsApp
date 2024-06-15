import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/category_model.dart';
import 'package:news_app_ui_setup/views/category_views.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({required this.Category});
 CategoryModel Category;
  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return CategoryViews(categoryName: Category.categoryName,);
        }));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: AssetImage(Category.image),
            fit: BoxFit.fill
          ),
        ),
        width: 200,
        child: Center(child: Text(Category.categoryName,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),

        )),
      ),
    );
  }
}
