import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../dto/token.dart';

class PoolCardWidget extends StatefulWidget {
  const PoolCardWidget({
    Key? key,
    this.title,
    this.description,
    this.imageUrl,
    this.cardColour,
    this.tokens
  }) : super(key: key);

  final String? title;
  final String? description;
  final String? imageUrl;
  final Color? cardColour;
  final List<Token>? tokens;

  @override
  State<StatefulWidget> createState() => _PoolCardState();
}

class _PoolCardState extends State<PoolCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
          splashColor: Colors.purpleAccent,
          onTap: () => {},
          child: Align(
            child: AspectRatio(
                aspectRatio: 10 / 9,
                child: Card(
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0, top: 5.0),
                  color: widget.cardColour == null ? Colors.white: widget.cardColour!,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),

                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: IntrinsicWidth(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                      child: Container(
                                        clipBehavior: Clip.antiAlias,
                                        width: 80,
                                        height: 80,
                                        decoration: const BoxDecoration(shape: BoxShape.circle),
                                        child: Image.asset(widget.imageUrl == null ? 'images/world.png' : widget.imageUrl!),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                      child: Text(
                                          widget.title == null ? '' : widget.title!,
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.openSans(fontSize: 21, fontWeight: FontWeight.bold)
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                      child: Text(
                                          widget.description == null ? '' : widget.description!,
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.openSans(
                                              fontSize: 19,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.grey,
                                          )
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                                      child: buildTokenWidget(widget.tokens![0])
                                    ),

                                    Padding(padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]
                    ),
                  ),

                )
            ),
          ),
        )
    );
  }

  Widget buildTokenWidget(Token token) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: FittedBox(
              fit: BoxFit.fill,
              child: Container(clipBehavior: Clip.antiAlias,
                width: 60,
                height: 60,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(token.imageUrl == null ? 'images/world.png' : token.imageUrl!),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            child: FittedBox(
              fit: BoxFit.fill,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: Text(
                        token.balance.toString(),
                        style: GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.bold)
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
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
    );
  }
}

enum PoolImageAssets <T extends Object> {
  world<String>('world'),
  sol<String>("sol"),
  matic<String>("matic"),
  eth<String>("eth");

  const PoolImageAssets(this.value);
  final T value;
}

extension PoolImageAssetsExt on PoolImageAssets {
  String get path {
    switch (this) {
      case PoolImageAssets.world:
        return 'images/world.png';
      case PoolImageAssets.sol:
        return 'images/sol.png';
      case PoolImageAssets.matic:
        return 'images/matic.png';
      case PoolImageAssets.eth:
        return 'images/eth.png';
    }
  }
}
