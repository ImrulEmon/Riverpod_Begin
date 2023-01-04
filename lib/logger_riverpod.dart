import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoggerRiverpod extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {
    // TODO: implement didAddProvider
    super.didAddProvider(provider, value, container);
    print('$provider, $value, $container');
  }
}
