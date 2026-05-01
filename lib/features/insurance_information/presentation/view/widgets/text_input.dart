// import 'package:flutter/material.dart';

// class TextInput extends StatefulWidget {
//   const TextInput({
//     super.key,
//     this.hintText,
//     this.isPassword = false,
//   });

//   final String? hintText;
//   final bool isPassword;

//   @override
//   State<TextInput> createState() => _TextInputState();
// }

// class _TextInputState extends State<TextInput> {
//   bool _obscureText = true;

//   static const Color primaryColor = Color(0xFF0D2D9E);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 16,
//       ),
//       child: TextFormField(
//         obscureText: widget.isPassword ? _obscureText : false,
//         decoration: InputDecoration(
//           hintText: widget.hintText ?? '',
//           suffixIcon: widget.isPassword
//               ? IconButton(
//                   icon: Icon(
//                     _obscureText ? Icons.visibility_off : Icons.visibility,
//                     color: Colors.grey,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       _obscureText = !_obscureText;
//                     });
//                   },
//                 )
//               : null,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(
//               color: primaryColor,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  const TextInput({
    super.key,
    this.hintText,
    this.isPassword = false,
    this.controller,
  });

  final String? hintText;
  final bool isPassword;
  final TextEditingController? controller;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool _obscureText = true;
  static const Color primaryColor = Color(0xFF0D2D9E);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword ? _obscureText : false,
        decoration: InputDecoration(
          hintText: widget.hintText ?? '',
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () =>
                      setState(() => _obscureText = !_obscureText),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: primaryColor),
          ),
        ),
      ),
    );
  }
}