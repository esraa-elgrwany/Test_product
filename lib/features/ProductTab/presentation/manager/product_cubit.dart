import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../core/api/api-manager.dart';
import '../../../../core/errors/failures.dart';
import '../../data/data_sources/Remote/remote_ds.dart';
import '../../data/data_sources/Remote/remote_ds_impl.dart';
import '../../data/models/ProductModel.dart';
import '../../data/repositories/product_repo_impl.dart';
import '../../domain/repositories/product_repo.dart';
import '../../domain/use_cases/get_product_use_case.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  static ProductCubit get(context) => BlocProvider.of(context);
  List<ProductData> products = [];
  TextEditingController searchController = TextEditingController();

  getProducts() async {
    emit(GetProductsLoadingState());
    ApiManager apiManager = ApiManager();
    ProductRemoteDs remoteDs = ProductRemoteDsImpl(apiManager);
    ProductRepo productRepo = ProductRepoImpl(remoteDs);
    GetProductsUseCase productsUseCase = GetProductsUseCase(productRepo);
    var result = await productsUseCase.call();
    result.fold((l) {
      emit(GetProductsErrorState(l));
    }, (r) {
      products = r.products ?? [];
      emit(GetProductsSuccessState(r));
    });
  }
}
