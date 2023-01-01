import 'package:flutter/material.dart';

class Reciept extends StatelessWidget {
  Reciept(
      {required this.tablenumber,
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
              Text("1", style: TextStyle(color: Colors.deepOrangeAccent),),
              Container(child: Text(dishName , style: TextStyle(color: Colors.deepOrangeAccent))),
              Text("\$${price}", style: TextStyle(color: Colors.deepOrangeAccent),),
            ],
          )
        ],
      ),
    );
  }
}
