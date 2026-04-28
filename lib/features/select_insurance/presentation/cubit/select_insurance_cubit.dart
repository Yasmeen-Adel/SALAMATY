
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/select_insurance/data/models/select_insurance_provider.dart';
import 'package:salamaty/features/select_insurance/data/repos/select_insurance_repo.dart';

part 'select_insurance_state.dart';

class InsuranceCubit extends Cubit<InsuranceState> {
  final InsuranceRepo repo;

  InsuranceCubit({required this.repo}) : super(InsuranceInitial());

  InsuranceProvider? selectedProvider;

  Future<void> fetchProviders() async {
    emit(InsuranceLoading());
    try {
      final providers = await repo.getProviders();
      emit(InsuranceLoaded(providers: providers));
    } catch (e) {
      emit(InsuranceError(message: e.toString()));
    }
  }

  void selectProvider(InsuranceProvider provider) {
    selectedProvider = provider;
    if (state is InsuranceLoaded) {
      emit(InsuranceLoaded(
        providers: (state as InsuranceLoaded).providers,
        selectedProvider: provider,
      ));
    }
  }
}