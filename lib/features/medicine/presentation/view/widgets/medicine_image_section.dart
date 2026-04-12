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
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),

          // border
          border: Border.all(
            color: Color(0xFF0D2D9E).withOpacity(0.1),
            width: 1,
          ),

          boxShadow: [
            BoxShadow(
              color: Color(0xFF0D2D9E).withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
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
