import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itqan/Cubits/ProductDetailsCubit/product_details_cubits.dart';
import 'package:itqan/Cubits/ProductDetailsCubit/product_details_states.dart';
import 'package:itqan/Widgets/my_divider.dart';
import 'package:itqan/shared/Conestants/Conestants.dart';
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){},
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Image.network('${productDetailsCubit.productDetailsData!.data.thumbUrl}',fit: BoxFit.contain, width: double.infinity,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Icon(Icons.circle,size: 45,color: CacheHelper.getBoolean(key: 'isDark')?? false ? Colors.black : Colors.white,),
                                    IconButton(onPressed: (){
                                      Navigator.pop(context);
                                    }, icon: const Icon(IconBroken.Arrow___Left_Square,size: 30,color: Colors.grey,)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              const SizedBox(height: 2,),
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.15,
                                child: ListView.separated(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width*0.35,
                                      decoration: BoxDecoration(
                                          color: Colors.orange[100],
                                          borderRadius: const BorderRadius.all( Radius.circular(10) ),
                                          border: Border.all(color: defaultColor,width: 2),
                                          image: DecorationImage(fit: BoxFit.cover,image: NetworkImage('${productDetailsCubit.productDetailsData!.data.imagesUrls[index].urls[1]}'))
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
                              const Text('Adidas Bag 14 waterproof',style: TextStyle(fontSize: 20),),
                              const Text('EGP 490',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900),),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
            ),
          );
        },
    ),);
  }
}
