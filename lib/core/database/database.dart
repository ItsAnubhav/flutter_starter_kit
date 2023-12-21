import 'converters/datetime_converter.dart';
import 'package:floor/floor.dart';

@TypeConverters([DateTimeConverter])
@Database(version: 1, entities: [])
abstract class AppDatabase extends FloorDatabase {}
