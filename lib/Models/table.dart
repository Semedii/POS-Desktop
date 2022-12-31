import 'package:flutter/material.dart';

class Table extends StatelessWidget {
  const Table({
   required this.tableNumber,
   required this.borderColor,
   required this.setTable,
    super.key});
  final Color  borderColor;
  final int tableNumber;
  final Function(int n) setTable;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: (){
      setTable(tableNumber);
    },
    child: Container(
      margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: borderColor , width: 2),
                color: Color(0xff1f2029),
              ),
                child: Text("Table ${tableNumber}", style: TextStyle(color: Colors.white),),
              ),
  );
  }
}