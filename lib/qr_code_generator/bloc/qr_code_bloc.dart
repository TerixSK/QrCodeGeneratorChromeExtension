// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'qr_code_event.dart';
part 'qr_code_state.dart';

class QrCodeBloc extends Bloc<QrCodeEvent, QrCodeState> {
  String _qrText = '';
  int _qrColorIndex = 0;
  int _qrBackgroundColorIndex = 0;

  QrCodeBloc() : super(const QrCodeInitial()) {
    on<ChangeQrText>(_changeQrText);
    on<ChangeQrColorIndexText>(_changeQrColorIndex);
    on<ChangeQrBackgroundColorIndexText>(_changeQrBackgroundColorIndex);
  }

  void _changeQrText(ChangeQrText event, Emitter<QrCodeState> emit) {
    _qrText = event.text;
    emit(makeBaseDateState());
  }

  void _changeQrColorIndex(
      ChangeQrColorIndexText event, Emitter<QrCodeState> emit) {
    _qrColorIndex = event.colorIndex;
    emit(makeBaseDateState());
  }

  void _changeQrBackgroundColorIndex(
      ChangeQrBackgroundColorIndexText event, Emitter<QrCodeState> emit) {
    _qrBackgroundColorIndex = event.colorBackgroundIndex;
    emit(makeBaseDateState());
  }

  QrCodeDate makeBaseDateState() {
    return QrCodeDate(
        qrText: _qrText,
        qrColorIndex: _qrColorIndex,
        qrBackgroundColorIndex: _qrBackgroundColorIndex);
  }
}
