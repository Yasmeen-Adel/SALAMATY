import 'package:flutter/material.dart';

class MedicalSpecialty {
  final String name;
  final IconData icon;

  MedicalSpecialty({
    required this.name,
    required this.icon,
  });
}

final List<MedicalSpecialty> medicalSpecialties = [
  MedicalSpecialty(name: 'Heart', icon: Icons.favorite_border),
  MedicalSpecialty(name: 'Neurology', icon: Icons.psychology),
  MedicalSpecialty(name: 'Orthopedic', icon: Icons.accessibility),
  MedicalSpecialty(name: 'Eye Care', icon: Icons.visibility),
  MedicalSpecialty(name: 'General', icon: Icons.medical_services),
  MedicalSpecialty(name: 'Pediatric', icon: Icons.child_care),
  MedicalSpecialty(name: 'Dental', icon: Icons.sentiment_satisfied_alt),
  MedicalSpecialty(name: 'ENT', icon: Icons.hearing),
  MedicalSpecialty(name: 'Skin', icon: Icons.thermostat),
  MedicalSpecialty(name: 'Mental', icon: Icons.person_outline),
  MedicalSpecialty(name: 'Gynecology', icon: Icons.female),
  MedicalSpecialty(name: 'Urology', icon: Icons.monitor_heart),
  MedicalSpecialty(name: 'Internal', icon: Icons.person),
  MedicalSpecialty(name: 'Endocrine', icon: Icons.person_search),
  MedicalSpecialty(name: 'Gastro', icon: Icons.monitor_heart),
  MedicalSpecialty(name: 'Pulmonary', icon: Icons.person_outline),
  MedicalSpecialty(name: 'Nephrology', icon: Icons.person),
  MedicalSpecialty(name: 'Oncology', icon: Icons.person_outline),
  MedicalSpecialty(name: 'Radiology', icon: Icons.monitor_heart),
];
