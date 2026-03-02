import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/core/services/location_service.dart';
import 'package:salamaty/features/specialities/presentation/cubit/specialities_cubit.dart';
import 'package:salamaty/features/specialities/presentation/cubit/specialities_state.dart';
import 'package:salamaty/features/specialities/presentation/view/widgets/specialities_header.dart';
import 'package:salamaty/features/specialities/presentation/view/widgets/specialty_item_card.dart';
import 'package:url_launcher/url_launcher.dart';

class SpecialitiesBody extends StatefulWidget {
  final String specialtyName;

  const SpecialitiesBody({super.key, required this.specialtyName});

  @override
  State<SpecialitiesBody> createState() => _SpecialitiesBodyState();
}

class _SpecialitiesBodyState extends State<SpecialitiesBody> {
  double? lat;
  double? lng;

  @override
  void initState() {
    super.initState();
    _loadLocationAndData();
  }

  Future<void> _loadLocationAndData() async {
    final position = await LocationService().getCurrentLocation();

    lat = position?.latitude;
    lng = position?.longitude;

    context.read<SpecialitiesCubit>().fetchProviders(
          specialty: widget.specialtyName,
          lat: lat,
          lng: lng,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SpecialitiesHeader(
          headerText: widget.specialtyName,
          onSearch: (value) {
            context.read<SpecialitiesCubit>().fetchProviders(
                  specialty: widget.specialtyName,
                  search: value,
                  lat: lat,
                  lng: lng,
                );
          },
        ),
        Expanded(
          child: BlocBuilder<SpecialitiesCubit, SpecialitiesState>(
            builder: (context, state) {
              if (state is SpecialitiesLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is SpecialitiesSuccess) {
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.providers.length,
                  itemBuilder: (context, index) {
                    final item = state.providers[index];

                    return SpecialtyItemCard(
                      name: item.providerName,
                      governorate: item.governorate,
                      distance: "${item.distance.toStringAsFixed(1)} km away from you",
                      address: "",
                      openTime: item.workingHours,
                      phone: item.phone,
                      onCall: () async {
                        final uri = Uri.parse("tel:${item.phone}");
                        await launchUrl(uri);
                      },
                      onLocation: () async {
                        final uri = Uri.parse(item.locationUrl);
                        await launchUrl(uri);
                      },
                    );
                  },
                );
              }

              if (state is SpecialitiesError) {
                return Center(child: Text(state.message));
              }

              return const SizedBox();
            },
          ),
        ),
      ],
    ));
  }
}
