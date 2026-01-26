import 'dart:async';

import 'package:example_websocket/app/router/route_paths.dart';
import 'package:example_websocket/features/customer-driver/provider/driver_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ChooseRole extends ConsumerStatefulWidget {
  const ChooseRole({super.key});

  @override
  ConsumerState<ChooseRole> createState() => _ChooseRoleState();
}

class _ChooseRoleState extends ConsumerState<ChooseRole> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Choose Role',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              _RoleCard(
                icon: Icons.person,
                title: 'Customer',
                subtitle: 'Book and tracking driver',
                onTap: () => unawaited(
                  context.push(AppRoute.order.path),
                ),
              ),
              const SizedBox(height: 20),
              _RoleCard(
                icon: Icons.drive_eta,
                title: 'Driver',
                subtitle: 'Take Order',
                onTap: () async {
                  // ✅ INIT DRIVER LISTEN ORDER
                  ref
                      .read(driverLocationNotifierProvider.notifier)
                      .trackingOrder();

                  context.push(AppRoute.driverTracking.path);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _RoleCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Icon(icon, size: 40),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: TextStyle(color: Colors.grey.shade600)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
