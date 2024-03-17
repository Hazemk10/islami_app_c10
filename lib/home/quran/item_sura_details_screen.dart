import 'package:flutter/material.dart';
import 'package:islami_app/home/quran/sura_details_screen.dart';
import 'package:islami_app/my_theme.dart';
class ItemSuraDetailsScreen extends StatelessWidget {
  String name;
  int index;
  ItemSuraDetailsScreen({super.key, required this.name,required this.index});

  @override
  Widget build(BuildContext context) {
    return Text(
        '$name(${index+1})',
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
      style:Theme.of(context).textTheme.titleSmall,
    );
  }
}
