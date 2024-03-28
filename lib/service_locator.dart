
import 'package:flutter_pos_app/cubit/homepage/reciept/reciept_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

void setupDependencies() {
  serviceLocator
      .registerSingleton<RecieptCubit>( RecieptCubit());
}