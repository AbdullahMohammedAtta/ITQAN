import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itqan/Cubits/HomeCubit/home_cubit.dart';
import 'package:itqan/Cubits/HomeCubit/home_states.dart';
import 'package:itqan/Pages/products_page.dart';
import 'package:itqan/Widgets/GridViewItem.dart';
import 'package:itqan/Widgets/collection_item.dart';
import 'package:itqan/Widgets/my_divider.dart';
import 'package:itqan/shared/Conestants/Conestants.dart';
import 'package:itqan/shared/Functions/functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

List<String> collectionImageLinkList = [
  'https://azure-merchants.zammit.shop/active-storage/mzk3dpnt002ykei4k1htubi2pkyx',
  'https://azure-merchants.zammit.shop/active-storage/qvp6maxr3v8op4v8wc4ac9v51hf8',
  'https://azure-merchants.zammit.shop/active-storage/btyj8nqtnip8ryw1v3kfzmdnd22p',
  'https://azure-merchants.zammit.shop/active-storage/ko4e3pp89w7i3ewsvr18wxlejp1i',
  'https://azure-merchants.zammit.shop/active-storage/qpui4ut31a22ck48hav7nx4k2h2h',
  'https://azure-merchants.zammit.shop/active-storage/9csu2qmi6gfclnkrjx1g2nw66m40',
];
List<String> collectionTextList = [
  'SNEAKERS',
  'SHOES',
  'SLIPPERS',
  'BAGS',
  'SHOE CARE',
  'SOCKS',
];
List<int> collectionIdList = [
  19511,//sneakers
  19512,//shoes
  42820,//slipper
  37672,//bags
  19513,//show care
  37673,// socks
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {

        CarouselSliderController sliderController = CarouselSliderController();

        List<Widget> sliderList = [
          Image.network('https://azure-merchants.zammit.shop/active-storage/6fqapgi3e47hw6iqgnyr2a0s1260', fit: BoxFit.fill),
          Image.network('https://i.pinimg.com/736x/af/35/ef/af35efa2608fe1b9fdd25613fa846b34.jpg', fit: BoxFit.fill),
          Image.network('https://img.freepik.com/free-vector/running-sport-shoes-illustration_1284-17528.jpg', fit: BoxFit.cover),
          Image.network('https://mir-s3-cdn-cf.behance.net/projects/404/2c017f188928813.Y3JvcCwyMTYwLDE2ODksMCw1Mw.jpg', fit: BoxFit.fill),
          Image.network('https://m.media-amazon.com/images/I/71y3BrA++EL._AC_UF1000,1000_QL80_.jpg', fit: BoxFit.fill),
          Image.network('https://www.shutterstock.com/image-vector/colorful-3d-shoes-mock-up-260nw-2331098643.jpg', fit: BoxFit.cover),
          Image.asset('Assets/Images/COVER2.png', fit: BoxFit.fill),
          Image.network('https://azure-merchants.zammit.shop/active-storage/w57xdhn0gmf4acvtzsrpx6qysy55', fit: BoxFit.fill),
          Image.network('https://i.pinimg.com/736x/3d/b8/46/3db8465ae5c8845947b9b23578588639.jpg', fit: BoxFit.fill),
        ];
        List<Widget> testimonialsSliderList = [
          Image.network('https://azure-merchants.zammit.shop/active-storage/znkaowtqhkto7cml6jjla3xmbvah', fit: BoxFit.fill),
          Image.network('https://azure-merchants.zammit.shop/active-storage/v3a4ou71cc1jws53rw1sp1nbpm1m', fit: BoxFit.fill),
          Image.network('https://azure-merchants.zammit.shop/active-storage/zp2pahc7bdm4bnzqm56bgtwdbee5', fit: BoxFit.fill),
          Image.network('https://azure-merchants.zammit.shop/active-storage/oh48km40sphmo3rf8mjhegjioh5c', fit: BoxFit.fill),
          Image.network('https://azure-merchants.zammit.shop/active-storage/v0h88879h2kchyrtcelcps11btnm', fit: BoxFit.fill),
          Image.network('https://azure-merchants.zammit.shop/active-storage/53zr8srhhb4stcrcj8wzn3rae0ra', fit: BoxFit.fill),
          Image.network('https://azure-merchants.zammit.shop/active-storage/q584vzl0ra0z8vrczy0on5f54cem', fit: BoxFit.fill),
          Image.network('https://azure-merchants.zammit.shop/active-storage/60ubeyzaqzvbp3fnmqgkdpvshv0v', fit: BoxFit.fill),
          Image.network('https://azure-merchants.zammit.shop/active-storage/cbanr2ciahhnnxhgiuu2e7lkf30v', fit: BoxFit.fill),
          Image.network('https://azure-merchants.zammit.shop/active-storage/i2aq200u56qpw2lmgd2dmshwb6og', fit: BoxFit.fill),
        ];

        var homeCubit = HomeCubit.get(context);

        return ConditionalBuilder(
          condition: homeCubit.categoryProductModelFemale != null && homeCubit.categoryProductModelMale != null,
          fallback: (context) => Center(child: CircularProgressIndicator(color: defaultColor,)),
          builder: (context) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.3,
                    child: Column(
                        children: [
                          CarouselSlider(
                            items: sliderList,
                            carouselController: sliderController,
                            options: CarouselOptions(
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              viewportFraction: 1,
                              autoPlayInterval: const Duration(seconds: 5),
                              autoPlayAnimationDuration: const Duration(milliseconds: 500),
                              autoPlayCurve: Curves.easeIn,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index, reason) {
                                Future.delayed(const Duration(milliseconds: 200), () {
                                  homeCubit.changeSliderIndex(index);
                                });
                              },
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: AnimatedSmoothIndicator(
                              activeIndex: homeCubit.currentSliderIndex,
                              count: sliderList.length,
                              effect: WormEffect(
                                dotHeight: 5,
                                dotWidth: 5,
                                radius: 5,
                                activeDotColor: defaultColor, // Replace with your defaultColor
                                dotColor: Colors.grey,
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                    ),
                  ),
                  const MyDivider(),
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0,top: 7,bottom: 5),
                    child: Text(
                      'OUR COLLECTION',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height:MediaQuery.of(context).size.height*0.25,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CollectionItem(image: collectionImageLinkList[index], text: collectionTextList[index],id: collectionIdList[index], homeCubit: homeCubit,);
                        },
                        separatorBuilder: (context, index) =>
                        const SizedBox(width: 5),
                        itemCount: collectionImageLinkList.length,
                      ),
                    ),
                  ),
                  const MyDivider(),
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0,top: 7,bottom: 5),
                    child: Text(
                      'Male Products',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 1 / 1.4,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(
                        10,
                            (index) {
                            return MaleGridViewItem(homeCubit: homeCubit, index: index);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0,left: 15.0),
                      child: MaterialButton(
                        onPressed: (){
                          homeCubit.collectionProducts = homeCubit.categoryProductModelMale ;
                          navigateTo(context, const ProductsPage(titleName: 'Male Products', id: 19515));
                        },
                        color: Colors.orange,
                        child: const Text(
                          'View All',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const MyDivider(),
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0,top: 7,bottom: 5),
                    child: Text(
                      'Female Products',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 1 / 1.4,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(
                        10,
                            (index) {
                                return FeMaleGridViewItem(homeCubit: homeCubit, index: index);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0,left: 15.0),
                      child: MaterialButton(
                        onPressed: (){
                          homeCubit.collectionProducts = homeCubit.categoryProductModelFemale ;
                          navigateTo(context, const ProductsPage(titleName: 'Female Products', id: 19515));
                        },
                        color: Colors.orange,
                        child: const Text(
                          'View All',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const MyDivider(),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0,top: 7,bottom: 5),
                    child: Text(
                      'Testimonials',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: defaultColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.5,
                    child: CarouselSlider(
                      items: testimonialsSliderList,
                      options: CarouselOptions(
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        viewportFraction: 0.7,
                        aspectRatio: 1,
                        autoPlayInterval: const Duration(seconds: 5),
                        autoPlayAnimationDuration: const Duration(milliseconds: 500),
                        autoPlayCurve: Curves.easeIn,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                  const MyDivider(),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(height: 30, 'Assets/Images/logoPNG.png', fit: BoxFit.fill),
                        const SizedBox(height: 15,),
                        const Text(
                          'Contact us: ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.orange,
                          ),
                        ),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Phone:',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.orange,
                              ),
                            ),
                            SizedBox(width: 5,),
                            SizedBox(
                              height: 40,
                              width: 250,
                              child: SelectableText(
                                '01015633953 / 01030416588 / 01033664919',
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'E-mail: ',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.orange,
                              ),
                            ),
                            SizedBox(width: 5,),
                            SizedBox(
                              height: 40,
                              width: 250,
                              child: SelectableText(
                                'itqan.online.shopping@gmail.com',
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'Working hours: ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.orange,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                          width: 270,
                          child: Text(
                            'Daily From 11:00 AM till 09:00 PM',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                          width: 270,
                          child: Text(
                            'Shipping Policy Refund & Exchange Policy Follow your order',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
