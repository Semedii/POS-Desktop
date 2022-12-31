import 'package:flutter/material.dart';

class Reciept extends StatelessWidget {
   Reciept({
    required this.tablenumber,
    required this.dishName,
    required this.price,
    super.key});
  final int tablenumber;
  final String dishName;
  final double price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("1"),
              Container(child: Text(dishName)),
              Text("\$${price}")
            ],
          )
        ],
      ),
    );
  }
}