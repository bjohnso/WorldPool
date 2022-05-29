import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/todo.dart';
import 'package:world_pool/wallet_screen/token_card.dart';

import '../dto/token.dart';

class WalletScreenWidget extends StatefulWidget {
  WalletScreenWidget({Key? key}) : super(key: key);

  final List<Token> tokenList = [
    const Token(
      title: 'World',
      symbol: 'WORLD',
      balance: 1000.0,
    ),
    const Token(
      title: 'Solana',
      symbol: 'SOL',
      balance: 3138.93701,
    ),
    const Token(
      title: 'Polygon',
      symbol: 'MATIC',
      balance: 99999.9991,
    ),
    const Token(
      title: 'Ethereum',
      symbol: 'ETH',
      balance: 57.97061,
    ),
  ];

  @override
  State<WalletScreenWidget> createState() => _WalletScreenWidgetState();
}

class _WalletScreenWidgetState extends State<WalletScreenWidget> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
    _tabController?.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: buildTabView(context),
      floatingActionButton: buildFloatingActionButtons(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget buildFloatingActionButtons(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add, color: Colors.white),
      backgroundColor: Colors.black,
    );
  }

  Widget buildTabView(BuildContext context) {
    return Center(
      child: CustomScrollView(
        slivers: [
          buildAppBar(),
          buildWallet()
        ]
      )
    );
  }

  Widget buildAppBar() {
    return SliverAppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.pinkAccent,
              Colors.purple,
            ],
          ),
        ),
      ),
      bottom: TabBar(
          tabs: [
            Tab(text: WalletTab.tokens.name),
            Tab(text: WalletTab.pools.name),
            Tab(text: WalletTab.nfts.name)
          ],
        controller: _tabController,
      ),
      forceElevated: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        iconSize: 30.0,
        onPressed: () {
          // Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.purple,
      title: Text(
        'World Wallet',
        style: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }

  Widget buildWallet() {
    int? currentTabIndex = _tabController?.index;

    switch(currentTabIndex) {
      case 0:
        return buildTokenList();
      case 1:
        return buildEmptySliver();
      case 2:
        return buildEmptySliver();
      default:
        return buildEmptySliver();
    }
  }

  Widget buildTokenList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context,
          int index) {
        Token token = widget.tokenList[index];
        TokenImageAssets asset = TokenImageAssets.values.firstWhere((
            element) =>
        element.value.toString().toUpperCase() == token.symbol.toUpperCase()
        );
        return TokenCardWidget(
          title: token.title,
          balance: token.balance,
          imageUrl: asset.path,
          cardColour: Colors.white,
        );
      },
        childCount: widget.tokenList.length,
      ),
    );
  }

  Widget buildPoolList() {
    TODO('buildPoolList');
  }

  Widget buildNFTList() {
    TODO('buildNFTList');
  }

  Widget buildEmptySliver() {
    return SliverToBoxAdapter( child: Container() );
  }
}

enum WalletTab {
  tokens,
  pools,
  nfts
}