import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/repositories/product_repo.dart';
import '../data_sources/Remote/remote_ds.dart';
import '../models/ProductModel.dart';

class ProductRepoImpl implements ProductRepo {
  ProductRemoteDs productRemoteDsImpl;

  ProductRepoImpl(this.productRemoteDsImpl);

  @override
  Future<Either<Failures, ProductModel>> getProducts() {
    return productRemoteDsImpl.getProducts();
  }
}
