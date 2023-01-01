import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_pos_app/Dishes/beverages.dart';
import 'package:flutter_pos_app/Dishes/breakfast.dart';
import 'package:flutter_pos_app/Dishes/desserts.dart';
import 'package:flutter_pos_app/Models/main_dish.dart';
import 'package:flutter_pos_app/reciept_page.dart';
import 'package:flutter_pos_app/Models/top_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String activeMenu = 'Breakfast';
  _pageView() {
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
        return const HomePage();
    }
  }

  _setPage(String menu) {
    setState(() {
      activeMenu = menu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 35),
      color: Color.fromARGB(255, 69, 67, 67),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 14,
            child: Column(
              children: [
                TopTitle(
                  title: 'Semedy Restaurant',
                  subTitle: '${DateTime.now()}',
                ),
                _getMenuType(),
                _pageView()
              ],
            ),
          ),
          Expanded(flex: 1, child: Container()),
          RecieptPage()
        ],
      ),
    );
  }

  Widget _itemTab(
      {required String icon, required String title, required bool isActive}) {
    return InkWell(
      onTap: (() => _setPage(title)),
      child: Container(
        width: 180,
        margin: const EdgeInsets.only(right: 26),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xff1f2029),
          border: isActive
              ? Border.all(color: Colors.deepOrangeAccent, width: 3)
              : Border.all(color: const Color(0xff1f2029), width: 3),
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 38,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  bool isactive(String title) {
    if (activeMenu.compareTo(title) == 0) {
      return true;
    }
    return false;
  }

  Widget _getMenuType() {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Center(
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            _itemTab(
              icon: "assets/1.png",
              title: 'Breakfast',
              isActive: isactive('Breakfast'),
            ),
            _itemTab(
              icon: 'assets/1.png',
              title: 'Main Dish',
              isActive: isactive('Main Dish'),
            ),
            _itemTab(
              icon: 'assets/1.png',
              title: 'Beverages',
              isActive: isactive('Beverages'),
            ),
            _itemTab(
              icon: 'assets/1.png',
              title: 'Dessert',
              isActive: isactive('Dessert'),
            )
          ],
        ),
      ),
    );
  }
}
