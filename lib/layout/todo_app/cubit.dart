import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/layout/todo_app/states.dart';
import 'package:todo_app/modules/todo_modules/archived_tasks/archived_tasks_screen.dart';
import 'package:todo_app/modules/todo_modules/done_tasks/done_tasks_screen.dart';
import 'package:todo_app/modules/todo_modules/new_tasks/new_tasks_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitileState());
  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];
  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];
  Database? database;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];


  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }
  void changeBottomSheetShownState({
    required bool isShow,
    required IconData icon
}) {
    isBottomSheetShown = isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetShownState());
  }
  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT,time TEXT, status TEXT)')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('Error When Createing Table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDateFromDatabase(database);
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

   insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
     await database!.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO tasks(title, date,time,status) VALUES("$title", "$date", "$time", "new")')
          .then((value) {
            print("$value inserted successfully");
            emit(AppInsertDatabaseState());
            getDateFromDatabase(database);
          }).catchError((error) {
            print('ErrorWhen Inserting New Record ${error.toString()}');
          });
      return null;
    });
  }

  void getDateFromDatabase(database)
  {
    newTasks = [];
    doneTasks = [];
    archivedTasks =[];
    emit(AppGetDatabaseLoadingState());
    database!.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if(element['status'] == 'new' )
          newTasks.add(element);
        else if(element['status'] == 'done' )
          doneTasks.add(element);
        else archivedTasks.add(element);
      });
      emit(AppGetDatabaseState());
    }).catchError((error) {
      print('error ${error.toString()}');
    });
  }

  void updateDate({
  required String status,
  required int id,
}) async
  {
    database!.rawUpdate(
      'UPDATE tasks SET status= ? WHERE id=?',
      [status,'$id'],
    ).then((value) {
      getDateFromDatabase(database);
      emit(AppUpdateDatabaseState());
    });

  }

  void deleteDate({
    required int id,
  }) async
  {
    database!.rawDelete(
      'DELETE FROM tasks  WHERE id=?',
      ['$id'],
    ).then((value) {
      getDateFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });

  }


}
