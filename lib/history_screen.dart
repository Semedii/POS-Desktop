import 'package:flutter/material.dart';
import 'package:flutter_pos_app/Data/sale_history_data.dart';

import 'Models/history.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({
    super.key});


  
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Product Name", style: TextStyle(color: Colors.red),),
            Text("Total", style: TextStyle(color: Colors.red),),
            Text("Date", style: TextStyle(color: Colors.red),)
          ],
        ),
        SizedBox(height: 20,),
        ...SaleHistoryData.saleHistoryData.map((e) => History(productName: e.productName, total: e.total, date: e.date,)).toList(),
    ]);
    
    
    
  }
}