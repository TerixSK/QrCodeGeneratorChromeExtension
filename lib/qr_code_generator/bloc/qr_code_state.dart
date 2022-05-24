part of 'qr_code_bloc.dart';

@immutable
abstract class QrCodeState {
  final String qrText;
  final int qrColorIndex;
  final int qrBackgroundColorIndex;

  const QrCodeState(
    this.qrText,
    this.qrColorIndex,
    this.qrBackgroundColorIndex,
  );
}

class QrCodeInitial extends QrCodeState {
  const QrCodeInitial() : super('', 0, 0);
}

class QrCodeDate extends QrCodeState {
  const QrCodeDate({
    required String qrText,
    required int qrColorIndex,
    required int qrBackgroundColorIndex,
  }) : super(
          qrText,
          qrColorIndex,
          qrBackgroundColorIndex,
        );
}
