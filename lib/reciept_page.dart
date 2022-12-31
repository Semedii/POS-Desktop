import 'package:flutter/material.dart';
import 'package:flutter_pos_app/Data/TableforData.dart';
import 'package:flutter_pos_app/Data/reciept_data.dart';
import 'package:flutter_pos_app/Models/top_title.dart';
import 'Data/table_number_data.dart';
import 'Models/components.dart' as components;
import 'Models/reciept.dart';

class RecieptPage extends StatefulWidget {
  RecieptPage({super.key});

  @override
  State<RecieptPage> createState() => _RecieptPageState();
}

class _RecieptPageState extends State<RecieptPage> {
  List<Reciept> myList = RecieptData.recieptData;
  List<TableforData> myTableList = TableNumberData.tableNumberData;
  
   int activeTable = 1;


   _setTable(int tablenumber) {
  setState(() {
     myList = RecieptData.recieptData.where((element) => element.tablenumber==tablenumber).toList();
     activeTable = tablenumber;
  });
  if(myList.isNotEmpty){
    TableforData table = myTableList.where((element) => element.tableNumber ==tablenumber).first;
    table.isOccupied = true;
  }
   }
    double _getSubTotal(){
      double subtotal = 0;
      for(int i=0; i<myList.length; i++){
        subtotal += myList[i].price;
      }
      return subtotal;
    }
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      flex: 5,
      child: Container(
          color: Color.fromARGB(255, 112, 111, 111),
          child: Stack(
            children:[ Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 36),
                  child: TopTitle(
                    title: 'Semedy Restaurant',
                    subTitle: 'Hodan Street, 32433, LA',
                  ),
                ),
                 SizedBox(height: 20),
                 ...myList.map((e) => Reciept(tablenumber: e.tablenumber, dishName: e.dishName, price: e.price)),

               
                 
              ],
            ),
             Positioned(
              bottom: 180,
                 child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                             
                              children: [
                                Text("Sub Total"),
                                SizedBox(width: 200,),
                                
                                Text("\$${_getSubTotal()}"),
                      
                              ],
                            ),
                             Row(
                            
                              children: [
                                Text("Tax (10%)"),
                                  SizedBox(width: 200,),
                                Text("\$${23}"),
                              ],
                            ),
                           
                             Row(
                              children: [
                                Text("Total"),
                                  SizedBox(width: 230,),
                                Text("\$${23}"),
                              ],
                            ),
                            ElevatedButton(onPressed: (){}, child: Row(
                              children: [
                                Icon(Icons.print),
                                Text("Print bills")
                              ],
                            ))
                            
                      
                          ],
                        ),
                      ),
                    ),
               ),
  
            Positioned.fill(

              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                 height: 150,
                  child: GridView.count(
                   crossAxisCount: 3,
                   childAspectRatio: (1.75 / 1),
                   children: myTableList.map((e) => components.Table(tableNumber: e.tableNumber, isOccupied: e.isOccupied, borderColor: e==activeTable? Colors.deepOrangeAccent : Colors.black,setTable: _setTable,)).toList()

                             ),
                ),
              ),
            )
          ])
      ),
    );
  }
}
