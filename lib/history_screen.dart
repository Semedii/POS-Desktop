import 'package:flutter/material.dart';
import 'package:flutter_pos_app/Data/sale_history_data.dart';
import 'package:intl/intl.dart';

import 'Models/history.dart';

class HistoryScreen extends StatelessWidget {
   HistoryScreen({
    super.key});

double _getTotalSalePerDay(DateTime date, List<History> list){
  double totalSale = 0;
  String Date = DateFormat('yyyy-MM-dd').format(date);
  for(int i = 0; i<list.length; i++){
    if(Date.compareTo(DateFormat('yyyy-MM-dd').format(list[i].date)) == 0){
     totalSale += list[i].total;
    }

  }
  return totalSale;
 
}

  _sendDailyReport(){
    SaleHistoryData.saleHistoryData.clear();
   
  }
  
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

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Total sale      ", style: TextStyle(color: Colors.white),),
            Text(" ${_getTotalSalePerDay(DateTime.now(), SaleHistoryData.saleHistoryData)}",  style: TextStyle(color: Colors.white),)
          ],
        ),
        ElevatedButton(onPressed: (){
          _sendDailyReport();
        }, child: Text("Save Day"))
    ]);
    
    
    
  }
}