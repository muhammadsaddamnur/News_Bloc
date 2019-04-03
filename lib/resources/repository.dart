import 'dart:async';

import 'package:news/models/newsModels.dart';
import 'package:news/resources/newsApiProvider.dart';

class Repository {
  final newsApiProvider = NewsApiProvider();

  Future<Berita> fetchAllBerita() => newsApiProvider.fetchNewsList();
}
