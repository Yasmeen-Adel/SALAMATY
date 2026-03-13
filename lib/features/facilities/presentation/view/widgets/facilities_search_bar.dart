import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/facilities/presentation/cubit/facilities_cubit.dart';

class FacilitiesSearchBar extends StatefulWidget {
  const FacilitiesSearchBar({super.key});

  @override
  State<FacilitiesSearchBar> createState() => _FacilitiesSearchBarState();
}

class _FacilitiesSearchBarState extends State<FacilitiesSearchBar> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      onChanged: (value) {
        context.read<FacilitiesCubit>().loadAllFacilities(
              search: value,
            );
      },
      style: const TextStyle(fontSize: 14),
      decoration: InputDecoration(
        hintText: 'Search ...',
        hintStyle: const TextStyle(fontSize: 14),
        prefixIcon: const Icon(Icons.search, size: 20),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
