import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formatted_text/formatted_text.dart';
import 'package:google_fonts/google_fonts.dart';

class ModelText extends StatelessWidget {
  const ModelText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 100),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(right: 4, left: 4, top: 12, bottom: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: const Color.fromARGB(255, 255, 255, 255)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: SvgPicture.asset(
                    colorFilter:
                        const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                    "assets/images/gemini_logo.svg",
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: FormattedText(
                text,
                formatters: [
                  const FormattedTextFormatter(
                      patternChars: '**',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  FormattedTextFormatter(
                      patternChars: '```', style: GoogleFonts.spaceMono()),
                ],
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(
                          text:
                              text.replaceAll("**", "").replaceAll("```", "")));
                    },
                    icon: const Icon(
                      Icons.copy,
                      color: Colors.black,
                      size: 16,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
