import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'qr_code_generator/bloc/qr_code_bloc.dart';
import 'qr_code_generator/pages/qr_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<QrCodeBloc>(create: (context) => QrCodeBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Chrome Extension',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const QRView(),
      ),
    );
  }
}
