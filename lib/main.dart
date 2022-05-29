import 'package:flutter/material.dart';
import 'package:world_pool/wallet_screen/wallet_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'World Pool',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WalletScreenWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}
