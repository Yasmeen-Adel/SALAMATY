import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/widgets/custom_screen_subtitle.dart';
import 'package:salamaty/core/widgets/custom_screen_title.dart';
import 'package:salamaty/features/scan/presentation/view/widgets/extract_screen.dart';
import 'package:salamaty/features/scan/presentation/view/widgets/prescription_image_widget.dart';
import 'package:salamaty/features/scan/presentation/view/widgets/scan_button.dart';
import 'package:salamaty/features/scan/presentation/view/widgets/upload_button.dart';

class ScanScreenBody extends StatelessWidget {
  const ScanScreenBody({super.key});

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? picked = await picker.pickImage(source: source, imageQuality: 80);
      if (picked != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ExtractScreen(imageFile: File(picked.path)),
          ),
        );
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          const ArrowBack(),
          const SizedBox(height: 15),
          const CustomScreenTitle(title: 'Scan Prescription'),
          const CustomScreenSubtitle(
            subtitleText:
                'Use your camera to scan your prescription or upload an image from your gallery.',
          ),
          const SizedBox(height: 20),
          const PrescriptionImageWidget(), 
          const SizedBox(height: 30),
          ScanButton(
            text: 'Scan with Camera',
            onPressed: () => _pickImage(context, ImageSource.camera),
          ),
          const SizedBox(height: 20),
          UploadButton(
            text: 'Upload from Gallery',
            onPressed: () => _pickImage(context, ImageSource.gallery),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
