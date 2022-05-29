import 'dart:ffi';

class Token {
  const Token({
    required this.title,
    required this.imageUrl,
    required this.symbol,
    required this.balance,
  });

  final String title;
  final String imageUrl;
  final String symbol;
  final double balance;
}