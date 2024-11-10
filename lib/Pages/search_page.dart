import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itqan/Cubits/SeachCubit/search_cubit.dart';
import 'package:itqan/Cubits/SeachCubit/searche_states.dart';
import 'package:itqan/Widgets/default_search_body.dart';
import 'package:itqan/Widgets/my_divider.dart';
import 'package:itqan/Widgets/search_list_item.dart';
import 'package:itqan/shared/Conestants/Conestants.dart';
import 'package:itqan/shared/Icon/icon_broken.dart';
import 'package:itqan/shared/cache_helper/shared_preferences.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit,SearchStates>(
          listener: (context, state) {},
          builder: (context, state) {
            bool isDark = CacheHelper.getData(key: 'isDark')?? false;
            var searchCubit = SearchCubit.get(context);
            return Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    stretch: true,
                    centerTitle: true,
                    title:  Row(
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
                    leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(IconBroken.Arrow___Left_2)),
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(65),
                      child:  Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          height: 45,
                          width: MediaQuery.of(context).size.width*0.8,
                          child: TextFormField(
                            style: const TextStyle(
                                height: 1,
                              fontWeight: FontWeight.bold,
                            ),
                            controller: searchController,
                            onFieldSubmitted: (value){
                              searchCubit.getSearchProducts(search: searchController.text);
                            },
                            decoration:  InputDecoration(

                                prefixIcon: const Icon(IconBroken.Search),
                                hintText: 'Try Adidas',
                                hintStyle: TextStyle(color: Colors.grey.shade500),
                                label: const Text('Search'),
                                border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)),
                                )
                            ),
                          ),
                        ),
                      ),
                    ),
                    snap: true,
                    pinned: true,
                    floating: true,
                  ),
                  SliverToBoxAdapter(
                    child: SingleChildScrollView(
                      child: ConditionalBuilder(
                        condition: state is! GetSearchProductLoadingState,
                        fallback: (context) => SizedBox(
                            height : MediaQuery.of(context).size.height*0.5,
                            child: Center(child: CircularProgressIndicator(color: defaultColor,))),
                        builder: (context) {
                          return ConditionalBuilder(
                              condition: searchCubit.productModel != null,
                              fallback: (context) => const DefaultSearchBody(),
                              builder: (context) {
                                return ConditionalBuilder(
                                  condition: searchCubit.productModel!.data.isNotEmpty,
                                  fallback: (context) => Center(child: Text('There is no result for ${searchController.text} !')),
                                  builder: (context) {
                                    return Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: ListView.separated(
                                        shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          padding: EdgeInsets.zero,
                                          itemBuilder: (context, index) {
                                            return SearchListItem(searchCubit: searchCubit, index: index);
                                          },
                                          separatorBuilder:(context, index) =>  const MyDivider(),
                                          itemCount: searchCubit.productModel!.data.length,
                                      ),
                                    );
                                  },
                                );
                              },
                           );
                        },
                      ),
                    ),
                  )
                ],
              ),
            );
          },
      ),
    );
  }
}