
import 'package:flutter/material.dart';
import 'package:salamaty/core/utils/app_colors.dart';

class InsuranceCard extends StatelessWidget {
  final String name;
  final String? imageUrl;   // now nullable — supports network URLs
  final bool selected;
  final VoidCallback onTap;

  const InsuranceCard({
    super.key,
    required this.name,
    this.imageUrl,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: selected ? AppColors.primaryColor : Colors.grey.shade300,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: _buildImage(),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: selected ? AppColors.primaryColor : Colors.grey,
                    width: 2,
                  ),
                ),
                child: selected
                    ? const Center(
                        child: Icon(
                          Icons.circle,
                          size: 12,
                          color: AppColors.primaryColor,
                        ),
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return const Icon(Icons.business, color: Colors.grey);
    }

    if (imageUrl!.startsWith('http')) {
      return Image.network(
        imageUrl!,
        width: 60,
        height: 60,
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) =>
            const Icon(Icons.business, color: Colors.grey),
        loadingBuilder: (_, child, progress) {
          if (progress == null) return child;
          return const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        },
      );
    }

    return Image.asset(
      imageUrl!,
      width: 60,
      height: 60,
      fit: BoxFit.contain,
      errorBuilder: (_, __, ___) =>
          const Icon(Icons.business, color: Colors.grey),
    );
  }
}
