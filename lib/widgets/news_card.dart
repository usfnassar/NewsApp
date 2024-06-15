import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/artical_model.dart';
import 'package:news_app_ui_setup/views/show_news_view.dart';

class NewsCard extends StatelessWidget {
   NewsCard({required this.artical});
  ArticalModel artical;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(context,
            MaterialPageRoute(builder: (context)
            {
              return ShowNewsView(url: artical.url!,);
            }
            )
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:
        [
          ClipRRect(
              borderRadius: BorderRadius.circular(8.0),

              // child: Image.network(
              //   artical.image??'https://images.ctfassets.net/pjshm78m9jt4/7rOCLATbaelXbcYrXLJe9L/28bdbcc9dfffd878608ad139270858b1/PA-25556270.jpg?fm=avif&fit=fill&w=720&h=405&q=80',
              //   fit: BoxFit.cover,
              //   width: double.infinity,
              //   height:250 ,
              // ),

            child: CachedNetworkImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height:250 ,
              imageUrl:artical.image??'',
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                    color: Colors.amber,
                    backgroundColor: Colors.grey,
                    strokeWidth: 10.0,
                  )),
              errorWidget: (context, url, error) => Image.asset('assets/noImage.png'),
            ),


          ),
          SizedBox(height: 12.0,),
          Text(artical.title,
            maxLines: 2,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 10.0,),

          Text(
            artical.supTitle??" ",
            maxLines: 2,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 18.0,
              color: Colors.black87,
            ),

          ),
          SizedBox(height: 12.0,),

        ],
      ),
    );
  }
}
