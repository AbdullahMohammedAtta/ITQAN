import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itqan/Cubits/HomeCubit/home_cubit.dart';
import 'package:itqan/Cubits/HomeCubit/home_states.dart';
import 'package:itqan/Widgets/GridViewItem.dart';
import 'package:itqan/shared/Conestants/Conestants.dart';
import 'package:itqan/shared/Icon/icon_broken.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key, required this.titleName, required this.id, });

  final String titleName;
  final int id;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(titleName),
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(IconBroken.Arrow___Left_2)),
      ),
      body: BlocConsumer<HomeCubit,HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {

            var homeCubit = HomeCubit.get(context);

            return ConditionalBuilder(
              condition: homeCubit.collectionProducts != null,
              fallback: (context) => Center(child: CircularProgressIndicator(color: defaultColor,)),
              builder: (context) {
                return ConditionalBuilder(
                    condition: homeCubit.collectionProducts!.products.isEmpty || state is GetProductErrorState,
                    fallback: (context) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: GridView.count(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 2,
                                mainAxisSpacing: 0.0,
                                crossAxisSpacing: 0.0,
                                childAspectRatio: 1 / 1.4,
                                children: List.generate(
                                  homeCubit.collectionProducts!.products.length,
                                      (index) {
                                    return CategoryProductsViewItem(homeCubit: homeCubit, index: index);
                                  },
                                ),
                              ),
                            ),
                            if(homeCubit.collectionProducts!.metadata.totalPages > 2)
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: SizedBox(
                                  height: 50,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      if(index+1 == homeCubit.collectionProducts!.metadata.currentPage) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: defaultColor,
                                            borderRadius: const BorderRadius.all( Radius.circular(15) ),
                                          ),
                                          alignment: Alignment.center,
                                          width: 40,
                                          height: 30,
                                          child: Text('${index+1}',style: const TextStyle(color: Colors.white),),
                                        );
                                      }
                                      else{
                                        return InkWell(
                                          onTap: ()
                                          {
                                            homeCubit.getCollectionProducts(id,index+1);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: defaultColor.shade300,
                                              borderRadius: const BorderRadius.all( Radius.circular(15) ),
                                            ),
                                            alignment: Alignment.center,
                                            width: 40,
                                            height: 30,
                                            child: Text('${index+1}',style: const TextStyle(color: Colors.white),),
                                          ),
                                        );
                                      }
                                    },
                                    separatorBuilder: (context, index) => const SizedBox(width: 3,),
                                    itemCount: homeCubit.collectionProducts!.metadata.totalPages-1,
                                  ),
                                ),
                              ),

                          ],
                        ),
                      );
                    } ,
                    builder: (context) {
                      return const Text('NO RESULTS\nWe are sorry for it, try again later');
                    },
                );
              },
            );
          },
      ),
    );
  }
}
