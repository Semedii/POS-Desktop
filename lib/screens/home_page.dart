import 'package:flutter/material.dart';
import 'package:flutter_pos_app/Dishes/beverages.dart';
import 'package:flutter_pos_app/Dishes/breakfast.dart';
import 'package:flutter_pos_app/Dishes/desserts.dart';
import 'package:flutter_pos_app/component/main_dish.dart';
import 'package:flutter_pos_app/component/menu_item.dart';
import 'package:flutter_pos_app/cubit/cubit/home_page_cubit.dart';
import 'package:flutter_pos_app/screens/reciept_page.dart';
import 'package:flutter_pos_app/component/top_title.dart';
import 'package:flutter_pos_app/styles/my_colors.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit(),
      child: _buildBody(),
    );
  }

  BlocBuilder<HomePageCubit, HomePageState> _buildBody() {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        state as HomePageInitial;
        final cubit = BlocProvider.of<HomePageCubit>(context);
        final activeMenu = state.activeMenu;

        return Container(
          padding: const EdgeInsets.only(left: 35),
          color: MyColors.centerColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 14,
                child: Column(
                  children: [
                    TopTitle(
                      title: 'Liibaan Restaurant',
                      subTitle: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                    ),
                    _buildMenuType(context, cubit),
                    _buildPageView(activeMenu)
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              RecieptPage(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMenuItem(BuildContext context, MenuItem menuItem) {
    return InkWell(
      onTap: () =>
          BlocProvider.of<HomePageCubit>(context).setPage(menuItem.title),
      child: Container(
        width: 180,
        margin: const EdgeInsets.only(right: 26),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        decoration: _buildMenuItemDecoration(menuItem.isActive),
        child: Row(
          children: [
            Image.asset(
              menuItem.icon,
              width: 38,
            ),
            const SizedBox(width: 8),
            Text(
              menuItem.title,
              style: TextStyle(
                fontSize: 14,
                color: MyColors.fontColor,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  Decoration _buildMenuItemDecoration(bool isActive) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: MyColors.itemBackGroundColor,
      border: Border.all(
        color: isActive ? MyColors.selectedColor : MyColors.itemBackGroundColor,
        width: 3,
      ),
    );
  }

  Widget _buildMenuType(BuildContext context, HomePageCubit cubit) {
    List<MenuItem> menuItems = [
      MenuItem(
          icon: "assets/1.png",
          title: 'Breakfast',
          isActive: cubit.isActive('Breakfast')),
      MenuItem(
          icon: 'assets/1.png',
          title: 'Main Dish',
          isActive: cubit.isActive('Main Dish')),
      MenuItem(
          icon: 'assets/1.png',
          title: 'Beverages',
          isActive: cubit.isActive('Beverages')),
      MenuItem(
        icon: 'assets/1.png',
        title: 'Dessert',
        isActive: cubit.isActive('Dessert'),
      ),
    ];
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: menuItems.map((menuItem) {
          return _buildMenuItem(context, menuItem);
        }).toList(),
      ),
    );
  }

  _buildPageView(String activeMenu) {
    switch (activeMenu) {
      case 'Breakfast':
        return Breakfast();
      case 'Main Dish':
        return MainDish();
      case 'Beverages':
        return Beverages();
      case 'Dessert':
        return Desserts();

      default:
        return HomePage();
    }
  }
}
