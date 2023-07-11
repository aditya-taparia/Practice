import 'dart:math';
import 'package:flutter/material.dart';
import 'package:practice/api/code_run_api.dart';
import 'package:practice/components/code_block.dart';
import 'package:practice/components/input_frame.dart';
import 'package:practice/components/output_frame.dart';

// Window Sizes
double rightWidthPercent = 0.4;
double leftWidthPercent = 0.6;
const minRightWidthPercent = 0.3;
const minLeftWidthPercent = 0.6;

// Language Map
Map<String, String> language = {
  "C": "c",
  "C++": "cpp",
  "C#": "cs",
  "Java": "java",
  "Python": "py",
  "NodeJS": "js",
  "GoLang": "go",
};
String dropdownValue = "Python";

// File Name Controller
final TextEditingController fileNameController = TextEditingController();

// Code Running
bool isRunning = false;
bool isError = false;

class SizeableWindow extends StatefulWidget {
  final bool darkThemeEnabled;
  const SizeableWindow({super.key, required this.darkThemeEnabled});

  @override
  State<SizeableWindow> createState() => _SizeableWindowState();
}

class _SizeableWindowState extends State<SizeableWindow> {
  void updateWidths(Offset offset) {
    final width = MediaQuery.of(context).size.width;
    final delta = offset.dx;
    if (delta.isNegative) {
      leftWidthPercent = max(minLeftWidthPercent, ((leftWidthPercent * width) - delta.abs()) / width);
      rightWidthPercent = 1 - leftWidthPercent;
    } else {
      rightWidthPercent = max(minRightWidthPercent, ((rightWidthPercent * width) - delta.abs()) / width);
      leftWidthPercent = 1 - rightWidthPercent;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fileNameController.text = "Untitled";

    codeController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final windowSize = MediaQuery.of(context).size;

    return Row(
      children: [
        SizedBox(
          width: windowSize.width * leftWidthPercent - 2.5,
          height: windowSize.height,
          child: Column(
            children: [
              Container(
                color: widget.darkThemeEnabled ? const Color(0xff0e161f) : Colors.grey.shade200,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                        ),
                        child: SizedBox(
                          height: 40,
                          width: 200,
                          child: TextField(
                            controller: fileNameController,
                            decoration: InputDecoration(
                              hintText: 'File Name',
                              hintStyle: TextStyle(
                                color: Colors.grey.shade600,
                              ),
                              filled: true,
                              fillColor: widget.darkThemeEnabled ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 12,
                              ),
                              isDense: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  color: Colors.blue.shade700,
                                  width: 1.5,
                                ),
                              ),
                            ),
                            maxLines: 1,
                            cursorColor: widget.darkThemeEnabled ? Colors.white : Colors.black,
                            cursorHeight: 24,
                            style: TextStyle(
                              height: 1.5,
                              fontSize: 16,
                              color: widget.darkThemeEnabled ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.transparent),
                          overlayColor: MaterialStateProperty.all(
                            widget.darkThemeEnabled ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
                          ),
                        ),
                        icon: const Icon(
                          Icons.save_rounded,
                          size: 22,
                        ),
                        tooltip: 'Save',
                        color: widget.darkThemeEnabled ? Colors.white : Colors.black,
                      ),
                      const SizedBox(width: 5),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: widget.darkThemeEnabled ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: DropdownButton(
                            value: dropdownValue,
                            padding: const EdgeInsets.symmetric(
                              vertical: 4.0,
                              horizontal: 10.0,
                            ),
                            icon: Icon(
                              Icons.arrow_drop_down_rounded,
                              color: widget.darkThemeEnabled ? Colors.white : Colors.black,
                            ),
                            alignment: Alignment.center,
                            style: TextStyle(
                              color: widget.darkThemeEnabled ? Colors.white : Colors.black,
                              fontSize: 15,
                              fontFamily: 'SourceCodePro',
                            ),
                            underline: Container(),
                            isDense: true,
                            borderRadius: BorderRadius.circular(10),
                            hint: const Text("Language"),
                            dropdownColor: widget.darkThemeEnabled ? const Color(0xff0e161f) : Colors.grey.shade200,
                            items: language.entries
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e.key,
                                    child: Text(e.key),
                                  ),
                                )
                                .toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;

                                // Change code snippet and theme
                                codeController.text = initialCode[dropdownValue]!;
                                codeController.language = langTheme[dropdownValue]!;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      ElevatedButton.icon(
                        onPressed: codeController.text.isEmpty
                            ? null
                            : isRunning
                                ? null
                                : () {
                                    setState(() {
                                      isRunning = true;
                                    });
                                    CodeRunApi().runCode(codeController.text, language[dropdownValue]!, inputController.text).then((value) {
                                      setState(() {
                                        outputController.text = value['error']!.isEmpty ? value['output']! : value['error']!;
                                        isError = value['error']!.isEmpty ? false : true;
                                        isRunning = false;
                                      });
                                    });
                                  },
                        icon: const Icon(Icons.play_arrow_rounded),
                        label: const Text(
                          "Run",
                          style: TextStyle(fontFamily: 'SourceCodePro'),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade700,
                          foregroundColor: Colors.white,
                          disabledBackgroundColor: widget.darkThemeEnabled ? Colors.grey.shade800.withOpacity(0.5) : Colors.grey.withOpacity(0.5),
                          disabledForegroundColor: widget.darkThemeEnabled ? Colors.white.withOpacity(0.5) : Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: CodeBlock(
                  darkThemeEnabled: widget.darkThemeEnabled,
                ),
              ),
            ],
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.resizeLeftRight,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onHorizontalDragUpdate: (details) {
              updateWidths(details.delta);
            },
            child: Container(
              color: widget.darkThemeEnabled ? const Color(0xff27323a) : const Color(0xffd9d9d9),
              width: 5,
              height: windowSize.height,
            ),
          ),
        ),
        SizedBox(
          width: windowSize.width * rightWidthPercent - 2.5,
          child: Column(
            children: [
              Expanded(
                child: InputFrame(darkThemeEnabled: widget.darkThemeEnabled),
              ),
              Container(
                color: widget.darkThemeEnabled ? const Color(0xff27323a) : const Color(0xffd9d9d9),
                height: 5,
              ),
              Expanded(
                child: OutputFrame(darkThemeEnabled: widget.darkThemeEnabled),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
