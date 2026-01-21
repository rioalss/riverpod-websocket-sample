import 'package:example_websocket/features/coinbase/widgets/coin_status_list_widget.dart';
import 'package:flutter/material.dart';

class CoinStatusScreen extends StatefulWidget {
  const CoinStatusScreen({super.key});

  @override
  State<CoinStatusScreen> createState() => _CoinStatusScreenState();
}

class _CoinStatusScreenState extends State<CoinStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coin Status'),
      ),
      body: const CoinStatusListWidget(),
    );
  }
}
