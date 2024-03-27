import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_app/component/top_title.dart';
import 'package:flutter_pos_app/cubit/homepage/reciept/reciept_cubit.dart';
import 'package:flutter_pos_app/styles/my_colors.dart';
import '../component/components.dart' as components;
import '../component/reciept.dart';

class RecieptPage extends StatelessWidget {
  const RecieptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecieptCubit(),
      child: _buildBody(),
    );
  }

  BlocBuilder<RecieptCubit, RecieptState> _buildBody() {
    return BlocBuilder<RecieptCubit, RecieptState>(
      builder: (context, state) {
        RecieptCubit cubit = BlocProvider.of<RecieptCubit>(context);
        state as RecieptInitial;
        return Expanded(
          flex: 5,
          child: Container(
              decoration: BoxDecoration(
                  color: MyColors.recieptColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Stack(children: [
                Column(
                  children: [
                    _restaurantInfo(),
                    const SizedBox(height: 20),
                    ..._getOrderedItemsList(state.myList),
                  ],
                ),
                _getRecieptPriceInfo(cubit),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 150,
                      child: GridView.count(
                          crossAxisCount: 3,
                          childAspectRatio: (1.75 / 1),
                          children: state.myTableList
                              .map((e) => components.Table(
                                    tableNumber: e.tableNumber,
                                    isOccupied: e.isOccupied,
                                    borderColor:
                                        e.tableNumber == state.activeTable
                                            ? MyColors.selectedColor
                                            : MyColors.itemBackGroundColor,
                                    setTable: cubit.setTable,
                                  ))
                              .toList()),
                    ),
                  ),
                )
              ])),
        );
      },
    );
  }

  Positioned _getRecieptPriceInfo(RecieptCubit cubit) {
    return Positioned(
      bottom: 180,
      child: Card(
        elevation: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          height: 120,
          decoration: _getRecieptInfoDecoration(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _priceInfo("Sub Total", "\$${cubit.getSubTotal()}"),
                _priceInfo("Tax (10%)",
                    "\$${(0.1 * cubit.getSubTotal()).toStringAsFixed(2)}"),
                _priceInfo("Total",
                    "\$${(0.1 * cubit.getSubTotal() + cubit.getSubTotal()).toStringAsFixed(2)}"),
                _getRecieptButtons(cubit)
              ],
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton _getRecieptButtons(RecieptCubit cubit) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStatePropertyAll<Color>(MyColors.recieptColor),
        ),
        onPressed: cubit.paid,
        child: const Row(
          children: [
            Icon(
              Icons.check,
            ),
            Text("Paid")
          ],
        ));
  }

  BoxDecoration _getRecieptInfoDecoration() {
    return BoxDecoration(
      color: MyColors.billColor,
      borderRadius: BorderRadius.circular(20),
    );
  }

  Padding _restaurantInfo() {
    return const Padding(
      padding: EdgeInsets.only(top: 36),
      child: TopTitle(
        title: 'Liibaan Restaurant',
        subTitle: 'Hodan Street, 32433, LA',
      ),
    );
  }

  _getOrderedItemsList(List<Reciept> myList) {
    return myList.map((e) => Reciept(
        tablenumber: e.tablenumber, dishName: e.dishName, price: e.price));
  }

  Row _priceInfo(String title, String price) {
    return Row(
      children: [
        Text(title),
        const SizedBox(
          width: 180,
        ),
        Text(price),
      ],
    );
  }
}
