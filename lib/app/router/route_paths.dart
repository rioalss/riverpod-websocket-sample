enum AppRoute {
  coinStatus(
    path: '/coin_status',
    name: 'coinStatus',
  ),
  coinTicker(
    path: '/coin_ticker/:id',
    name: 'coinTicker',
  );

  const AppRoute({required this.path, required this.name});
  final String path;
  final String name;
}
