import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/artical_model.dart';
import 'package:news_app_ui_setup/services/news_server.dart';
import 'package:news_app_ui_setup/widgets/news_card.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({required this.articals});
  final List<ArticalModel> articals;

  @override
  Widget build(BuildContext context) {
    return  SliverList(

      delegate:SliverChildBuilderDelegate(
        childCount: articals.length,
            (context, index)
        {
          return NewsCard(artical: articals[index],);
        }
        ,),
    );
  }
}
