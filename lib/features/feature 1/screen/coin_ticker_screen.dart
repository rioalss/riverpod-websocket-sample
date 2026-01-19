// features/feature_1/screen/coin_ticker_screen.dart
import 'package:example_websocket/features/feature%201/providers/coinbase_ticker_notifier.dart';
import 'package:example_websocket/features/feature%201/state/coinbase_ticker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CoinTickerScreen extends ConsumerWidget {
  final String productId;

  const CoinTickerScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickerStream = ref.watch(coinbaseTickerProvider(productId));

    return Scaffold(
      appBar: AppBar(
        title: Text(productId),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: context.pop,
        ),
      ),
      body: tickerStream.maybeWhen(
        initial: (productId) =>
            const Center(child: CircularProgressIndicator()),
        orElse: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Stream Error: $error')),
        data: (data, lastUpdated) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Price: ${data.price ?? 'N/A'}',
                  style: Theme.of(context).textTheme.headlineMedium),
              Text('Volume: ${data.volume24h ?? 'N/A'}'),
              Text('Time: ${data.time ?? 'N/A'}'),
            ],
          ),
        ),
        // loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
