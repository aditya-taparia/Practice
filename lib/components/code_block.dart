import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:highlight/highlight_core.dart';
import 'package:practice/theme/custom_theme.dart';

// Code themes
import 'package:highlight/languages/1c.dart';
import 'package:highlight/languages/cpp.dart';
import 'package:highlight/languages/cs.dart';
import 'package:highlight/languages/java.dart';
import 'package:highlight/languages/python.dart';
import 'package:highlight/languages/javascript.dart';
import 'package:highlight/languages/go.dart';

Map<String, String> initialCode = {
  "C": '''// Sample Code \n\n#include <stdio.h> \nint main() \n{ \n  printf("Hello World!"); \n  return 0; \n}''',
  "C++": '''// Sample Code \n\n#include <iostream> \nusing namespace std; \nint main() \n{ \n  cout << "Hello World!"; \n  return 0; \n}''',
  "C#":
      '''// Sample Code \n\nusing System; public class HelloWorld { \n  public static void Main() \n  { \n    Console.WriteLine("Hello World!"); \n  } \n}''',
  "Java":
      '''// Sample Code \n\nimport java.util.*; \npublic class HelloWorld { \n  public static void main(String[] args) { \n    System.out.println("Hello World!"); \n  } \n}''',
  "Python": '''# Sample Code \n\nprint("Hello World!")''',
  "NodeJS": '''// Sample Code \n\nconsole.log("Hello World!");''',
  "GoLang": '''// Sample Code \n\npackage main \nimport "fmt" \nfunc main() { \n  fmt.Println("Hello World!") \n}''',
};

Map<String, Mode> langTheme = {
  "C": lang1C,
  "C++": cpp,
  "C#": cs,
  "Java": java,
  "Python": python,
  "NodeJS": javascript,
  "GoLang": go,
};

CodeController codeController = CodeController(
  text: initialCode["Python"],
  language: langTheme["Python"],
);

class CodeBlock extends StatefulWidget {
  final bool darkThemeEnabled;
  const CodeBlock({super.key, required this.darkThemeEnabled});

  @override
  State<CodeBlock> createState() => _CodeBlockState();
}

class _CodeBlockState extends State<CodeBlock> {
  @override
  Widget build(BuildContext context) {
    return CodeTheme(
      data: CodeThemeData(
        styles: widget.darkThemeEnabled ? darkColourTheme : lightColourTheme,
      ),
      child: CodeField(
        controller: codeController,
        textStyle: const TextStyle(
          fontSize: 14,
          fontFamily: 'SourceCodePro',
          fontWeight: FontWeight.w400,
          height: 1.4,
        ),
        lineNumberStyle: LineNumberStyle(
          textStyle: TextStyle(
            fontSize: 14,
            fontFamily: 'SourceCodePro',
            fontWeight: FontWeight.w400,
            height: 1.4,
            color: widget.darkThemeEnabled ? const Color(0xff6c6c6c) : const Color(0xffa6a6a6),
          ),
        ),
        smartQuotesType: SmartQuotesType.enabled,
        background: widget.darkThemeEnabled ? const Color(0xff0e161f) : Colors.grey.shade200,
        expands: true,
      ),
    );
  }
}
