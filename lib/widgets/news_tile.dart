import 'package:flutter/material.dart';
import 'package:news_app/screens/article_view.dart';

class NewsTile extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String description;
  final String posturl;

  const NewsTile({
    Key? key,
    required this.posturl,
    required this.imgUrl,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleNews(
                      url: posturl,
                    )));
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          margin: const EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            // padding: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.bottomCenter,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(6),
                    bottomLeft: Radius.circular(6))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    imgUrl,
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  title,
                  maxLines: 2,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  description,
                  maxLines: 2,
                  style: const TextStyle(color: Colors.black54, fontSize: 14),
                )
              ],
            ),
          )),
    );
  }

  Widget exception() {
    return const Expanded(
        child: Text("Could not load image, check your internet and try again"));
  }
}
// imgUrl == null
//                       ? Text(imgUrl.toString())
//                       : Image.network(
//                           imgUrl,
//                           height: 200,
//                           width: MediaQuery.of(context).size.width,
//                           fit: BoxFit.cover,
//                         ),