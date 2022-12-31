import 'package:flutter/material.dart';
import 'package:flutter_pos_app/Data/reciept_data.dart';
import 'package:flutter_pos_app/Models/reciept.dart';

class Item extends StatefulWidget {
   Item({
    required this.image,
    required this.title,
    required this.price,
    super.key});

  final String image;
  final String title;
  final double price;
  int tablenumber = 1;
  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: const EdgeInsets.only(right: 20, bottom: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const Color(0xff1f2029),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(widget.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${widget.price}",
                style: const TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 20,
                ),
              ),
              IconButton(onPressed: (){
                _getDialog(context);
              }, icon: Icon(Icons.add_circle_outline_sharp, color: Colors.white,))
            ],
          ),
        ],
      ),
    );
  }


 _getDialog(BuildContext context,){
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text('Please enter the table number'),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (value) {
                setState(() {
                  widget.tablenumber = int.parse(value);
                });
                // store the entered value in a variable
              },
            ),
          ),
          ElevatedButton(
            child: Text('Add'),
            onPressed: () {
              // use the entered value
              RecieptData.recieptData.add(Reciept(tablenumber: widget.tablenumber, dishName: widget.title, price: widget.price));
              Navigator.of(context).pop();
            },
          )
        ],
      );
    },
  );
}
}