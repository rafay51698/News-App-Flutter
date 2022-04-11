import 'package:flutter/material.dart';
import 'package:news_app/helper/services.dart';
import 'package:news_app/model/articlemodel.dart';
import 'package:news_app/widgets/appbar.dart';
import 'package:news_app/widgets/news_tile.dart';

class CategoryNews extends StatefulWidget {
  final String newsCategory;
  const CategoryNews({
    Key? key,
    required this.newsCategory,
  }) : super(key: key);

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(
          context,
          ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<Articlemodel>(
                future: getArticleCategorie(widget.newsCategory),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    // ignore: avoid_print
                    print(snapshot.error);
                    return Text("${snapshot.error}");
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.articles!.length,
                      itemBuilder: (context, index) {
                        return NewsTile(
                          imgUrl:
                              "${snapshot.data!.articles![index].image}",
                          title: "${snapshot.data!.articles![index].title}",
                          description:
                              "${snapshot.data!.articles![index].description}",
                          posturl: "${snapshot.data!.articles![index].url}",
                        );
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
