import 'package:example_project/entities/product.dart';
import 'package:example_project/features/products/product_repository.dart';
import 'package:vader_app/vader_app.dart';

class ProductListCubit extends Cubit<List<Product>?> {
  ProductListCubit({required ProductRepository restApiService}) : super(null) {
    _restApiService = restApiService;
    init();
  }

  late final ProductRepository _restApiService;

  update(List<Product>? state) {
    emit(state);
  }

  init() => reload();

  Future<void> reload() async {
    try {
      update(await _restApiService.getProducts());
    } catch (e) {
      update(null);
    }
  }
}
