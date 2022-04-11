import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:news_app/model/articlemodel.dart';

Future<Articlemodel> getArticle() async {
  var client = http.Client();
  var response = await client.get(Uri.parse(
      "https://gnews.io/api/v4/top-headlines?country=us&token=b8581258c2bb0d8c51a6e6fc16a96451"));
  if (response.statusCode == 200) {
    // ignore: avoid_print
    return Articlemodel.fromJson(jsonDecode(response.body.toString()));
  } else {
    throw Exception("Error in service url");
  }
}

Future<Articlemodel> getArticleCategorie(topic) async {
  var client = http.Client();
  var response = await client.get(Uri.parse(
      "https://gnews.io/api/v4/top-headlines?country=us&topic=$topic&token=b8581258c2bb0d8c51a6e6fc16a96451"));
  if (response.statusCode == 200) {
    // ignore: avoid_print
    return Articlemodel.fromJson(jsonDecode(response.body.toString()));
  } else {
    throw Exception("Error in service url");
  }
}
