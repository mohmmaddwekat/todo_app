import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/layout/todo_app/cubit.dart';
import 'package:todo_app/layout/todo_app/states.dart';
import 'package:todo_app/shared/components/components.dart';

class DoneTasksScreen extends StatelessWidget {
  const DoneTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {

      },
      builder: (context, state)
      {
        var tasks = AppCubit.get(context).doneTasks;
        return tasksBuilder(
            tasks: tasks
        );
      },
    );
  }
}
