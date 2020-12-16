

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class buildSuggestionsState extends State<buildSuggestions> {
  final List<WordPair> _suggestions = <WordPair>[]; // NEW
  // final List<WordPair> _suggestions ;            // NEW
  final _saved = Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);

  // final TextStyle _biggerFont;
  buildSuggestionsState();

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
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
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () =>
      {
        setState(() =>
        {
          if(alreadySaved){
            _saved.remove(pair)
          } else
            {
              _saved.add(pair)
            }})},
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildSuggestions();
  }
}
  class buildSuggestions extends StatefulWidget {
    // TODO: implement createState
    @override
    buildSuggestionsState createState() => new buildSuggestionsState();
  }

