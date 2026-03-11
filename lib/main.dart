import 'package:bloc_tutorial/bloc/counter/counter_bloc.dart';
import 'package:bloc_tutorial/repository/favourite_repository.dart';
import 'package:bloc_tutorial/ui/counter/counter_screen.dart';
import 'package:bloc_tutorial/ui/favourate_app/favourate_app_screen.dart';
import 'package:bloc_tutorial/ui/login/login_screen.dart';
import 'package:bloc_tutorial/ui/post/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/favourate_app/favourate_app_bloc.dart';
import 'bloc/posts/post_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FavourateAppBloc(FavouriteRepository())),
        BlocProvider(create: (context) => PostBloc()),
      ],
      child: MaterialApp(
          theme: ThemeData(
              brightness: Brightness.dark
          ),
          home:  LoginScreen()
      ),
    );
  }
}
