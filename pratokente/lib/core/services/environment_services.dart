import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pratokente/app/app.logger.dart';
import 'package:pratokente/constants/constants.dart';

/// Returns values from the environment read from the .env file
class EnvironmentService {
  final log = getLogger('EnvironmentService');

  Future initialise() async {
    log.i('Load environment');
    await load(fileName: ".env");
    log.v('Environement loaded');
  }

  /// Returns the value associated with the key
  String getValue(String key, {bool verbose = false}) {
    final value = env[key] ?? NoKey;
    if (verbose) log.v('key:$key value:$value');
    return value;
  }
}
