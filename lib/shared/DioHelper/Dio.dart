import 'package:dio/dio.dart';
import 'package:itqan/Models/category_products_model.dart';
import 'package:itqan/Models/product_details_data.dart';
import 'package:itqan/Models/product_model.dart';
import 'package:itqan/shared/Conestants/Conestants.dart';

class DioHelper {
  final Dio dio = Dio();

  Future<ApiResponse> fetchSearch({required String searchValue}) async {
    var url = '$baseURL/products/search/$searchValue';

    var headers = {
      'locale': 'en',
      'domain': 'itqan.myzammit.shop',
      'view': 'details',
     // 'authorization': 'Bearer YOUR_TOKEN_HERE', // Replace with your token
    };

    try {
      final response = await dio.get(
        url,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
           // Ensure response.data is not null and contains the expected structure
           // print(response.data);
        if (response.data != null && response.data['data'] != null) {
          return ApiResponse.fromJson(response.data);
        } else {
          throw Exception('Invalid response structure: ${response.data}');
        }
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        //print('Dio error! Status: ${dioError.response?.statusCode}, Data: ${dioError.response?.data}');
      } else {
        //print('Dio error! Message: ${dioError.message}');
      }
      throw Exception('Failed to fetch products');
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }


  Future<CategoryData> fetchCategoryProducts(dynamic id, int currentPage) async {
    var url = '$baseURL/collections/$id/products?limit=24&page=$currentPage';

    var headers = {
      'locale': 'en',
      'domain': 'itqan.myzammit.shop',
      'view': 'details',
    };

    try {
      final response = await dio.get(
        url,
        options: Options(headers: headers),
      );

      // Print the whole response to understand the structure.
      //print('API Response: ${response.data}');

      // Verify if the response structure matches the expected structure.
      if (response.statusCode == 200 && response.data != null) {
        final data = response.data['data'];
        if (data != null) {
          return CategoryData.fromJson(data);
        } else {
          throw Exception('Data key is missing or null');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      //print('Error fetching male products: $e');
      rethrow;
    }
  }


  Future<DetailsResponse> fetchProductDetails(int id,) async {
    var url = '$baseURL/products/$id';

    var headers = {
      'locale': 'en',
      'domain': 'itqan.myzammit.shop',
      'view': 'details',
    };

    try {
      final response = await dio.get(
        url,
        options: Options(headers: headers),
      );

      // Print the whole response to understand the structure.
      //print('API Response: ${response.data}');

      // Verify if the response structure matches the expected structure.
      if (response.statusCode == 200 && response.data != null) {
        if (response.data != null) {
          return DetailsResponse.fromJson(response.data);
        } else {
          throw Exception('Data key is missing or null');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      //print('Error fetching male products: $e');
      rethrow;
    }
  }

}
