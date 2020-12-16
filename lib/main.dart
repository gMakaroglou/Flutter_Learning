import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:docapp/RandomWords.dart';

void main () => runApp(MyApp());


class MyApp extends StatelessWidget{
    @override
    Widget build(BuildContext context) {
      final wordPair = WordPair.random();
      // TODO: implement build

      //----------------Before Listview------------//
      // return MaterialApp(
      //   title: 'Welcome to Flutter',
      //   home: Scaffold(appBar : AppBar(
      //       title:const Text('Welcome to Flutter'),
      //   ),
      //     body:  Center(
      //       // child : Text(wordPair.asString),
      //       child: RandomWords(),
      //     ),
      // ),
      //
      // );
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RandomWords(),
      );

    }
  }
