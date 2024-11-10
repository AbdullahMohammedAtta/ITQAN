import 'package:flutter/material.dart';
import 'package:itqan/Cubits/HomeCubit/home_cubit.dart';
import 'package:itqan/Cubits/SeachCubit/search_cubit.dart';
import 'package:itqan/Pages/product_details_page.dart';
import 'package:itqan/shared/Conestants/Conestants.dart';
import 'package:itqan/shared/Functions/functions.dart';
import 'package:itqan/shared/Icon/icon_broken.dart';
import 'package:itqan/shared/cache_helper/shared_preferences.dart';

class MaleGridViewItem extends StatelessWidget {
  final HomeCubit homeCubit;
  final int index;
  const MaleGridViewItem({super.key, required this.homeCubit, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigateTo(context, ProductDetailsPage(id: homeCubit.categoryProductModelMale!.products[index].product.id,));
      },
      child: Card(
        child: Container(
          decoration:  const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.orange[100],
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight:Radius.circular(10) ),
                          image: DecorationImage(fit: BoxFit.cover,alignment: Alignment.topCenter,image: NetworkImage(homeCubit.categoryProductModelMale!.products[index].product.thumbUrl!,))
                      ),
                        
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: CacheHelper.getBoolean(key: 'isDark')?? false ? defaultBackGroundDarkThemeColor : defaultBackGroundLightThemeColor ,
                          radius: 15,
                        ),
                        IconButton(onPressed: (){}, icon: const Icon(IconBroken.Heart,size: 25,)),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      homeCubit.categoryProductModelMale!.products[index].product.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: homeCubit.categoryProductModelMale!.products[index].product.variants.isNotEmpty ? Text('${homeCubit.categoryProductModelMale!.products[index].product.variants[0].priceCents/100} EGP') : Text('${homeCubit.categoryProductModelMale!.products[index].product.priceCents!/100} EGP'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


class FeMaleGridViewItem extends StatelessWidget {
  final HomeCubit homeCubit;
  final int index;
  const FeMaleGridViewItem({super.key, required this.homeCubit, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigateTo(context,  ProductDetailsPage(id: homeCubit.categoryProductModelFemale!.products[index].product.id,));
      },
      child: Card(
        child: Container(
          decoration:  const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.orange[100],
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight:Radius.circular(10) ),
                          image: DecorationImage(fit: BoxFit.cover,alignment: Alignment.topCenter,image: NetworkImage(homeCubit.categoryProductModelFemale!.products[index].product.thumbUrl!,))
                      ),
                        
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor:  CacheHelper.getBoolean(key: 'isDark')?? false ? defaultBackGroundDarkThemeColor : defaultBackGroundLightThemeColor ,
                          radius: 15,
                        ),
                        IconButton(onPressed: (){}, icon: const Icon(IconBroken.Heart,size: 25,)),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      homeCubit.categoryProductModelFemale!.products[index].product.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: homeCubit.categoryProductModelFemale!.products[index].product.variants.isNotEmpty ? Text('${homeCubit.categoryProductModelFemale!.products[index].product.variants[0].priceCents/100} EGP') : Text('${homeCubit.categoryProductModelFemale!.products[index].product.priceCents!/100} EGP'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


class CategoryProductsViewItem extends StatelessWidget {
  final HomeCubit homeCubit;
  final int index;
  const CategoryProductsViewItem({super.key, required this.homeCubit, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigateTo(context,  ProductDetailsPage(id: homeCubit.collectionProducts!.products[index].product.id, ));
      },
      child: Card(
        child: Container(
          decoration:  const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.orange[100],
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight:Radius.circular(10) ),
                          image: DecorationImage(fit: BoxFit.cover,alignment: Alignment.topCenter,image: NetworkImage(homeCubit.collectionProducts!.products[index].product.thumbUrl!,))
                      ),
                        
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor:  CacheHelper.getBoolean(key: 'isDark')?? false ? defaultBackGroundDarkThemeColor : defaultBackGroundLightThemeColor ,
                          radius: 15,
                        ),
                        IconButton(onPressed: (){}, icon: const Icon(IconBroken.Heart,size: 25,)),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      homeCubit.collectionProducts!.products[index].product.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: homeCubit.collectionProducts!.products[index].product.variants.isNotEmpty ? Text('${homeCubit.collectionProducts!.products[index].product.variants[1].priceCents/100} EGP') : Text('${homeCubit.collectionProducts!.products[index].product.priceCents!/100} EGP'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}



// class SearchGridViewItem extends StatelessWidget {
//   final SearchCubit searchCubit;
//   final int index;
//   const SearchGridViewItem({super.key, required this.searchCubit, required this.index});
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: (){
//         navigateTo(context, const ProductDetailsPage());
//       },
//       child: Container(
//         decoration:  const BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Expanded(
//               flex: 5,
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Colors.orange[100],
//                     borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight:Radius.circular(10) ),
//                     image: DecorationImage(fit: BoxFit.cover,alignment: Alignment.topCenter,image: NetworkImage(searchCubit.productModel!.data[index].thumbUrl,))
//                 ),
//
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               child: Padding(
//                 padding: const EdgeInsets.all(5.0),
//                 child: Text(
//                   searchCubit.productModel!.data[index].name,
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// GridView.count(
// padding: EdgeInsets.zero,
// shrinkWrap: true,
// crossAxisCount: 2,
// mainAxisSpacing: 10.0,
// crossAxisSpacing: 10.0,
// childAspectRatio: 1 / 1.3,
// physics: const NeverScrollableScrollPhysics(),
// children: List.generate(
// searchCubit.productModel!.data.length,
// (index) {
// return SearchGridViewItem(searchCubit: searchCubit, index: index);
// },
// ),
// )