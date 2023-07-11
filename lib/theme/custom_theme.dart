import 'package:flutter/material.dart';

final darkColourTheme = {
  // Foreground and background colours
  'root': const TextStyle(
    color: Color(0xffffffff),
    backgroundColor: Color(0xff12202f),
  ),
  // Single line comment
  'comment': const TextStyle(
    color: Color(0xff9198b4),
    fontStyle: FontStyle.italic,
  ),
  'quote': const TextStyle(
    color: Color(0xff5c6370),
    fontStyle: FontStyle.italic,
  ),
  'doctag': const TextStyle(
    color: Color(0xffc0c2c5),
  ),
  // Keywords
  'keyword': const TextStyle(
    color: Color(0xff51c686),
  ),
  'formula': const TextStyle(
    color: Color(0xffc678dd),
  ),
  'section': const TextStyle(
    color: Color(0xffe06c75),
  ),
  'name': const TextStyle(
    color: Color(0xffe06c75),
  ),
  'selector-tag': const TextStyle(
    color: Color(0xffe06c75),
  ),
  'deletion': const TextStyle(
    color: Color(0xffe06c75),
  ),
  'subst': const TextStyle(
    color: Color(0xffe06c75),
  ),
  'literal': const TextStyle(
    color: Color(0xff56b6c2),
  ),
  // Strings
  'string': const TextStyle(
    color: Color(0xffe72b5c),
  ),
  'regexp': const TextStyle(
    color: Color(0xff98c379),
  ),
  'addition': const TextStyle(
    color: Color(0xff98c379),
  ),
  'attribute': const TextStyle(
    color: Color(0xff16adca),
  ),
  'meta-string': const TextStyle(
    color: Color(0xff627978),
  ),
  'built_in': const TextStyle(
    color: Color(0xffe6c07b),
  ),
  'attr': const TextStyle(
    color: Color(0xffd19a66),
  ),
  'variable': const TextStyle(
    color: Color(0xff39bae6),
  ),
  'template-variable': const TextStyle(
    color: Color(0xffd19a66),
  ),
  'type': const TextStyle(
    color: Color(0xffd19a66),
  ),
  'selector-class': const TextStyle(
    color: Color(0xffd19a66),
  ),
  'selector-attr': const TextStyle(
    color: Color(0xffd19a66),
  ),
  'selector-pseudo': const TextStyle(
    color: Color(0xffd19a66),
  ),
  // Numbers
  'number': const TextStyle(
    color: Color(0xffee8666),
  ),
  'symbol': const TextStyle(
    color: Color(0xff39bae6),
  ),
  'bullet': const TextStyle(
    color: Color(0xff16adca),
  ),
  // Link
  'link': const TextStyle(
    color: Color(0xff39bae6),
  ),
  'meta': const TextStyle(
    color: Color(0xff627978),
  ),
  'selector-id': const TextStyle(
    color: Color(0xff39bae6),
  ),
  'title': const TextStyle(
    color: Color(0xff39bae6),
  ),
  'emphasis': const TextStyle(
    fontStyle: FontStyle.italic,
  ),
  'strong': const TextStyle(
    fontWeight: FontWeight.bold,
  ),
};

// Light theme
final lightColourTheme = {
  // Foreground and background colours
  'root': const TextStyle(
    color: Color(0xff000000),
    backgroundColor: Color(0xfffafafa),
    fontWeight: FontWeight.bold,
  ),
  // Single line comment
  'comment': TextStyle(
    color: Colors.grey.shade600,
    fontStyle: FontStyle.italic,
  ),
  'quote': const TextStyle(
    color: Color(0xff5c6370),
    fontStyle: FontStyle.italic,
  ),
  'doctag': const TextStyle(
    color: Color(0xffc0c2c5),
  ),
  // Keywords
  'keyword': TextStyle(
    color: Colors.green.shade600,
  ),
  'formula': const TextStyle(
    color: Color(0xffc678dd),
  ),
  'section': TextStyle(
    color: Colors.red.shade700,
  ),
  'name': TextStyle(
    color: Colors.red.shade700,
  ),
  'selector-tag': TextStyle(
    color: Colors.red.shade700,
  ),
  'deletion': TextStyle(
    color: Colors.red.shade700,
  ),
  'subst': TextStyle(
    color: Colors.red.shade700,
  ),
  'literal': const TextStyle(
    color: Colors.teal,
  ),
  // Strings
  'string': TextStyle(
    color: Colors.red.shade700,
  ),
  'regexp': const TextStyle(
    color: Color(0xff98c379),
  ),
  'addition': const TextStyle(
    color: Color(0xff98c379),
  ),
  'attribute': TextStyle(
    color: Colors.blue.shade800,
  ),
  'meta-string': const TextStyle(
    color: Color(0xff627978),
  ),
  // Built-ins functions
  'built_in': TextStyle(
    color: Colors.deepPurple.shade400,
  ),
  'attr': TextStyle(
    color: Colors.amber.shade800,
  ),
  'variable': TextStyle(
    color: Colors.blue.shade700,
  ),
  'template-variable': const TextStyle(
    color: Color(0xffd19a66),
  ),
  'type': const TextStyle(
    color: Color(0xffd19a66),
  ),
  'selector-class': const TextStyle(
    color: Color(0xffd19a66),
  ),
  'selector-attr': const TextStyle(
    color: Color(0xffd19a66),
  ),
  'selector-pseudo': const TextStyle(
    color: Color(0xffd19a66),
  ),
  // Numbers
  'number': TextStyle(
    color: Colors.orange.shade700,
  ),
  'symbol': TextStyle(
    color: Colors.blue.shade700,
  ),
  'bullet': TextStyle(
    color: Colors.blue.shade700,
  ),
  // Link
  'link': TextStyle(
    color: Colors.blue.shade700,
  ),
  'meta': const TextStyle(
    color: Color(0xff627978),
  ),
  'selector-id': TextStyle(
    color: Colors.blue.shade700,
  ),
  // Title
  'title': TextStyle(
    color: Colors.lightBlue.shade700,
  ),
  'emphasis': const TextStyle(
    fontStyle: FontStyle.italic,
  ),
  'strong': const TextStyle(
    fontWeight: FontWeight.bold,
  ),
};
