import 'package:flutter/material.dart';
import 'package:salamaty/core/utils/app_colors.dart';

class FacilityCard extends StatelessWidget {
  final String name;
  final String type;
  final String distance;
  final String address;
  final String openTime;
  final String phone;
  final VoidCallback onCall;
  final VoidCallback onLocation;

  const FacilityCard({
    super.key,
    required this.name,
    required this.type,
    required this.distance,
    required this.address,
    required this.openTime,
    required this.phone,
    required this.onCall,
    required this.onLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primaryColor.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Name + Type
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                type,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          /// Distance + Address
          Text(
            '$distance $address',
            style: const TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 6),

          /// Open time
          Text(
            openTime,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.green,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 14),

          /// Buttons
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: onCall,
                  icon: const Icon(Icons.call, size: 18),
                  label: Text(phone),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: onLocation,
                  icon: const Icon(Icons.location_on, size: 18),
                  label: const Text('Location'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
