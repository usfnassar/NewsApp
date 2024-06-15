import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/artical_model.dart';
import 'package:news_app_ui_setup/services/news_server.dart';
import 'package:news_app_ui_setup/widgets/news_list_view.dart';

class NewsListViewBuild extends StatefulWidget {
   String category;
  NewsListViewBuild({required this.category});
  @override
  State<NewsListViewBuild> createState() => _NewsListViewBuildState();
}

class _NewsListViewBuildState extends State<NewsListViewBuild> {

  var future;
  @override
  void initState() {
    future=NewsServer(Dio()).getNews(category: widget.category);
    super.initState();
  }
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticalModel>>(
        future:future,
        builder: (context, snapshot) {

          if (snapshot.hasData) {
            return NewsListView(articals: snapshot.data!);
          }
          else if(snapshot.hasError)
            {
             return ErrorMessage(message: '''
                           oops!!
                           
     check on your Internet connection    
             ''');
            }
          else{
            return LoadingIndicator();
          }
        },
    );

  }

  SliverFillRemaining LoadingIndicator() {
    return SliverFillRemaining(
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.amber,
        ),
      ),
    );
  }

  SliverToBoxAdapter ErrorMessage({required String message}) {
    return SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: Center(
                  child: Text(message,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
              ),
            );
  }
}
