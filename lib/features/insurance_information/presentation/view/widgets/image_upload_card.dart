// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:dotted_border/dotted_border.dart';

// class ImageUploadCard extends StatefulWidget {
//   final String title;
//   final String description;

//   const ImageUploadCard({
//     super.key,
//     required this.title,
//     required this.description,
//   });

//   @override
//   State<ImageUploadCard> createState() => _ImageUploadCardState();
// }

// class _ImageUploadCardState extends State<ImageUploadCard> {
//   File? imageFile;
//   final ImagePicker _picker = ImagePicker();
//   static const Color primaryColor = Color(0xFF0D2D9E);
//   bool _isPressed = false;

//   Future<void> _pickImage(ImageSource source) async {
//     try {
//       final XFile? picked =
//           await _picker.pickImage(source: source, imageQuality: 80);
//       if (picked != null) {
//         setState(() {
//           imageFile = File(picked.path);
//         });
//       }
//     } catch (e) {
//       debugPrint("Error picking image: $e");
//     }
//   }

//   void _showPicker() {
//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//       ),
//       builder: (_) {
//         return Padding(
//           padding: const EdgeInsets.all(24),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 leading: const Icon(Icons.camera_alt),
//                 title: const Text('Camera'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   _pickImage(ImageSource.camera);
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.photo),
//                 title: const Text('Gallery'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   _pickImage(ImageSource.gallery);
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: _showPicker,
//           borderRadius: BorderRadius.circular(18),
//           onHighlightChanged: (value) {
//             setState(() {
//               _isPressed = value;
//             });
//           },
//           child: DottedBorder(
//             borderType: BorderType.RRect,
//             radius: const Radius.circular(18),
//             dashPattern: const [8, 4],
//             color: _isPressed ? primaryColor : const Color(0xFFB3B3B3),
//             strokeWidth: 2,
//             child: Container(
//               height: 167,
//               width: double.infinity,
//               padding: const EdgeInsets.all(12),
//               child: imageFile == null
//                   ? Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           widget.title,
//                           style: const TextStyle(
//                             color: Color(0xFF575353),
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           widget.description,
//                           style: const TextStyle(
//                             color: Color(0xFF575353),
//                             fontSize: 16,
//                           ),
//                         ),
//                         const Spacer(),
//                         // const SizedBox(height: 16),

//                         const Center(
//                           child: Icon(Icons.upload_file_outlined,
//                               size: 60, color: primaryColor),
//                         ),
//                       ],
//                     )
//                   : ClipRRect(
//                       borderRadius: BorderRadius.circular(18),
//                       child: Image.file(
//                         imageFile!,
//                         width: double.infinity,
//                         height: double.infinity,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';

class ImageUploadCard extends StatefulWidget {
  final String title;
  final String description;
  final void Function(File file) onImagePicked;

  const ImageUploadCard({
    super.key,
    required this.title,
    required this.description,
    required this.onImagePicked,
  });

  @override
  State<ImageUploadCard> createState() => _ImageUploadCardState();
}

class _ImageUploadCardState extends State<ImageUploadCard> {
  File? imageFile;
  final ImagePicker _picker = ImagePicker();
  static const Color primaryColor = Color(0xFF0D2D9E);
  bool _isPressed = false;

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? picked =
          await _picker.pickImage(source: source, imageQuality: 80);
      if (picked != null) {
        final file = File(picked.path);
        setState(() => imageFile = file);
        widget.onImagePicked(file);
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
    }
  }

  void _showPicker() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _showPicker,
          borderRadius: BorderRadius.circular(18),
          onHighlightChanged: (value) => setState(() => _isPressed = value),
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(18),
            dashPattern: const [8, 4],
            color: _isPressed ? primaryColor : const Color(0xFFB3B3B3),
            strokeWidth: 2,
            child: Container(
              height: 167,
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              child: imageFile == null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            color: Color(0xFF575353),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.description,
                          style: const TextStyle(
                            color: Color(0xFF575353),
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        const Center(
                          child: Icon(
                            Icons.upload_file_outlined,
                            size: 60,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.file(
                        imageFile!,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}