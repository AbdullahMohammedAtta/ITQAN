import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itqan/Cubits/SeachCubit/searche_states.dart';
import 'package:itqan/Models/product_model.dart';
import 'package:itqan/shared/DioHelper/Dio.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());


  static SearchCubit get(context) => BlocProvider.of(context);


  ApiResponse? productModel;
  void getSearchProducts({required String search}) {
    emit(GetSearchProductLoadingState());
    DioHelper().fetchSearch(searchValue: search).then((value) {
      productModel = value;
      emit(GetSearchProductSuccessState());
      //print('productModel: $productModel');
      //print('First product name: ${ productModel!.products[1].name}');
    }).catchError((error) {
      emit(GetSearchProductErrorState());
      print('Error: $error');
    });
  }



}
