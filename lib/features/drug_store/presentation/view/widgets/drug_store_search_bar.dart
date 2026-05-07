import 'package:flutter/material.dart';
import 'package:salamaty/generated/l10n.dart';

class DrugStoreSearchBar extends StatelessWidget {
  const DrugStoreSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
    
      style: const TextStyle(fontSize: 14),
      decoration: InputDecoration(
        hintText: S.of(context).search,
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