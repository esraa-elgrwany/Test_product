import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/ProductModel.dart';
import '../repositories/product_repo.dart';

class GetProductsUseCase {
  ProductRepo productRepo;

  GetProductsUseCase(this.productRepo);

  Future<Either<Failures, ProductModel>> call() {
    return productRepo.getProducts();
  }
}
