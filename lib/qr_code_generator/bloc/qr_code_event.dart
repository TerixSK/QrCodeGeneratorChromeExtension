part of 'qr_code_bloc.dart';

@immutable
abstract class QrCodeEvent {}

class ChangeQrText extends QrCodeEvent {
  final String text;

  ChangeQrText({required this.text});
}

class ChangeQrColorIndexText extends QrCodeEvent {
  final int colorIndex;

  ChangeQrColorIndexText({required this.colorIndex});
}

class ChangeQrBackgroundColorIndexText extends QrCodeEvent {
  final int colorBackgroundIndex;

  ChangeQrBackgroundColorIndexText({required this.colorBackgroundIndex});
}
