import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/medicine/data/repo/medicine_details_repo.dart';
import 'medicine_details_state.dart';

class MedicineDetailsCubit extends Cubit<MedicineDetailsState> {
  final MedicineDetailsRepo repo;

  MedicineDetailsCubit(this.repo) : super(MedicineDetailsInitial());

  Future<void> fetchMedicineDetails(int id) async {
    if (isClosed) return;
    emit(MedicineDetailsLoading());
    try {
      final medicine = await repo.getProductById(id);
      if (isClosed) return;
      emit(MedicineDetailsSuccess(medicine));
    } catch (e) {
      if (isClosed) return;
      emit(MedicineDetailsFailure(e.toString()));
    }
  }
}
