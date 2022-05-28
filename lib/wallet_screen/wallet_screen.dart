import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_pool/wallet_screen/token_card.dart';

class WalletScreenWidget extends StatefulWidget {
  const WalletScreenWidget({Key? key}) : super(key: key);

  @override
  State<WalletScreenWidget> createState() => _WalletScreenWidgetState();
}

class _WalletScreenWidgetState extends State<WalletScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: ListView(
          children: const [
            TokenCardWidget(title: 'World', balance: 0.0),
            TokenCardWidget(title: 'Solana', balance: 0.0),
            TokenCardWidget(title: 'Ethereum', balance: 0.0),
            TokenCardWidget(title: 'Polygon', balance: 0.0),
          ],
        )
      ),
    );
  }
}