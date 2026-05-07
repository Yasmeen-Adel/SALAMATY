// import 'package:flutter/material.dart';
// import 'package:salamaty/features/scan/presentation/view/scan_screen.dart';
// import 'service_card.dart';

// class ServicesSection extends StatelessWidget {
//   const ServicesSection({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Services',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Color(0xFF1E40AF),
//             ),
//           ),
//           // const SizedBox(height: 8),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ServiceCard(
//                 icon: Icons.health_and_safety_outlined,
//                 title: 'Select Your\nInsurance',
//               ),
//               ServiceCard(
//                 icon: Icons.qr_code_scanner_outlined,
//                 title: 'Upload\nPerception',
//                 onTap: () {
//                   Navigator.pushNamed(context, ScanScreen.routeName);
                  
//                 },
//               ),
//               ServiceCard(
//                 icon: Icons.medication_outlined,
//                 title: 'Find\nMedicines',
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
