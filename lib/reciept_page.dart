import 'package:flutter/material.dart';
import 'package:flutter_pos_app/Data/TableforData.dart';
import 'package:flutter_pos_app/Data/reciept_data.dart';
import 'package:flutter_pos_app/Data/sale_history_data.dart';
import 'package:flutter_pos_app/Models/history.dart';
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
      myList = RecieptData.recieptData
          .where((element) => element.tablenumber == tablenumber)
          .toList();
      activeTable = tablenumber;
    });
    if (myList.isNotEmpty) {
      myTableList
          .where((element) => element.tableNumber == tablenumber)
          .first
          .isOccupied = true;
    }
  }

  double _getSubTotal() {
    double subtotal = 0;
    for (int i = 0; i < myList.length; i++) {
      subtotal += myList[i].price;
    }
    return subtotal;
  }

  _paid(int tableNumber) {
    myTableList
        .where((element) => element.tableNumber == tableNumber)
        .first
        .isOccupied = false;
    List<Reciept> paidList =  RecieptData.recieptData.where((element) => element.tablenumber == tableNumber).toList();
    
    for(int i=0; i<paidList.length; i++){
      History newSale = History(productName: paidList[i].dishName, total: _getSubTotal(), date: DateTime.now());
      SaleHistoryData.saleHistoryData.add(newSale);
      RecieptData.recieptData.remove(paidList[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 48, 47, 47),
          borderRadius: BorderRadius.circular(20)
        ),
          
          child: Stack(children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 36),
                  child: TopTitle(
                    title: 'Semedy Restaurant',
                    subTitle: 'Hodan Street, 32433, LA',
                  ),
                ),
                SizedBox(height: 20),
                ...myList.map((e) => Reciept(
                    tablenumber: e.tablenumber,
                    dishName: e.dishName,
                    price: e.price)),
              ],
            ),
            Positioned(
              bottom: 180,
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 161, 156, 156),
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
                          SizedBox(
                            width: 180,
                          ),
                          Text("\$${_getSubTotal()}"),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Tax (10%)"),
                          SizedBox(
                            width: 180,
                          ),
                          Text(
                              "\$${(0.1 * _getSubTotal()).toStringAsFixed(2)}"),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Total"),
                          SizedBox(
                            width: 210,
                          ),
                          Text(
                              "\$${(0.1 * _getSubTotal() + _getSubTotal()).toStringAsFixed(2)}"),
                        ],
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(Icons.print),
                                  Text("Print bills")
                                ],
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                _paid(activeTable);
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: Color.fromARGB(255, 10, 73, 12),
                                  ),
                                  Text("Paid")
                                ],
                              ))
                        ],
                      )
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
                      children: myTableList
                          .map((e) => components.Table(
                                tableNumber: e.tableNumber,
                                isOccupied: e.isOccupied,
                                borderColor: e.tableNumber == activeTable
                                    ? Colors.deepOrangeAccent
                                    : Colors.black,
                                setTable: _setTable,
                              ))
                          .toList()),
                ),
              ),
            )
          ])),
    );
  }
}
