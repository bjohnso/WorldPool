import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TokenCardWidget extends StatefulWidget {
  const TokenCardWidget({Key? key, this.title, this.imageUrl, this.balance}) : super(key: key);

  final String? title;
  final String? imageUrl;
  final double? balance;

  @override
  State<StatefulWidget> createState() => _TokenCardState();
}

class _TokenCardState extends State<TokenCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Align(
          child: AspectRatio(
              aspectRatio: 3 / 1,
              child: Card(
                margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0, top: 5.0),
                color: Colors.white60,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
                          child: Container(clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.pink),
                            child: Image.asset(widget.imageUrl == null ? 'images/world.png' : widget.imageUrl!),
                          ),
                        ),

                       Padding(
                         padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                         child: Text(
                             widget.title == null ? "" : widget.title!,
                             style: GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.bold)
                         ),
                       ),
                    ]
                  ),
                )
    )
          ),
        )
    );
  }

}