import 'package:flutter/material.dart';
import 'package:salamaty/core/utils/app_text_styles.dart';
import 'package:salamaty/generated/l10n.dart';

class ServiceItemCard extends StatelessWidget {
  final String name;
  final String distance;
  final String address;
  final String status;
  final String type;

  const ServiceItemCard({
    Key? key,
    required this.name,
    required this.distance,
    required this.address,
    required this.status,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: AppTextStyles.medium20.copyWith(
                  color: const Color(0xFF000000),
                ),
              ),
              Text(
                type,
                style: AppTextStyles.medium16.copyWith(
                  color: const Color(0xFF9A9797),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                distance,
                style: AppTextStyles.medium16.copyWith(
                  color: const Color(0xFF9A9797),
                ),
              ),
              Text(
                ' - ',
                style: AppTextStyles.medium16.copyWith(
                  color: const Color(0xFF9A9797),
                ),
              ),
              Text(
                address,
                style: AppTextStyles.medium14.copyWith(
                  color: const Color(0xFF9A9797),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            status,
            style: AppTextStyles.medium16.copyWith(
              color: const Color(0xFF20B15A),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.phone,
                    size: 18,
                  ),
                  label: Text(
                    'Call',
                    style: AppTextStyles.medium18.copyWith(
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E40AF),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.location_on,
                    size: 20,
                  ),
                  label: Text(
                    // 'Location',
                    S.of(context).location,
                    style: AppTextStyles.medium18.copyWith(
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E40AF),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
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
