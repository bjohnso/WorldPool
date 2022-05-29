import 'dart:ffi';

class Token {
  const Token({
    required this.title,
    required this.symbol,
    required this.balance,
  });

  final String title;
  final String symbol;
  final double balance;
}