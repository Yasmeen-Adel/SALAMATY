import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/drug_store/data/repo/drug_store_repo.dart';
import 'drug_store_state.dart';

class DrugStoreCubit extends Cubit<DrugStoreState> {
  final DrugStoreRepo repo;

  DrugStoreCubit(this.repo) : super(DrugStoreInitial());

  String? selectedCategory;
  String? searchQuery;

  Future<void> fetchProducts() async {
    emit(DrugStoreLoading());
    try {
      final products = await repo.getProducts(
        category: selectedCategory,
        search: searchQuery,
      );
      emit(DrugStoreSuccess(products));
    } catch (e) {
      emit(DrugStoreFailure(e.toString()));
    }
  }

  void changeCategory(String category) {
    selectedCategory = category == 'All' ? null : category;
    fetchProducts();
  }

  void changeSearch(String query) {
    searchQuery = query.trim().isEmpty ? null : query.trim();
    fetchProducts();
  }
}
