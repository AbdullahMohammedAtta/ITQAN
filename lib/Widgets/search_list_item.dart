import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itqan/Cubits/SeachCubit/search_cubit.dart';
import 'package:itqan/Pages/product_details_page.dart';
import 'package:itqan/shared/Functions/functions.dart';
import 'package:itqan/shared/Icon/icon_broken.dart';

class SearchListItem extends StatelessWidget {
  final SearchCubit searchCubit;
  final int index;
  const SearchListItem({super.key, required this.searchCubit, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigateTo(context, ProductDetailsPage(id: searchCubit.productModel!.data[index].id,));
      },
      child: Card(
        child: Container(
          height: MediaQuery.of(context).size.height*0.18,
          width: MediaQuery.of(context).size.width,
          decoration:  const BoxDecoration(
            //color: Colors.orange.withOpacity(0.08),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.18,
                width: MediaQuery.of(context).size.width*0.4,
                decoration: BoxDecoration(
                    //color: Colors.orange[100],
                    borderRadius: const BorderRadius.all(Radius.circular(10),),
                    image: DecorationImage(fit: BoxFit.cover,image: NetworkImage(searchCubit.productModel!.data[index].thumbUrl,)),
                ),
        
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*.35,
                  child: Text(
                    searchCubit.productModel!.data[index].name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              ),
              const Icon(IconBroken.Arrow___Right_2),
            ],
          ),
        ),
      ),
    );
  }
}



