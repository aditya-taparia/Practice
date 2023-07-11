import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice/components/sizeable_window.dart';
import 'package:practice/components/utils.dart';

// Output Controller
final TextEditingController outputController = TextEditingController();

class OutputFrame extends StatefulWidget {
  final bool darkThemeEnabled;
  const OutputFrame({super.key, required this.darkThemeEnabled});

  @override
  State<OutputFrame> createState() => _OutputFrameState();
}

class _OutputFrameState extends State<OutputFrame> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        color: widget.darkThemeEnabled ? const Color(0xff0e161f) : Colors.grey.shade200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Output Console',
                  style: TextStyle(
                    fontSize: 16,
                    color: widget.darkThemeEnabled ? Colors.white : Colors.black,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      outputController.clear();
                    });
                    snackbar(
                      context,
                      const Text(
                        'Console Cleared!',
                        style: TextStyle(color: Colors.black),
                      ),
                      isFloating: true,
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.transparent),
                    overlayColor: MaterialStateProperty.all(
                      widget.darkThemeEnabled ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
                    ),
                  ),
                  icon: const Icon(
                    Icons.clear_all_rounded,
                    size: 22,
                  ),
                  tooltip: 'Clear',
                  color: widget.darkThemeEnabled ? Colors.white : Colors.black,
                ),
                const SizedBox(width: 2),
                IconButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: outputController.text));
                    snackbar(
                      context,
                      const Text(
                        'Copied to Clipboard!',
                        style: TextStyle(color: Colors.black),
                      ),
                      isFloating: true,
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.transparent),
                    overlayColor: MaterialStateProperty.all(
                      widget.darkThemeEnabled ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
                    ),
                  ),
                  icon: const Icon(
                    Icons.copy_rounded,
                    size: 20,
                  ),
                  tooltip: 'Copy',
                  color: widget.darkThemeEnabled ? Colors.white : Colors.black,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: outputController,
              minLines: 10,
              maxLines: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                isDense: true,
                filled: true,
                fillColor: widget.darkThemeEnabled ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.05),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.blue.shade700,
                    width: 1.5,
                  ),
                ),
                enabled: false,
              ),
              cursorColor: widget.darkThemeEnabled ? Colors.white : Colors.black,
              cursorHeight: 20,
              style: TextStyle(
                height: 1.25,
                fontSize: 14,
                color: isError
                    ? Colors.red
                    : widget.darkThemeEnabled
                        ? Colors.white
                        : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
