import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlutterTags extends StatelessWidget {
  const FlutterTags({
    required this.child,
    required this.openTag,
    required this.closeTag,
    required this.expand,
    super.key,
  });

  final Widget child;
  final String openTag, closeTag;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            openTag,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey,
              fontStyle: FontStyle.italic,
              fontFamily: GoogleFonts.copse().fontFamily,
            ),
          ),
          //
          expand
              ? Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: child,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: child,
                ),
          //
          Text(
            closeTag,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey,
              fontStyle: FontStyle.italic,
              fontFamily: GoogleFonts.copse().fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
