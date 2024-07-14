import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test_task/features/ProductTab/data/data_sources/Remote/remote_ds.dart';
import '../../../../../core/api/api-manager.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/errors/failures.dart';
import '../../models/ProductModel.dart';

class ProductRemoteDsImpl implements ProductRemoteDs {
  ApiManager apiManager;

  ProductRemoteDsImpl(this.apiManager);

  @override
  Future<Either<Failures, ProductModel>> getProducts() async {
    try {
      Response response = await apiManager.getData(EndPoints.products);
      ProductModel productsModel = ProductModel.fromJson(response.data);
      return Right(productsModel);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
