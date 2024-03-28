part of 'reciept_cubit.dart';

class RecieptState {}

class RecieptInitial extends RecieptState{}

class RecieptIdle extends RecieptState {
  List<Reciept> myList;
  List<TableforData> myTableList;

  int activeTable;
  RecieptIdle({this.activeTable = 1, required this.myList, required this.myTableList});

  RecieptIdle copyWith(
      {int? activeTable,
      List<Reciept>? myList,
      List<TableforData>? myTableList}) {

    return RecieptIdle(
        activeTable: activeTable ?? this.activeTable,
        myList: myList ?? this.myList,
        myTableList: myTableList ?? this.myTableList);
  }
}
