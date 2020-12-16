

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class buildSuggestions extends StatelessWidget {
  final List<WordPair> _suggestions = <WordPair>[];            // NEW
  // final List<WordPair> _suggestions ;            // NEW
   final TextStyle _biggerFont = const TextStyle(fontSize: 18);
  // final TextStyle _biggerFont;
  buildSuggestions();
  Widget _buildSuggestions(){
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext _context, int i){
        if(i.isOdd){
          return Divider();
        }
        final int index = i ~/ 2;
        if (index >= _suggestions.length) {
          // ...then generate 10 more and add them to the
          // suggestions list.
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);

      }
      );
  }
  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return _buildSuggestions();
  }
}
