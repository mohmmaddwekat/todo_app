abstract class ShopStates {}

class ShopInitialState extends ShopStates {}

class ShopBottomState extends ShopStates {}

class ShopGetSearchLoadingState extends ShopStates {}

class ShopSearchSuccessState extends ShopStates {}

class ShopSearchErrorState extends ShopStates {
  final String error;
  ShopSearchErrorState(this.error);
}

class ShopChangeModeState extends ShopStates {}
