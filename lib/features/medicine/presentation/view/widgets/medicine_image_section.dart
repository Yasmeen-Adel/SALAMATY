import 'package:flutter/material.dart';

class MedicineImageSection extends StatelessWidget {
  final String imageUrl;

  const MedicineImageSection({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        height: screenHeight * 0.35,
        decoration: BoxDecoration(
          color: const Color(0xFFE5E9F5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: ClipRRect(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.fill,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.image, size: 50),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
