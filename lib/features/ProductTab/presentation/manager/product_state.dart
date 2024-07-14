part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class GetProductsSuccessState extends ProductState {
  ProductModel model;

  GetProductsSuccessState(this.model);
}

class GetProductsLoadingState extends ProductState {}

class GetProductsErrorState extends ProductState {
  Failures failures;

  GetProductsErrorState(this.failures);
}
