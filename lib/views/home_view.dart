import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app_ui_setup/models/artical_model.dart';
import 'package:news_app_ui_setup/models/category_model.dart';
import 'package:news_app_ui_setup/services/news_server.dart';
import 'package:news_app_ui_setup/widgets/categories_card.dart';
import 'package:news_app_ui_setup/widgets/category_list_view.dart';
import 'package:news_app_ui_setup/widgets/news_list_view.dart';
import 'package:news_app_ui_setup/widgets/news_list_view_builder.dart';

import '../widgets/news_card.dart';


class HomeView extends StatelessWidget {
   HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
           SliverToBoxAdapter(child: CategoeyListview(),),
           SliverToBoxAdapter(child: SizedBox(height: 32.0,),),
           NewsListViewBuild(category: 'top'),
         ],
       ),
     ),
    );
  }
}

