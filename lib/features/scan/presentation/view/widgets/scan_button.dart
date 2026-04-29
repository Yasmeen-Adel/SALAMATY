import 'package:flutter/material.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0D2D9E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: onPressed,
            child:
                //  Row(
                //   children: [
                //     Icon(Icons.camera_alt, color: Colors.white,size: 26,),
                //     const SizedBox(width: 10),
                //     Text(
                //       text,
                //       style: const TextStyle(
                //         fontSize: 22,
                //         fontWeight: FontWeight.w700,
                //         color: Colors.white,
                //       ),
                //     ),
                //   ],
                // ),
                Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.camera_alt, color: Colors.white, size: 26),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    text,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
