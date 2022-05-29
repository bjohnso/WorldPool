import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TokenCardWidget extends StatefulWidget {
  const TokenCardWidget({
    Key? key,
    this.title,
    this.imageUrl,
    this.cardColour,
    this.balance
  }) : super(key: key);

  final String? title;
  final String? imageUrl;
  final Color? cardColour;
  final double? balance;

  @override
  State<StatefulWidget> createState() => _TokenCardState();
}

class _TokenCardState extends State<TokenCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
          splashColor: Colors.purpleAccent,
          onTap: () => {},
          child: Align(
            child: AspectRatio(
                aspectRatio: 5 / 2,
                child: Card(
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0, top: 5.0),
                  color: widget.cardColour == null ? Colors.white: widget.cardColour!,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
               
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                    Container(clipBehavior: Clip.antiAlias,
                                      width: 60,
                                      height: 60,
                                      decoration: const BoxDecoration(shape: BoxShape.circle),
                                      child: Image.asset(widget.imageUrl == null ? 'images/world.png' : widget.imageUrl!),
                                    ),


                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                    child: Text(
                                        widget.title == null ? '' : widget.title!,
                                        style: GoogleFonts.openSans(fontSize: 21, fontWeight: FontWeight.bold)
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
                                    child: Text(
                                        widget.balance == null ? 'zero' : widget.balance!.toString(),
                                        style: GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.bold)
                                    ),
                                  ),


                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
                                    child: Text(
                                        'BALANCE',
                                        style: GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ]
                    ),

    )
            ),
          ),
        )
    );
  }
}

enum TokenImageAssets <T extends Object> {
  world<String>('world'),
  sol<String>("sol"),
  matic<String>("matic"),
  eth<String>("eth");

  const TokenImageAssets(this.value);
  final T value;
}

extension TokenImageAssetsExt on TokenImageAssets {
  String get path {
    switch (this) {
      case TokenImageAssets.world:
        return 'images/world.png';
      case TokenImageAssets.sol:
        return 'images/sol.png';
      case TokenImageAssets.matic:
        return 'images/matic.png';
      case TokenImageAssets.eth:
        return 'images/eth.png';
    }
  }
}
