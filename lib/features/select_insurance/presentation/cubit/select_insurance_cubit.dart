
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/select_insurance/data/models/select_insurance_provider.dart';
import 'package:salamaty/features/select_insurance/data/repos/select_insurance_repo.dart';

part 'select_insurance_state.dart';
class InsuranceCubit extends Cubit<InsuranceState> {
  final InsuranceRepo repo;

  InsuranceCubit({required this.repo}) : super(InsuranceInitial());

  InsuranceProvider? selectedProvider;

  Future<void> fetchProviders() async {
    if (isClosed) return;
    emit(InsuranceLoading());

    try {
      final providers = await repo.getProviders();

      if (isClosed) return;

      emit(InsuranceLoaded(providers: providers));
    } catch (e) {
      if (isClosed) return;

      emit(InsuranceError(message: e.toString()));
    }
  }

  void selectProvider(InsuranceProvider provider) {
    if (isClosed) return;

    selectedProvider = provider;

    if (state is InsuranceLoaded) {
      emit(InsuranceLoaded(
        providers: (state as InsuranceLoaded).providers,
        selectedProvider: provider,
      ));
    }
  }
}