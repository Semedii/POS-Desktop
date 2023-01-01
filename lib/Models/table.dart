import 'package:flutter/material.dart';

class Table extends StatelessWidget {
  const Table(
      {required this.tableNumber,
      required this.borderColor,
      required this.setTable,
      required this.isOccupied,
      super.key});
  final Color borderColor;
  final int tableNumber;
  final Function(int n) setTable;
  final bool isOccupied;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setTable(tableNumber);
      },
      child: Container(
        height: 20,
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor, width: 2),
          color: Color(0xff1f2029),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Table ${tableNumber}",
              style: TextStyle(color: Colors.white),
            ),
            isOccupied
                ? Icon(
                    Icons.people,
                    color: Colors.red,
                    size: 12,
                  )
                : Text(""),
          ],
        ),
      ),
    );
  }
}
