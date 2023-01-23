import 'package:flutter/material.dart';
import 'package:todo_app/layout/todo_app/cubit.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 0.0,
  Border? border,
  required VoidCallback function,
  required String text,
}) =>
    Container(
      width: width,
      height: 40.0,
      decoration: BoxDecoration(
        border: border,
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged<String>? onChanged,
  ValueChanged<String>? onSubmit,
  required FormFieldValidator<String> validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  bool isPassword = false,
  VoidCallback? suffixPressed,
  GestureTapCallback? onTap,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onChanged: onChanged,
      onFieldSubmitted: onSubmit,
      obscureText: isPassword,
      enabled: isClickable,
      validator: validate,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null ? IconButton(
          icon: Icon(
              suffix
          ),
          onPressed: suffixPressed,
        ) : null,
      ),
    );
 Widget buildTaskItem(Map model, context) => Dismissible(
   key: Key(model['id'].toString()),
   child: Padding(
     padding: const EdgeInsets.all(20.0),
     child: Row(
       children: [
         CircleAvatar(
           radius: 40.0,
           child: Text(
             '${model['time']}',
           ),
         ),
         SizedBox(
           width: 20.0,
         ),
         Expanded(
           child: Column(
             mainAxisSize: MainAxisSize.min,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 '${model['title']}',
                 style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 18.0,
                 ),
               ),
               Text(
                 '${model['date']}',
                 style: TextStyle(
                   color: Colors.grey,
                 ),
               ),
             ],
           ),
         ),
         SizedBox(
           width: 20.0,
         ),
         IconButton(
           icon: Icon(
             Icons.check_box_sharp,
             color: Colors.green,
           ),
           onPressed: ()
           {
             AppCubit.get(context).updateDate(
                 status: 'done',
                 id: model['id']
             );
           },
         ),
         IconButton(
           icon: Icon(
             Icons.archive,
             color: Colors.black45,
           ),
           onPressed: ()
           {
             AppCubit.get(context).updateDate(
                 status: 'archive',
                 id: model['id']
             );
           },
         )
       ],
     ),
   ),
   onDismissed: (direction)
   {
     AppCubit.get(context).deleteDate(id: model['id']);
   },
 );

 Widget conditionalBuilder({
   required bool condition,
   required Widget builder,
   Widget? fallback,
}) => condition ? builder : fallback ?? Container();

 Widget tasksBuilder({
  required List<Map> tasks
}) => conditionalBuilder(
   builder: ListView.separated(
       itemBuilder: (context, index) => buildTaskItem(tasks[index],context),
       separatorBuilder: (context, index) => myDivider(),
       itemCount: tasks.length
   ),
   condition: tasks.length > 0,
   fallback: Center(
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Icon(
           Icons.menu,
           size: 100.0,
           color: Colors.grey,
         ),
         Text(
           'No Tasks Yet, Please Add Some Tasks',
           style: TextStyle(
             fontSize: 16.0,
             fontWeight: FontWeight.bold,
             color: Colors.grey,
           ),
         ),
       ],
     ),
   ),
 );

 Widget myDivider() => Padding(
   padding: const EdgeInsets.all(10.0),
   child: Container(
     width: double.infinity,
     height: 1.0,
     color: Colors.grey[300],
     padding: const EdgeInsetsDirectional.only(
       start: 20.0,
     ),
   ),
 );




 void navigateTo(context, widget) => Navigator.push(
     context,
     MaterialPageRoute(
       builder: (context) => widget,
     ));