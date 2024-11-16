import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itqan/Cubits/ProductDetailsCubit/product_details_cubits.dart';
import 'package:itqan/Cubits/ProductDetailsCubit/product_details_states.dart';
import 'package:itqan/Pages/photo_page.dart';
import 'package:itqan/Widgets/my_divider.dart';
import 'package:itqan/shared/Conestants/Conestants.dart';
import 'package:itqan/shared/Functions/functions.dart';
import 'package:itqan/shared/Icon/icon_broken.dart';
import 'package:itqan/shared/cache_helper/shared_preferences.dart';


class ProductDetailsPage extends StatelessWidget {
  final int id;
  const ProductDetailsPage({super.key, required this.id});



  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ProductDetailsCubit()..getProductDetailsData(id: id),
    child:BlocConsumer<ProductDetailsCubit,ProductDetailsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var productDetailsCubit = ProductDetailsCubit.get(context);
          return Scaffold(
            body: ConditionalBuilder(
                condition: productDetailsCubit.productDetailsData != null,
                fallback: (context) =>  Center(child: CircularProgressIndicator(color: defaultColor,)),
                builder: (context) {
                  return SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: ()
                            {
                              navigateTo(context, PhotoPage(image:'${productDetailsCubit.productDetailsData!.data.imagesUrls[productDetailsCubit.currentImage].urls[1]}'));
                            },
                            child: Stack(
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height*0.4,
                                    width: double.infinity,
                                    child: Image.network(
                                      '${productDetailsCubit.productDetailsData!.data.imagesUrls[productDetailsCubit.currentImage].urls[1]}',
                                      fit: BoxFit.cover,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Icon(Icons.circle,size: 45,color: CacheHelper.getBoolean(key: 'isDark')?? false ? Colors.black : Colors.white,),
                                      IconButton(onPressed: (){
                                        Navigator.pop(context);
                                      }, icon: const Icon(IconBroken.Arrow___Left_2,size: 30,)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 2,),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.15,
                                  child: ListView.separated(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: (){
                                          productDetailsCubit.changeCurrentImage(index);
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context).size.width*0.35,
                                          decoration: BoxDecoration(
                                              color: Colors.orange[100],
                                              borderRadius: const BorderRadius.all( Radius.circular(10) ),
                                              border: Border.all(color: productDetailsCubit.currentImage == index ? defaultColor : Colors.grey ,width: 2),
                                              image: DecorationImage(fit: BoxFit.cover,image: NetworkImage('${productDetailsCubit.productDetailsData!.data.imagesUrls[index].urls[1]}'))
                                          ),

                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) => const SizedBox(width: 2,),
                                    itemCount: productDetailsCubit.productDetailsData!.data.imagesUrls.length,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: MyDivider(),
                                ),
                                Text(productDetailsCubit.productDetailsData!.data.name??'error',style: const TextStyle(fontSize: 30),),
                                if(productDetailsCubit.productDetailsData!.data.variants.isEmpty)
                                  Text('${productDetailsCubit.productDetailsData!.data.priceCents/100} EGP',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900,color: defaultColor),),
                                if(productDetailsCubit.productDetailsData!.data.variants.isNotEmpty)
                                  Text('${productDetailsCubit.productDetailsData!.data.variants[0].priceCents/100} EGP',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900,color: defaultColor),),
                                const SizedBox(height: 10,),
                                const Text('Product Details',style: TextStyle(fontSize: 20),),
                                const SizedBox(height: 5,),
                                Text(productDetailsCubit.productDetailsData!.data.strippedDescription!,),
                                const SizedBox(height: 10,),
                                const Text('COLOR OPTIONS',style: TextStyle(fontSize: 20),),
                                const SizedBox(height: 5,),
                                const DropdownMenu(
                                  width: double.infinity,
                                    hintText: 'Select color',
                                    dropdownMenuEntries: [
                                  DropdownMenuEntry(value: Colors.red, label: 'red'),
                                  DropdownMenuEntry(value: Colors.green, label: 'green'),
                                  DropdownMenuEntry(value: Colors.blue, label: 'blue'),
                                  DropdownMenuEntry(value: Colors.orange, label: 'orange'),
                                ]),
                                const SizedBox(height: 10,),
                                const Text('SIZE OPTIONS',style: TextStyle(fontSize: 20),),
                                const SizedBox(height: 5,),
                                const DropdownMenu(
                                  width: double.infinity,
                                    hintText: 'Select size',
                                    dropdownMenuEntries: [
                                  DropdownMenuEntry(value: Colors.red, label: '41'),
                                  DropdownMenuEntry(value: Colors.green, label: '42'),
                                  DropdownMenuEntry(value: Colors.blue, label: '43'),
                                  DropdownMenuEntry(value: Colors.orange, label: '44'),
                                  DropdownMenuEntry(value: Colors.orange, label: '45'),
                                ]),
                                const SizedBox(height: 20,),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      const Text('QUANTITY',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                      const Spacer(),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all( Radius.circular(10) ),
                                            border: Border.all(color: defaultColor),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.minus_circle)),
                                              ),
                                              const Text('2',style: TextStyle(fontSize: 20),),
                                              Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.plus_circle)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 500,),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
            ),
          );
        },
    ),);
  }
}
