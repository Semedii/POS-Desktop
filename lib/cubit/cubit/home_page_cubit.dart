import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());

  setPage(String menu) {
    emit(HomePageInitial(activeMenu: menu));
  }

  bool isActive(String title) {
    var lastState = state as HomePageInitial;
    if (lastState.activeMenu.compareTo(title) == 0) {
      return true;
    }
    return false;
  }
}
