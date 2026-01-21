import 'package:example_websocket/features/coinbase/state/coinbase_status_state.dart';
import 'package:flutter/material.dart';

class StatusBadgeWidget extends StatelessWidget {
  final ConnectionStatus status;
  const StatusBadgeWidget(this.status, {super.key});

  @override
  Widget build(BuildContext context) {
    final color = switch (status) {
      ConnectionStatus.connected => Colors.green,
      ConnectionStatus.connecting => Colors.orange,
      ConnectionStatus.disconnected => Colors.grey,
      ConnectionStatus.error => Colors.red,
    };

    return Row(
      children: [
        Icon(Icons.circle, size: 10, color: color),
        const SizedBox(width: 8),
        Text(status.name),
      ],
    );
  }
}
