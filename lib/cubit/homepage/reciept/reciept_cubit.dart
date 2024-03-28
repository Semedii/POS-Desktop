import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_app/Data/TableforData.dart';
import 'package:flutter_pos_app/Data/reciept_data.dart';
import 'package:flutter_pos_app/Data/sale_history_data.dart';
import 'package:flutter_pos_app/Data/table_number_data.dart';
import 'package:flutter_pos_app/component/history.dart';
import 'package:flutter_pos_app/component/reciept.dart';

part 'reciept_state.dart';

class RecieptCubit extends Cubit<RecieptState> {
  RecieptCubit()
      : super(RecieptInitial());

  initPage(){
    emit(RecieptIdle(
            myTableList: TableNumberData.tableNumberData,
            myList: RecieptData.recieptData));
  }

  setTable(int tablenumber) {
    var lastState = state as RecieptIdle;
    var myList = RecieptData.recieptData
        .where((element) => element.tablenumber == tablenumber)
        .toList();
    emit(lastState.copyWith(myList: myList, activeTable: tablenumber));
  }

  double getSubTotal() {
    var lastState = state as RecieptIdle;
    double subtotal = 0;
    for (int i = 0; i < lastState.myList.length; i++) {
      subtotal += lastState.myList[i].price;
    }
    return subtotal;
  }

  paid() {
    var lastState = state as RecieptIdle;
    List<History> todaySale = [];
    lastState.myTableList
        .where((element) => element.tableNumber == lastState.activeTable)
        .first
        .isOccupied = false;
    List<Reciept> paidList = RecieptData.recieptData
        .where((element) => element.tablenumber == lastState.activeTable)
        .toList();

    for (int i = 0; i < paidList.length; i++) {
      History newSale = History(
          quantity: 3,
          productName: paidList[i].dishName,
          total: paidList[i].price,
          date: DateTime.now());
      todaySale.add(newSale);
      // History newSale = History(productName: paidList[i].dishName, total: paidList[i].price, date: DateTime.now());
      // saveNewSale(productName: paidList[i].dishName, Total: paidList[i].price, Date: DateTime.now());

      RecieptData.recieptData.remove(paidList[i]);
    }
    Map<DateTime, List<History>> map = {DateTime.now(): todaySale};
    SaleHistoryData.saleHistoryData.addAll(map);
    initPage();
  }

  
}
