import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/widgets/news_list_view_builder.dart';

class CategoryViews extends StatelessWidget {
   CategoryViews({required this.categoryName});
  String categoryName;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.amber
        ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title:Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('News',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text('Cloud',
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),

    ),
      body: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: CustomScrollView(
    physics: BouncingScrollPhysics(),
    slivers: [
    SliverToBoxAdapter(child: SizedBox(height: 32.0,),),
    NewsListViewBuild(category: categoryName),
    ],
    ),

    ) );
  }
}
