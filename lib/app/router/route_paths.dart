enum AppRoute {
  coinStatus(
    path: '/coin_status',
    name: 'coinStatus',
  ),
  coinTicker(
    path: '/coin_ticker/:id',
    name: 'coinTicker',
  ),
  map(
    path: '/map',
    name: 'map',
  ),
  order(
    path: '/order',
    name: 'order',
  ),
  tracking(
    path: '/tracking',
    name: 'tracking',
  ),
  driverTracking(
    path: '/driverTracking',
    name: 'driverTracking',
  ),
  userTracking(
    path: '/userTracking',
    name: 'userTracking',
  ),
  chooseRole(
    path: '/chooseRole',
    name: 'chooseRole',
  ),
  chat(
    path: '/chat',
    name: 'chat',
  );

  const AppRoute({required this.path, required this.name});
  final String path;
  final String name;
}
