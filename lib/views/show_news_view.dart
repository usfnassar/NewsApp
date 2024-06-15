import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShowNewsView extends StatelessWidget {
   ShowNewsView({super.key,required this.url});
String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         iconTheme: IconThemeData(
           color: Colors.amber,

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
      body: Center(
        child: WebView(
          initialUrl: url,
        ),
      ),
    );
  }
}
