import 'package:flutter/material.dart';
import 'product_card.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'New Products',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E40AF),
              // decoration: TextDecoration.underline,
              // decorationColor: Color(0xFF1E40AF),
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            height: 280,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                ProductCard(
                  name: 'Fish Oil Omega 3...',
                  price: 'Rp75.000',
                  originalPrice: 'Rp150.000',
                  discount: '50%',
                  location: 'Bandung',
                  imageUrl:
                      'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=400',
                ),
                SizedBox(width: 16),
                ProductCard(
                  name: 'Lansoprazole 30 mg...',
                  price: 'Rp15.000',
                  location: 'Bandung',
                  imageUrl:
                      'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=400',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
