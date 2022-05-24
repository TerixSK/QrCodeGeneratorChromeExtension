import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_generator_extension/qr_code_generator/widgets/qr_text_field.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../bloc/qr_code_bloc.dart';
import '../utilities/color_list.dart';
import '../widgets/color_list.dart';

class QRView extends StatefulWidget {
  const QRView({Key? key}) : super(key: key);

  @override
  State<QRView> createState() => _QRViewState();
}

class _QRViewState extends State<QRView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        child: BlocBuilder<QrCodeBloc, QrCodeState>(
          builder: (context, state) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: QrImage(
                    data: state.qrText,
                    padding: const EdgeInsets.all(16),
                    foregroundColor: qrColors[state.qrColorIndex],
                    backgroundColor:
                        qrBackgroundColors[state.qrBackgroundColorIndex],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const QrTextField(),
                        const SizedBox(height: 24),
                        const Text(
                          'Choose QR Color',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        ColorList(
                          colors: qrColors,
                          currentIndex: state.qrColorIndex,
                          onItemTap: (int newIndex) => context
                              .read<QrCodeBloc>()
                              .add(
                                  ChangeQrColorIndexText(colorIndex: newIndex)),
                        ),
                        const Text(
                          'Choose QR Background Color',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        ColorList(
                          colors: qrBackgroundColors,
                          currentIndex: state.qrBackgroundColorIndex,
                          onItemTap: (int newIndex) => context
                              .read<QrCodeBloc>()
                              .add(ChangeQrBackgroundColorIndexText(
                                  colorBackgroundIndex: newIndex)),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
