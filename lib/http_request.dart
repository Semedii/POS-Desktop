import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

   void saveNewSale({required String productName, required double Total, required DateTime Date}) {
    final url = Uri.parse("https://capstonepos-d22f2-default-rtdb.firebaseio.com/Sales.json");
    http.post(url, body: json.encode({
      'ProductName': productName,
      'Total': Total,
      'Date': Date.toString(),
    }));
   }

     void saveTheDay({required String date, required String productName, required double Total}) {
    final url = Uri.parse("https://capstonepos-d22f2-default-rtdb.firebaseio.com/Daily/$date.json");
    http.post(url, body: json.encode({
      'ProductName': productName,
      'Total': Total,
    }));
   }