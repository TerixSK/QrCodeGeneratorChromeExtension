import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/qr_code_bloc.dart';

class QrTextField extends StatefulWidget {
  const QrTextField({Key? key}) : super(key: key);

  @override
  State<QrTextField> createState() => _QrTextFieldState();
}

class _QrTextFieldState extends State<QrTextField> {
  late final TextEditingController _textController;
  late final FocusNode _textFocus;

  @override
  void initState() {
    super.initState();

    _textController = TextEditingController();
    _textFocus = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      focusNode: _textFocus,
      decoration: InputDecoration(
        labelText: 'QR Text',
        labelStyle: const TextStyle(
          color: Color(0xFF80919F),
        ),
        hintText: 'Enter text / URL',
        hintStyle: const TextStyle(
          color: Color(0xFF80919F),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black54,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onChanged: (value) => context.read<QrCodeBloc>().add(
            ChangeQrText(text: value),
          ),
    );
  }
}
