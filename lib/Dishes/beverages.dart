import 'package:flutter/material.dart';
import 'package:flutter_pos_app/Data/beverages_data.dart';
import 'package:flutter_pos_app/Data/breakfast_data.dart';
import 'package:flutter_pos_app/Models/item.dart';

class Beverages extends StatelessWidget {
  Beverages({super.key});
  List<Item> myList = BeveragesData.BeveragesList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 4,
        childAspectRatio: (1 / 1.2),
        children: [...myList.map((e) => e).toList()],
      ),
    );
  }
}
