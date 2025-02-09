import 'package:example_project/entities/product.dart';
import 'package:vader/vader.dart';

class ProductRepository extends Repository {
  ProductRepository({
    required super.httpClient,
    required super.secureStorage,
  });

  Future<List<Product>> getProducts() async {
    final response = await httpClient.request(
      path: '/products',
      method: HttpMethod.get,
    );
    return [...response.data["products"].map((e) => Product.fromJson(e))];
  }
}
