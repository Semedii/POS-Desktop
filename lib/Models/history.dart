import 'package:flutter/material.dart';
import 'package:flutter_pos_app/styles/my_colors.dart';
import 'package:intl/intl.dart';


class History extends StatelessWidget {
  const History({
    required this.quantity,
    required this.productName,
    required this.total,
    required this.date,
    super.key});
  final int quantity;
  final String productName;
  final double total;
  final DateTime date;
  @override
  Widget build(BuildContext context) {
    return
       Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Column(
                children: [
                  Text(DateFormat('yyyy-MM-dd').format(date), style: TextStyle(color: Color(0xff17181f)),)
                ],
              ),
              Column(
                children: [
                  Text(productName, style: TextStyle(color: MyColors.fontColor),)
                ],
              ),
              Column(
                children: [
                  Text("$total", style: TextStyle(color: MyColors.fontColor),),
                  SizedBox(height: 10,)
                ],
              ),
             
            ],
          )
        ],
      
    );
  }
}