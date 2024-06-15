import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/artical_model.dart';
class NewsServer{
  final Dio dio;
  NewsServer(this.dio);

   Future<List<ArticalModel>> getNews({required String category}) async{
       Response response = await dio.get(
           'https://newsdata.io/api/1/news?apikey=pub_290861eb2e3cd7f4f14178510f7229293a21e&country=eg&category=$category'

       );

       Map<String, dynamic> jsonData = response.data;
       List<dynamic> articles = jsonData["results"];
       List<ArticalModel> ListArticles = [];
       for (var article in articles) {
         ArticalModel articalModel = ArticalModel(
             image: article['image_url'],
             title: article['title'],
             supTitle: article['description'],
             url: article['link']
         );
         ListArticles.add(articalModel);
       }
       return ListArticles;
     }


}