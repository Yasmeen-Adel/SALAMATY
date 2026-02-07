// import 'package:flutter/material.dart';
// import 'medicine_alternative_item.dart';

// class MedicineAlternativesBody extends StatelessWidget {
//   const MedicineAlternativesBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Back Arrow
//               IconButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 icon: const Icon(
//                   Icons.arrow_back_rounded,
//                   color: Color(0xFF0D2D9E),
//                   size: 28,
//                 ),
//                 padding: EdgeInsets.zero,
//                 alignment: Alignment.centerLeft,
//               ),

//               const SizedBox(height: 16),

//               // Title
//               const Text(
//                 'Medicine Alternatives',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.w800, // Bold جداً
//                   color: Color(0xFF0D2D9E), // نفس الأزرق بتاع التصميم
//                 ),
//               ),

//               const SizedBox(height: 8),

//               // Subtitle
//               const Text(
//                 'Find alternative medicines that provide similar effects to the selected medicine.',
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Color(0xFF828282), // رمادي فاتح
//                   height: 1.5,
//                 ),
//               ),

//               const SizedBox(height: 30),

//               // List of Alternatives
//               Expanded(
//                 child: ListView(
//                   children: const [
//                     MedicineAlternativeItem(
//                       title: 'Ibuprofen',
//                       description:
//                           'Used to relieve pain, reduce fever, and decrease inflammation.',
//                       image:
//                           'assets/images/ibuprofen.png', // تأكد من وجود الصورة
//                       isSelected: false,
//                     ),
//                     MedicineAlternativeItem(
//                       title: 'Aspirin',
//                       description:
//                           'Helps reduce pain, fever, and inflammation. Not suitable for children.',
//                       image: 'assets/images/aspirin.png', // تأكد من وجود الصورة
//                       isSelected: false,
//                     ),
//                     MedicineAlternativeItem(
//                       title: 'Naproxen',
//                       description:
//                           'Used for pain relief and inflammation, especially muscle and joint pain.',
//                       image:
//                           'assets/images/naproxen.png', // تأكد من وجود الصورة
//                       isSelected: true, // ده اللي عليه الإطار الأزرق
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'medicine_alternative_item.dart';

class MedicineAlternativesBody extends StatelessWidget {
  const MedicineAlternativesBody({super.key});

  final List<Map<String, dynamic>> alternatives = const [
    {
      'title': 'Ibuprofen',
      'desc': 'Used to relieve pain, reduce fever, and decrease inflammation.',
      'image': 'assets/images/ibuprofen.png',
    },
    {
      'title': 'Aspirin',
      'desc':
          'Helps reduce pain, fever, and inflammation. Not suitable for children.',
      'image': 'assets/images/aspirin.png',
    },
    {
      'title': 'Naproxen',
      'desc':
          'Used for pain relief and inflammation, especially muscle and joint pain.',
      'image': 'assets/images/naproxen.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),

              // العنوان الرئيسي
              const Text(
                'Medicine Alternatives',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2D4EC7),
                  letterSpacing: -0.5,
                ),
              ),

              const SizedBox(height: 6),

              // النص الفرعي
              const Text(
                'Find alternative medicines that provide similar effects to the selected medicine.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF989898),
                  height: 1.4,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 20),

              // قائمة البدائل
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: alternatives.length,
                  itemBuilder: (context, index) {
                    final item = alternatives[index];

                    return MedicineAlternativeItem(
                      title: item['title'],
                      description: item['desc'],
                      image: item['image'],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
