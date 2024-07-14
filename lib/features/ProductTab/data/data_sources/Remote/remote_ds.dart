import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../models/ProductModel.dart';

abstract class ProductRemoteDs {
  Future<Either<Failures, ProductModel>> getProducts();
}
