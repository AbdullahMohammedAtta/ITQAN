import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itqan/Cubits/HomeCubit/home_cubit.dart';
import 'package:itqan/Cubits/HomeCubit/home_states.dart';
import 'package:itqan/Pages/favourite_page.dart';
import 'package:itqan/shared/Functions/functions.dart';
import 'package:itqan/shared/Icon/icon_broken.dart';
import 'package:itqan/shared/cache_helper/shared_preferences.dart';

class LayOut extends StatelessWidget {
  LayOut({super.key});

  var searchController = TextEditingController();
  double searchWidth = 0;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        bool isDark = CacheHelper.getData(key: 'isDark')?? false;
        var homeCubit = HomeCubit.get(context);
        return Scaffold(
          //backgroundColor: defaultBackGroundColor,
          appBar: AppBar(
            //backgroundColor: defaultBackGroundColor,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 15),
                Image.asset(height: 30, 'Assets/Images/logoPNG.png', fit: BoxFit.fill),
                if(!isDark)
                  const SizedBox(width: 7),
                if(isDark)
                  Image.asset(height: 35, 'Assets/Images/ITQANPNGDARK.png', fit: BoxFit.fill),
                if(!isDark)
                  Image.asset(height: 25, 'Assets/Images/ITQANPNGLIGHT.png', fit: BoxFit.fill),
              ],
            ),
            actions: [
              Stack(
                children: [
                  IconButton(onPressed: (){
                    navigateTo(context, const FavouritePage());
                  }, icon: const Icon(IconBroken.Heart,size: 25,)),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0,left: 2.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(Icons.circle,color: Colors.red,size: 20,),
                        Text('2',style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(width: 10,),
            ],
          ),
          drawer: Drawer(
            child: SafeArea(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Image.asset('Assets/Images/LOGO.jpg'),
                      IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(IconBroken.Close_Square,size: 35,color: Colors.black,)),
                    ],
                  ),
                  IconButton(
                      icon: Icon(
                          CacheHelper.getBoolean(key: 'isDark')?? true
                              ? Icons.light_mode_outlined
                              : Icons.dark_mode_outlined),
                      onPressed:(){
                        homeCubit.changeThemeMode();
                      }
                  ) ,
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (index)
            {
              homeCubit.changeBottomNav(index,context);
            },
            currentIndex: homeCubit.currentIndex,
            selectedItemColor: Colors.orange,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.grey,
            iconSize: 25,
            items:
            const [
              BottomNavigationBarItem(
                icon: Icon(
                    IconBroken.Home
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                    IconBroken.Category,
                ),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Search,
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Icon(
                      IconBroken.Bag_2,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(Icons.circle,color: Colors.red,size: 16,),
                        Text('6',style: TextStyle(color: Colors.white,fontSize: 11),)
                      ],
                    ),
                  ],
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Setting,
                ),
                label: 'Setting',
              ),
            ],
          ),
          body: homeCubit.screens[homeCubit.currentIndex],
        );
      },
    );
  }
}
