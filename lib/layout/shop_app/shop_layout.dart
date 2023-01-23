import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_app/cubit.dart';
import 'package:shop_app/layout/shop_app/states.dart';
import 'package:shop_app/modules/login/login_screen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer <ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder:  (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Shop App',
            ),
          ),
          body: TextButton(
            onPressed: ()
            {
              CacheHelper.removeData(key: 'token').then((value){
                if(value)
                  {
                    navigateAndFinish(context, LoginScreen());
                  }
              });
            },
            child: Text(
              'SIGN OUT',
            ),
          ),
          // bottomNavigationBar: BottomNavigationBar(
          //   currentIndex: cubit.currentIndex,
          //   items: cubit.bottomItems,
          //   onTap: (index) {
          //     cubit.changeBottomNavigationBar(index);
          //   },
          // ),
        );
      },
    );
  }
}
