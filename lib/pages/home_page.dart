import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Flutter Markdown")
      ),
      body: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 1),
                () =>  rootBundle.loadString("assets/markdown.md")),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if(snapshot.hasData){
            return Markdown(
              data: snapshot.data.toString(),
              styleSheet: MarkdownStyleSheet(
                h1: const TextStyle(
                  color: Colors.blue,
                  fontSize: 48,
                ),
                code: const TextStyle(
                  color: Colors.deepOrange,
                )
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
