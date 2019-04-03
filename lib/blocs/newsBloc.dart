import 'package:news/models/newsModels.dart';
import 'package:news/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

final bloc = NewsBloc();

class NewsBloc {
  final _repository = Repository();
  final _newsFercher = PublishSubject<Berita>();

  Observable<Berita> get allNews => _newsFercher.stream;

  fetchAllNews() async {
    Berita news = await _repository.fetchAllBerita();
    _newsFercher.sink.add(news);
  }

  dispose() {
    _newsFercher.close();
  }
}
