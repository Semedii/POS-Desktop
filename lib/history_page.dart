import 'package:flutter/material.dart';
import 'package:flutter_pos_app/Data/sale_history_data.dart';
import 'package:flutter_pos_app/http_request.dart';
import 'package:intl/intl.dart';

import 'Models/history.dart';

class HistoryScreen extends StatefulWidget {
   HistoryScreen({
    super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

double _getTotalSalePerDay(List<History> list){
  double totalSale = 0;
  for(int i = 0; i<list.length; i++){
     totalSale += list[i].total;
  }
  return totalSale;
}

  _sendDailyReport(){
    String date = DateFormat('yyyy-MM-dd').format(SaleHistoryData.saleHistoryData.keys.first);
    List<History> values = SaleHistoryData.saleHistoryData.values.expand((element) => element).toList();
    for(int i=0; i<values.length; i++){

     History history = values[i];
     saveTheDay(date: date, productName: history.productName, Total: history.total,);
    }
    SaleHistoryData.saleHistoryData.clear();
   
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: SaleHistoryData.saleHistoryData.length,
          itemBuilder: (context, index){
            final entry = SaleHistoryData.saleHistoryData.entries.elementAt(index);
            final key = entry.key;
            final value = entry.value;
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey)
              ),
              child: ListTile(
                title: Text(DateFormat('yyyy-MM-dd').format(key)),
                subtitle: Column(children: [
                  ...value.map((e) => History(quantity: e.quantity, productName: e.productName, total: e.total, date: e.date)),
              
                ],)
              ),
            );
          },
        ),
         Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Total sale      ", style: TextStyle(color: Colors.deepOrangeAccent),),
                  Text(" ${_getTotalSalePerDay(SaleHistoryData.saleHistoryData.values.expand((element) => element).toList())}",  style: TextStyle(color: Colors.deepOrangeAccent),)
                ],
              ),
  
 ElevatedButton(onPressed: (){
                setState(() {
                  _sendDailyReport();
                });
                
              }, child: Text("Save Day"))
      ],
    );
    // return ListView(
    //   padding: EdgeInsets.all(20),
    //   children: [
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Text("Product Name", style: TextStyle(color: Colors.red),),
    //         Text("Total", style: TextStyle(color: Colors.red),),
    //         Text("Date", style: TextStyle(color: Colors.red),)
    //       ],
    //     ),
    //     SizedBox(height: 20,),
    //     //...SaleHistoryData.saleHistoryData.map((e) => History(quantity: e.quantity, productName: e.productName, total: e.total, date: e.date,)).toList(),

  
       
   // ]);
    
    
    
  }
}