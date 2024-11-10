import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itqan/Cubits/HomeCubit/home_cubit.dart';
import 'package:itqan/Pages/product_details_page.dart';
import 'package:itqan/Pages/products_page.dart';
import 'package:itqan/shared/Functions/functions.dart';
import 'package:itqan/shared/Icon/icon_broken.dart';

class CategoryItemViewItem extends StatelessWidget {
   const CategoryItemViewItem({required int index ,super.key, required this.image, required this.text, required this.id, required this.homeCubit});
   final HomeCubit homeCubit;
   final String image;
   final String text;
   final int id;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        homeCubit.getCollectionProducts(id);
        navigateTo(context, ProductsPage(titleName: text, id: id));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height*0.15,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.35,
                  decoration: BoxDecoration(
                      color: Colors.orange[100],
                      borderRadius: const BorderRadius.all( Radius.circular(10) ),
                      image: DecorationImage(fit: BoxFit.cover,image: NetworkImage(image))
                  ),
        
                ),
                 Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    text,
                    style: const TextStyle(
                        fontSize: 20
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const Spacer(),
                const Icon(IconBroken.Arrow___Right_2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
