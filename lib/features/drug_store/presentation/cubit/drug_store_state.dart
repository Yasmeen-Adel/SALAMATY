import 'package:equatable/equatable.dart';
import 'package:salamaty/features/drug_store/data/models/drug_store_model.dart';

abstract class DrugStoreState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DrugStoreInitial extends DrugStoreState {}

class DrugStoreLoading extends DrugStoreState {}

class DrugStoreSuccess extends DrugStoreState {
  final List<DrugStoreProduct> products;
  DrugStoreSuccess(this.products);

  @override
  List<Object?> get props => [products];
}

class DrugStoreFailure extends DrugStoreState {
  final String error;
  DrugStoreFailure(this.error);

  @override
  List<Object?> get props => [error];
}
