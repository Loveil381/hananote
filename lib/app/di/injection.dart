import 'package:get_it/get_it.dart';
import 'package:hananote/app/di/injection.config.dart';
import 'package:injectable/injectable.dart';

/// Global service locator instance.
final GetIt getIt = GetIt.instance;

@InjectableInit()

/// Configures dependency injection.
void configureDependencies() => getIt.init();
