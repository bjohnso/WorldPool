import 'dart:ffi';

import 'package:world_pool/dto/token.dart';

class Pool {
  const Pool({
    required this.poolId,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.tokens,
  });

  final String poolId;
  final String title;
  final String imageUrl;
  final String description;
  final List<Token> tokens;
}