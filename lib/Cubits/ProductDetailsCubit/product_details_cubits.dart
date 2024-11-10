import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itqan/Cubits/ProductDetailsCubit/product_details_states.dart';
import 'package:itqan/Models/product_details_data.dart';
import 'package:itqan/shared/DioHelper/Dio.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsStates> {
  ProductDetailsCubit() : super(ProductDetailsInitialState());


  static ProductDetailsCubit get(context) => BlocProvider.of(context);


  DetailsResponse? productDetailsData;
 void getProductDetailsData({required int id}){
   emit(GetProductDetailsLoadingState());
   DioHelper().fetchProductDetails(id).then((value) {
     productDetailsData = value ;
     emit(GetProductDetailsSuccessState());
     print(value);
   }
   ).catchError((error){
     emit(GetProductDetailsErrorState());
     print(error);
   });
 }
}
