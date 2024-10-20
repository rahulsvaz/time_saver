
import 'package:hive/hive.dart';

part 'data_model.g.dart';

@HiveType(typeId: 1)
class DataModel{
  @HiveField(0)
  String time ;
  DataModel({required this.time});

}
