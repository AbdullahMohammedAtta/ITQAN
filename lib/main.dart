import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itqan/Cubits/HomeCubit/home_cubit.dart';
import 'package:itqan/Cubits/HomeCubit/home_states.dart';
import 'package:itqan/Pages/LayOut.dart';
import 'package:itqan/shared/MyBlocObserver/bloc_observer.dart';
import 'package:itqan/shared/cache_helper/shared_preferences.dart';
import 'package:itqan/shared/themes/themes.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getFeMaleProducts()..getMaleProducts()..getNavigations(),
      child: BlocConsumer<HomeCubit,HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          bool isDark = CacheHelper.getData(key: 'isDark')?? HomeCubit.get(context).isDark;
          //print('isDark: $isDark');
          return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          home: LayOut(),
        );
      },
      ),
    );
  }
}


