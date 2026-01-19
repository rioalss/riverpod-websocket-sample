// features/feature_1/widgets/coin_status_list_widget.dart
import 'dart:async';

import 'package:example_websocket/app/router/route_paths.dart';
import 'package:example_websocket/domain/entities/coinbase_status_entity.dart';
import 'package:example_websocket/features/feature%201/providers/coinbase_status_notifier.dart';
import 'package:example_websocket/features/feature%201/state/coinbase_status_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CoinStatusListWidget extends ConsumerWidget {
  const CoinStatusListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(coinbaseStatusProvider);

    return state.maybeWhen(
      orElse: () => const Center(child: CircularProgressIndicator()),
      initial: () => Center(
          child: ElevatedButton(
              onPressed: () async {
                ref.read(coinbaseStatusProvider.notifier).refresh();
              },
              child: const Text('Get Started'))),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (data, lastUpdated, status) =>
          _buildProductsList(context, ref, data),
      error: (error, stack) => _buildErrorWidget('Stream Error: $error', ref),
    );
  }

  Widget _buildErrorWidget(String error, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
          const SizedBox(height: 16),
          Text(error, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              ref.read(coinbaseStatusProvider.notifier).refresh();
            }, // Retry logic
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildProductsList(
      BuildContext context, WidgetRef ref, CoinbaseStatusEntity data) {
    final products = data.products;

    if (products.isEmpty) {
      return const Center(child: Text('No products available'));
    }

    return RefreshIndicator(
      onRefresh: () async {
        ref.read(coinbaseStatusProvider.notifier).refresh();
      },
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                product.productId,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text('Status: ${product.status}'),
              trailing: Text(product.baseCurrency),
              onTap: () {
                unawaited(context.push(
                  extra: {'id': product.productId},
                  AppRoute.coinTicker.path,
                ));
              },
            ),
          );
        },
      ),
    );
  }
}
