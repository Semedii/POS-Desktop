part of 'reciept_cubit.dart';

class RecieptState {}

class RecieptInitial extends RecieptState {
  List<Reciept> myList;
  List<TableforData> myTableList;

  int activeTable;
  RecieptInitial({this.activeTable = 1, required this.myList, required this.myTableList});

  RecieptInitial copyWith(
      {int? activeTable,
      List<Reciept>? myList,
      List<TableforData>? myTableList}) {

    return RecieptInitial(
        activeTable: activeTable ?? this.activeTable,
        myList: myList ?? this.myList,
        myTableList: myTableList ?? this.myTableList);
  }
}
