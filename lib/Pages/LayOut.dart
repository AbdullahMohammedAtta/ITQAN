import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itqan/Cubits/HomeCubit/home_cubit.dart';
import 'package:itqan/Cubits/HomeCubit/home_states.dart';
import 'package:itqan/Models/navigations_model.dart';
import 'package:itqan/Pages/favourite_page.dart';
import 'package:itqan/Pages/login_page.dart';
import 'package:itqan/Pages/products_page.dart';
import 'package:itqan/Widgets/my_divider.dart';
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image.asset('Assets/Images/LOGO.jpg'),
                        IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(IconBroken.Close_Square,size: 35,color: Colors.black,)),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text('Welcome Abdullah 👋',style: TextStyle(fontSize: 15),),
                    ),
                    InkWell(
                      onTap: (){
                        homeCubit.getCollectionProducts(25231, 1);
                        navigateTo(context, const ProductsPage(titleName: 'All Products', id: 25231));
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Text('See All Products',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            Spacer(),
                            Icon(IconBroken.Arrow___Right_2)
                          ],
                        ),
                      ),
                    ),
                     ConditionalBuilder(
                       condition: homeCubit.navigationsResponse != null,
                       fallback: (context) => const CircularProgressIndicator(color: Colors.orange,),
                       builder: (context) {
                         return ListView.separated
                           (
                           physics: const NeverScrollableScrollPhysics(),
                           shrinkWrap: true,
                           itemBuilder: (context, index) {
                             return ExpansionTile(
                                 title: Text({(homeCubit.navigationsResponse!.data[index].label)}.toString()),
                               children: homeCubit.navigationsResponse!.data[index].items.map((item) => homeCubit.buildNestedTile(item,context)).toList(),
                             );
                           },
                             separatorBuilder: (context, index) => const SizedBox(height: 3,),
                             itemCount: 2,
                         );
                       },
                     ),
                    const MyDivider(),
                    InkWell(
                      onTap: (){
                        homeCubit.changeThemeMode();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            const Text('Dark mode',style: TextStyle(fontSize: 16),),
                            const Spacer(),
                                  Icon(
                                    CacheHelper.getBoolean(key: 'isDark')?? true
                                        ? Icons.dark_mode_outlined
                                        : Icons.light_mode_outlined),
                          ],
                        ),
                      ),
                    ),
                    TextButton(onPressed: (){navigateTo(context, LoginPage());}, child: const Text('Login'),),
                  ],
                ),
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
