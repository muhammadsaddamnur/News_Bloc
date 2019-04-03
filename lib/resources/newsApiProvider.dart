import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Client;
import 'package:news/models/newsModels.dart';

class NewsApiProvider {
  Client client = Client();
  final _url =
      "https://newsapi.org/v2/top-headlines?country=id&apiKey=34aa97f8b14242ce99fb3d78d8fefe92";

  Future<Berita> fetchNewsList() async {
    final response = await client.get(_url);
    if (response.statusCode == 200) {
      return compute(beritaFromJson, response.body);
    } else {
      throw Exception('Failed to Load');
    }
  }
}
