import 'package:flutter/material.dart';
import 'package:itqan/Cubits/HomeCubit/home_cubit.dart';
import 'package:itqan/Pages/products_page.dart';
import 'package:itqan/shared/Functions/functions.dart';

class CollectionItem extends StatelessWidget {
  const CollectionItem({super.key, required this.image, required this.text, required this.id, required this.homeCubit});
  final HomeCubit homeCubit;
  final String image;
  final String text;
  final int id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        homeCubit.getCollectionProducts(id);
        navigateTo(context, ProductsPage(titleName: text,id : id,));
      },
      child: Card(
        child: Container(
          decoration:  const BoxDecoration(
            //color: Colors.green.withOpacity(0.08),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width*0.45,
                  decoration: BoxDecoration(
                      color: Colors.orange[100],
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight:Radius.circular(10) ),
                      image:  DecorationImage(fit: BoxFit.cover,alignment: Alignment.topCenter,image: NetworkImage(image,))
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
