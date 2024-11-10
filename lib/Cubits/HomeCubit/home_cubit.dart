import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itqan/Cubits/HomeCubit/home_states.dart';
import 'package:itqan/Models/category_products_model.dart';
import 'package:itqan/Models/product_model.dart';
import 'package:itqan/Pages/cart_page.dart';
import 'package:itqan/Pages/category_page.dart';
import 'package:itqan/Pages/home_page.dart';
import 'package:itqan/Pages/search_page.dart';
import 'package:itqan/Pages/setting_page.dart';
import 'package:itqan/shared/DioHelper/Dio.dart';
import 'package:itqan/shared/Functions/functions.dart';
import 'package:itqan/shared/cache_helper/shared_preferences.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());


  static HomeCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0;
  List<Widget> screens = [
    const HomePage(),
    const CategoryPage( id: 5,),
    SearchPage(),
    const CartPage(),
    const SettingPage(),
  ];
  List<String> titles = [
    'Home',
    'Category',
    'Search'
    'Cart',
    'Setting'
  ];
  void changeBottomNav(int index, context) {
    if(index == 2)
    {
      navigateTo(context, SearchPage());
    }
    else {
      currentIndex = index;
    }
    emit(ChangeBottomNavState());
  }

  bool isDark = false;
  //ThemeMode mode = ThemeMode.dark;
  void changeThemeMode()
  {
    isDark = !isDark;
    CacheHelper.saveData(key: 'isDark', value: isDark);
    if(isDark) {
      //mode = ThemeMode.dark;
      emit(ChangeThemeToDark());
    }
    else{
      //mode = ThemeMode.light;
      emit(ChangeThemeToLight());
    }
  }


  var currentSliderIndex = 0;
  void changeSliderIndex(int index) {
    currentSliderIndex = index;
    emit(ChangeSliderState());
  }


  CategoryData? categoryProductModelFemale;
  void getFeMaleProducts() {
    emit(GetProductLoadingState());
    DioHelper().fetchCategoryProducts(19514,1).then((value) {
      categoryProductModelFemale = value;
      if (categoryProductModelMale != null) {
        emit(GetProductSuccessState());
      } else {
        emit(GetProductErrorState());
        print('Fetched data is null');
      }
      //print('productModel: $categoryProductModel');
    }).catchError((error) {
      emit(GetProductErrorState());
      print('Error: $error');
    });
  }

  CategoryData? categoryProductModelMale;
  void getMaleProducts() {
    emit(GetProductLoadingState());
    DioHelper().fetchCategoryProducts(19515,1).then((value) {
      categoryProductModelMale = value;
      if (categoryProductModelMale != null) {
        emit(GetProductSuccessState());
      } else {
        emit(GetProductErrorState());
        print('Fetched data is null');
      }
      //print('productModel: $categoryProductModel');
    }).catchError((error) {
      emit(GetProductErrorState());
      print('Error: $error');
    });
  }



  CategoryData? collectionProducts;
  void getCollectionProducts(int id,{int currentPage = 1}) {
    collectionProducts = null;
    emit(GetProductLoadingState());
    DioHelper().fetchCategoryProducts(id,currentPage).then((value) {
      collectionProducts = value;
        emit(GetProductSuccessState());
      //print('productModel: $categoryProductModel');
    }).catchError((error) {
      emit(GetProductErrorState());
      print('Error: $error');
    });
  }


}