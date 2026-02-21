
import 'package:flutter/material.dart';
import 'package:salamaty/features/specialities/presentation/view/ophthalmology_screen.dart';

class MedicalSpecialty {
  final String name;
  final IconData icon;
 final Widget screen;
  MedicalSpecialty({
    required this.name,
    required this.icon,
    required this.screen,
  });
}

final List<MedicalSpecialty> medicalSpecialties = [
  MedicalSpecialty(
    name: 'Cardiology',
    icon: Icons.favorite_border,
   screen: OphthalmologyScreen(),
  ),
  MedicalSpecialty(
    name: 'Ophthalmology',
    icon: Icons.visibility_outlined,
    screen: OphthalmologyScreen(),
  ),
  MedicalSpecialty(
    name: 'Nephrology',
    icon: Icons.water_drop_outlined,
    screen: OphthalmologyScreen(),
  ),
  MedicalSpecialty(
    name: 'Pediatrics',
    icon: Icons.child_care,
    screen: OphthalmologyScreen(),
  ),
  MedicalSpecialty(
    name: 'Orthopedics',
    icon: Icons.accessibility_new,
    screen: OphthalmologyScreen(),
  ),
  MedicalSpecialty(
    name: 'Neurology',
    icon: Icons.psychology_outlined,
    screen: OphthalmologyScreen(),
  ),
  MedicalSpecialty(
    name: 'Obstetrics & Gynecology',
    icon: Icons.pregnant_woman_outlined,
    screen: OphthalmologyScreen(),
  ),
  MedicalSpecialty(
    name: 'General Surgery',
    icon: Icons.medical_services_outlined,
    screen: OphthalmologyScreen(),
  ),
  MedicalSpecialty(
    name: 'Multi-Specialty',
    icon: Icons.local_hospital_outlined,
    screen: OphthalmologyScreen(),
  ),
  MedicalSpecialty(
    name: 'Dentistry',
    icon: Icons.medical_information_outlined,
    screen: OphthalmologyScreen(),
  ),
];
