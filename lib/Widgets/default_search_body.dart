import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itqan/Cubits/HomeCubit/home_cubit.dart';
import 'package:itqan/Cubits/HomeCubit/home_states.dart';

import 'package:itqan/Cubits/SeachCubit/search_cubit.dart';
import 'package:itqan/Pages/products_page.dart';
import 'package:itqan/shared/Conestants/Conestants.dart';
import 'package:itqan/shared/Functions/functions.dart';


class DefaultSearchBody extends StatelessWidget {

  final SearchCubit searchCubit;
  const DefaultSearchBody({super.key, required this.searchCubit,});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var homeCubit = HomeCubit.get(context);
        return  Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(child: Text('What do you want to search about ?')),
              const SizedBox(height: 15,),
              ConditionalBuilder(
                condition: searchCubit.categoriesModel != null,
                fallback: (context) {
                  return Center(child: CircularProgressIndicator(color: defaultColor,));
                },
                builder: (context) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            homeCubit.getCollectionProducts(searchCubit.categoriesModel!.data[index].id, 1);
                            navigateTo(context, ProductsPage(titleName: '${searchCubit.categoriesModel!.data[index].name}', id: searchCubit.categoriesModel!.data[index].id));
                          },
                          child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                //color: Colors.orange.shade50,
                                  borderRadius: BorderRadiusDirectional.circular(10),
                                  border: Border.all(color: Colors.grey,)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(searchCubit.categoriesModel!.data[index].name,style: const TextStyle(fontSize: 18),),
                              )),
                        );
                      },
                      separatorBuilder:(context, index) =>  const SizedBox(height: 10,),
                      itemCount: searchCubit.categoriesModel!.data.length,
                    ),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
