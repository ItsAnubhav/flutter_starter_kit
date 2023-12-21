import '../../../../core/database/database.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  final AppDatabase appDatabase;

  AuthLocalDataSourceImpl(
      {required this.sharedPreferences, required this.appDatabase});
}
