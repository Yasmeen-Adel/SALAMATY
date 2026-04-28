import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/medicine_alternatives/data/repo/medicine_alternatives_repo.dart';
import 'medicine_alternatives_state.dart';

class MedicineAlternativesCubit extends Cubit<MedicineAlternativesState> {
  final MedicineAlternativesRepo repo;

  MedicineAlternativesCubit(this.repo) : super(MedicineAlternativesInitial());

  Future<void> fetchAlternatives(int productId) async {
    if (isClosed) return;
    emit(MedicineAlternativesLoading());
    try {
      final alternatives = await repo.getAlternatives(productId);
      if (isClosed) return;
      emit(MedicineAlternativesSuccess(alternatives));
    } catch (e) {
      if (isClosed) return;
      emit(MedicineAlternativesFailure(e.toString()));
    }
  }
}