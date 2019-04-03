import 'package:flutter/material.dart';
import 'package:news/blocs/newsBloc.dart';
import 'package:news/models/newsModels.dart';

class Home extends StatefulWidget {
  final Widget child;

  Home({Key key, this.child}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int i = 0;

  @override
  void initState() {
    bloc.fetchAllNews();
    super.initState();
  }

  @override
  void dispose() {
    //matikan dispose kalau menggunakan bottom navigation bar
    //bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: StreamBuilder(
        stream: bloc.allNews,
        builder: (context, AsyncSnapshot<Berita> snapshot) {
          if (snapshot.hasData) {
            return newsList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

Widget newsList(AsyncSnapshot<Berita> snapshot) {
  return ListView.builder(
    padding: const EdgeInsets.all(15.0),
    itemCount: snapshot.data.articles.length,
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        leading: Image.network(
          snapshot.data.articles[index].urlToImage,
          width: 100,
          height: 100,
        ),
        title: Text(snapshot.data.articles[index].title),
        subtitle: Text(snapshot.data.articles[index].description),
      );
    },
  );
}
