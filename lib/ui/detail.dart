import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Detail extends StatelessWidget {
  final String urlb, titleb;

  Detail({Key key, this.urlb, this.titleb}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: urlb.toString(),
      appBar: new AppBar(
        backgroundColor: Colors.blue,
        title: new Text(
          titleb,
        ),
      ),
      initialChild: Container(
        color: Colors.blueAccent,
        child: const Center(
          child: Text(
            'Waiting.....',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
