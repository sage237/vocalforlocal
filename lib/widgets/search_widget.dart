import 'package:flutter/material.dart';
import 'package:vocalforlocal/core_theme/text_theme.dart';

import '../utils/screen_util.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // return TextField(
    //   readOnly: true,
    //   style: const TextStyle(
    //     color: Colors.white54,
    //   ),
    //
    //   decoration: InputDecoration(
    //     prefix: const Text('+91  '),
    //     labelStyle: TextStyle(
    //       color: Colors.white54,
    //       fontSize: AppTextTheme.newTextThemeDark.bodyLarge!.fontSize,
    //     ),
    //     labelText: "Search...",
    //     focusedErrorBorder: const OutlineInputBorder(
    //         borderSide: BorderSide(color: Colors.orangeAccent)),
    //     errorBorder: const OutlineInputBorder(
    //         borderSide: BorderSide(color: Colors.orangeAccent)),
    //     errorStyle: const TextStyle(color: Colors.orangeAccent),
    //     enabledBorder: const OutlineInputBorder(
    //         borderSide: BorderSide(color: Colors.white54)),
    //     focusedBorder: const OutlineInputBorder(
    //         borderSide: BorderSide(color: Colors.blue)),
    //   ),
    //   // inputFormatters: [LengthLimitingTextInputFormatter(10)],
    // );

    return Container(
      height: Responsive.safeBlockVerticalWAB * 6,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white60),
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.safeBlockHorizontal * 3,
            ),
            child: const Icon(Icons.search),
          ),
          Text(
            'Search...',
            style: AppTextTheme.newTextThemeDark.titleMedium,
          )
        ],
      ),
    );
  }
}
