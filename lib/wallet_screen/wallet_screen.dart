import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/todo.dart';
import 'package:world_pool/wallet_screen/pool_card.dart' as pool_card;
import 'package:world_pool/wallet_screen/token_card.dart' as token_card;

import '../dto/pool.dart';
import '../dto/token.dart';

class WalletScreenWidget extends StatefulWidget {
  WalletScreenWidget({Key? key}) : super(key: key);

  final List<Token> tokenList = [
    const Token(
      title: 'World',
      symbol: 'WORLD',
      balance: 1000.0,
        imageUrl: 'images/world.png'
    ),
    const Token(
      title: 'Solana',
      symbol: 'SOL',
      balance: 3138.93701,
        imageUrl: 'images/sol.png'
    ),
    const Token(
      title: 'Polygon',
      symbol: 'MATIC',
      balance: 99999.9991,
        imageUrl: 'images/matic.png'
    ),
    const Token(
      title: 'Ethereum',
      symbol: 'ETH',
      balance: 57.97061,
        imageUrl: 'images/eth.png'
    ),
  ];

  final List<Pool> poolList = [
    const Pool(
      poolId: '1',
      title: 'Earth Foundation',
      description: "We protect and restore\nthe world's natural habitats",
      tokens: [
        Token(
            title: 'Polygon',
            symbol: 'MATIC',
            balance: 99999.9991,
            imageUrl: 'images/matic.png'
        ),
      ], imageUrl: 'images/trust_for_public_land.png'
    ),
    const Pool(
        poolId: '2',
        title: 'Solar Nation',
        description: "We provide the world with\nsustainable energy by creating\nsolar farms across the planet",
        tokens: [
          Token(
              title: 'Ethereum',
              symbol: 'ETH',
              balance: 57.97061,
              imageUrl: 'images/eth.png'
          ),
        ],
        imageUrl: 'images/solar_power.png'
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
            Tab(text: WalletTab.Tokens.name),
            Tab(text: WalletTab.Pools.name),
            Tab(text: WalletTab.NFTs.name)
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
        return buildPoolList();
      case 2:
        return buildEmptySliver();
      default:
        return buildEmptySliver();
    }
  }

  Widget buildTokenList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        Token token = widget.tokenList[index];

        return token_card.TokenCardWidget(
          title: token.title,
          balance: token.balance,
          imageUrl: token.imageUrl,
          cardColour: Colors.white,
        );
      },
        childCount: widget.tokenList.length,
      ),
    );
  }

  Widget buildPoolList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        Pool pool = widget.poolList[index];

        return pool_card.PoolCardWidget(
          title: pool.title,
          description: pool.description,
          cardColour: Colors.white,
          tokens: pool.tokens,
          imageUrl: pool.imageUrl,
        );
      },
        childCount: widget.poolList.length,
      ),
    );
  }

  Widget buildNFTList() {
    TODO('buildNFTList');
  }

  Widget buildEmptySliver() {
    return SliverToBoxAdapter( child: Container() );
  }
}

enum WalletTab {
  Tokens,
  Pools,
  NFTs
}