import 'package:flutter/material.dart';
import 'package:flutter_pos_app/Data/breakfast_data.dart';
import 'package:flutter_pos_app/Data/desserts_data.dart';
import 'package:flutter_pos_app/Models/item.dart';

class Desserts extends StatelessWidget {
  Desserts({super.key});
  List<Item> myList = DessertsData.DessertsList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 4,
        childAspectRatio: (1 / 1.2),
        children: [
          ...myList.map((e) => e).toList()
        ],
      ),
    );
  }
}