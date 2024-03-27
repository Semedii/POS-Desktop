part of 'home_page_cubit.dart';


class HomePageState {}

class HomePageInitial extends HomePageState {
  final String activeMenu;

  HomePageInitial({this.activeMenu='Breakfast'});

HomePageInitial copyWith({
    String? activeMenu,
  }) {
    return HomePageInitial(
      activeMenu: activeMenu ?? this.activeMenu,
    );
  }
}
