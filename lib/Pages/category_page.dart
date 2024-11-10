import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itqan/Cubits/HomeCubit/home_cubit.dart';
import 'package:itqan/Cubits/HomeCubit/home_states.dart';
import 'package:itqan/Pages/home_page.dart';
import 'package:itqan/Widgets/CatigoeyItem.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key, required this.id});
  final int id;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var homeCubit = HomeCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return  CategoryItemViewItem(index: index,text: collectionTextList[index], image: collectionImageLinkList[index], id: collectionIdList[index], homeCubit: homeCubit,);
              },
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.all(5.0),
                child: Divider(height: 1,),
              ),
              itemCount: collectionTextList.length,
            ),
          );
        },
    );

  }
}
