import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salamaty/features/specialities/presentation/view/specialties_screen.dart';

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
    icon: FontAwesomeIcons.heartPulse,
    screen: SpecialtiesScreens(specialtyName: 'Cardiology'),
  ),
  MedicalSpecialty(
    name: 'Ophthalmology',
    icon:  FontAwesomeIcons.eye,
    screen: SpecialtiesScreens(specialtyName: 'Ophthalmology'),
  ),
  MedicalSpecialty(
    name: 'Nephrology',
    icon: Icons.water_drop_outlined,
    screen: SpecialtiesScreens(specialtyName: 'Nephrology'),
  ),
  MedicalSpecialty(
    name: 'Pediatrics',
    icon:FontAwesomeIcons.baby,
    screen: SpecialtiesScreens(specialtyName: 'Pediatrics'),
  ),
  MedicalSpecialty(
    name: 'Orthopedics',
    icon: Icons.personal_injury_outlined,
    screen: SpecialtiesScreens(specialtyName: 'Orthopedics'),
  ),
  MedicalSpecialty(
    name: 'Neurology',
    // icon: Icons.psychology_outlined,
    icon: FontAwesomeIcons.brain,
    screen: SpecialtiesScreens(specialtyName: 'Neurology'),
  ),
  MedicalSpecialty(
    name: 'Obstetrics & Gynecology',
    icon: FontAwesomeIcons.personPregnant,
    screen: SpecialtiesScreens(specialtyName: 'Obstetrics & Gynecology'),
  ),
  MedicalSpecialty(
    name: 'Dentistry',
    icon: FontAwesomeIcons.tooth,
    screen: SpecialtiesScreens(specialtyName: 'Dentistry'),
  ),
   MedicalSpecialty(
    name: 'Multidisciplinary',
    icon: FontAwesomeIcons.stethoscope,
    screen: SpecialtiesScreens(specialtyName: 'Multidisciplinary'),
  ),
];
