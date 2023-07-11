import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice/components/utils.dart';

// Input Controller
final TextEditingController inputController = TextEditingController();

class InputFrame extends StatefulWidget {
  final bool darkThemeEnabled;
  const InputFrame({super.key, required this.darkThemeEnabled});

  @override
  State<InputFrame> createState() => _InputFrameState();
}

class _InputFrameState extends State<InputFrame> {
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
                  'Input Console',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'SourceCodePro',
                    color: widget.darkThemeEnabled ? Colors.white : Colors.black,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: inputController.text));
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
              controller: inputController,
              minLines: 10,
              maxLines: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Your Input...',
                hintStyle: TextStyle(
                  color: Colors.grey.shade600,
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
              ),
              cursorColor: widget.darkThemeEnabled ? Colors.white : Colors.black,
              cursorHeight: 20,
              style: TextStyle(
                height: 1.25,
                fontSize: 14,
                color: widget.darkThemeEnabled ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
