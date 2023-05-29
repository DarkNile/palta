import 'package:get/get.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/product/models/product.dart';
import 'package:palta/product/services/product_service.dart';

class ProductController extends GetxController {
  final homeController = Get.put(HomeController());
  var isProductsLoading = false.obs;
  var products = <Product>[].obs;
  var isFilteredProductsLoading = false.obs;
  var filteredProducts = <Product>[].obs;
  var page = 1.obs;

  Future<List<Product>?> getProductsByCategoryId(
      {required String categoryId}) async {
    try {
      isProductsLoading(true);
      final data =
          await ProductService.getProductsByCategoryId(categoryId: categoryId);
      if (data != null) {
        manageFavProducts(data);
        products(data);
        return products;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    } finally {
      isProductsLoading(false);
    }
  }

  Future<List<Product>?> getFilteredProducts({
    required String categoryId,
    String search = '',
    String order = '',
    String sort = '',
  }) async {
    try {
      isFilteredProductsLoading(true);
      print(page.value.toString());
      final data = await ProductService.getFilteredProducts(
        categoryId: categoryId,
        search: search,
        page: page.value.toString(),
        order: order,
        sort: sort,
      );
      if (data != null) {
        manageFavProducts(data);
        filteredProducts.addAll(data);
        return filteredProducts;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    } finally {
      isFilteredProductsLoading(false);
    }
  }

  Future<List<Product>?> filterByPrice({
    required String categoryId,
    required String minPrice,
    required String maxPrice,
  }) async {
    Map<String, dynamic> formData = {};
    if (categoryId.isEmpty) {
      formData = {
        "filters": [
          {
            "field": "price",
            "operand": ">=",
            "value": minPrice,
          },
          {
            "field": "price",
            "operand": "<=",
            "value": maxPrice,
          },
        ],
      };
    } else {
      formData = {
        "filters": [
          {
            "field": "category",
            "operand": "=",
            "value": categoryId,
          },
          {
            "field": "price",
            "operand": ">=",
            "value": minPrice,
          },
          {
            "field": "price",
            "operand": "<=",
            "value": maxPrice,
          },
        ],
      };
    }
    print(formData);
    try {
      filteredProducts.clear();
      isFilteredProductsLoading(true);
      print(page.value.toString());
      final data = await ProductService.filterByPrice(
        formData: formData,
        page: page.value.toString(),
      );
      if (data != null) {
        manageFavProducts(data);
        filteredProducts(data);
        return filteredProducts;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    } finally {
      isFilteredProductsLoading(false);
    }
  }

  manageFavProducts(List<Product>? products) async {
    await homeController.getWishlistProducts().then((value) {
      for (var element in value!) {
        for (var element2 in products!) {
          if (element.id.toString() == element2.id.toString()) {
            element2.fav = true;
          }
        }
      }
    });
  }
}
