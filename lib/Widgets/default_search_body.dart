import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itqan/Cubits/HomeCubit/home_cubit.dart';
import 'package:itqan/Cubits/HomeCubit/home_states.dart';
import 'package:itqan/Pages/products_page.dart';
import 'package:itqan/Widgets/my_divider.dart';
import 'package:itqan/shared/Functions/functions.dart';
import 'package:itqan/shared/Icon/icon_broken.dart';

class DefaultSearchBody extends StatelessWidget {
  
  const DefaultSearchBody({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var homeCubit = HomeCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: Text('What do you want to search about ?')),
              const SizedBox(height: 30,),
              InkWell(
                onTap: (){
                  homeCubit.getCollectionProducts(25231, 1);
                  navigateTo(context, const ProductsPage(titleName: 'All Products', id: 25231));
                },
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Text('Get All Products',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      Spacer(),
                      Icon(IconBroken.Arrow___Right_2)
                    ],
                  ),
                ),
              ),
              const MyDivider(),
              const SizedBox(height: 30,),
              const ExpansionTile(
                title: Text('Products',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                children: [
                  ExpansionTile(
                    title: Text('Sneakers',style: TextStyle(fontSize: 15,),),
                    children: [
                      ListTile(
                        title: Text('Male',style: TextStyle(fontSize: 10,),),
                      ),
                      ListTile(
                        title: Text('FeMale',style: TextStyle(fontSize: 10,),),
                      ),
                      ListTile(
                        title: Text('unisex',style: TextStyle(fontSize: 10,),),
                      ),
                      ListTile(
                        title: Text('Kids',style: TextStyle(fontSize: 10,),),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text('show',style: TextStyle(fontSize: 15,),),
                    children: [
                      ListTile(
                        title: Text('Male',style: TextStyle(fontSize: 10,),),
                      ),
                    ],
                  ),
                  ListTile(
                    title: Text('Shoe Care',style: TextStyle(fontSize: 15,),),
                  ),
                  ListTile(
                    title: Text('Socks',style: TextStyle(fontSize: 15,),),
                  ),
                  ListTile(
                    title: Text('Bags',style: TextStyle(fontSize: 15,),),
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              const ExpansionTile(
                title: Text('Brands',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                textColor: Colors.orange,
                children: [
                  ListTile(
                    title: Text('nike'),
                  ),
                  ListTile(
                    title: Text('Adidas'),
                  ),
                  ListTile(
                    title: Text('NewBalance'),
                  ),
                  ListTile(
                    title: Text('Zara'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
