import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/models/boarding_model.dart';
import 'package:shop_app/shared/constants/styles/styles.dart';

Widget conditionalBuilder({
  required bool condition,
  required Widget builder,
  Widget? fallback,
}) =>
    condition ? builder : fallback ?? Container();

Widget myDivider() => Padding(
      padding: EdgeInsets.all(defaultPadding_20),
      child: Container(
        width: doubleInfinity,
        height: height_1,
        color: greyColor,
        padding: EdgeInsetsDirectional.only(
          start: defaultPadding_20,
        ),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (route) => false);

Widget buildBoardingItem(BoardingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage(model.image),
          ),
        ),
        SizedBox(
          height: defaultHeight_20 + 10,
        ),
        Text(
          model.title,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: defaultHeight_20,
        ),
        Text(
          model.body,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: defaultHeight_20,
        ),
      ],
    );

// void showToast({
//   required String text,
//   required ToastState state,
// }) =>
//     Fluttertoast.showToast(
//       msg: text,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 5,
//       backgroundColor: chooseToastColor(state),
//       textColor: Colors.white,
//       fontSize: 16.0,
//     );

enum ToastState{SUCCESS, ERROR, WARNING}

Color chooseToastColor(ToastState state)
{
  Color color;
 switch(state) {
   case ToastState.SUCCESS:
     color = Colors.green;
     break;
   case ToastState.ERROR:
     color = Colors.red;
     break;
   case ToastState.WARNING:
     color = Colors.amber;
     break;
 }
 return color;
}