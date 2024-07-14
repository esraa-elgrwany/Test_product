import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/ProductModel.dart';

abstract class ProductRepo {
  Future<Either<Failures, ProductModel>> getProducts();
}
