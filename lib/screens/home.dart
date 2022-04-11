import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/services.dart';
import 'package:news_app/model/articlemodel.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/screens/category_news.dart';
import 'package:news_app/widgets/news_tile.dart';

import '../widgets/category_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              "Flutter",
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      // ignore: sized_box_for_whitespace
      body: Column(
        children: [
          SizedBox(
            height: 80,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryCard(
                    index: index,
                    imageAssetUrl: categories[index].assetImageURL,
                    categoryName: categories[index].categoryName);
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<Articlemodel>(
                future: getArticle(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    print("error occured");
                    return const Text('');
                  } else {
                    return ListView.builder(
                      // shrinkWrap: true,
                      itemCount: snapshot.data!.articles!.length,
                      itemBuilder: (context, index) {
                        var list = snapshot.data!.articles![index];
                        if (list.image != null || list.description != null) {
                          return NewsTile(
                            imgUrl: "${list.image}",
                            title: "${list.title}",
                            description: "${list.description}",
                            posturl: "${list.url}",
                          );
                        } else {
                          return const Text("aada");
                        }
                      },
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
