import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_app/states.dart';
import 'package:shop_app/modules/categories/categories_screen.dart';
import 'package:shop_app/modules/favorites/favorites_screen.dart';
import 'package:shop_app/modules/products/products_screen.dart';
import 'package:shop_app/modules/settings/settings_screen.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

class ShopCubit extends Cubit<ShopStates>
{
  ShopCubit() : super(ShopInitialState());

  bool isDark = false;
  int currentIndex = 0;
  List<Widget> bottomScreen =
  [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  static ShopCubit get(context) => BlocProvider.of(context);
  void changeBottom(index)
  {
    currentIndex = index;
    emit(ShopBottomState());
  }
  void changeAppMode({bool? fromShared})
  {
    if(fromShared != null){
      isDark = fromShared;
      emit(ShopChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.saveData(
          key: 'isDark',
          value: isDark
      ).then((value) {
        emit(ShopChangeModeState());
      });
    }
  }
}