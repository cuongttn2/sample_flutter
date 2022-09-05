
import 'package:intl/intl.dart';

class SampleModel {
  String? id;
  String? name;
  String? weather;
  String? location;
  String? dateTime;
  SampleModel({this.id, this.name, this.weather, this.location, this.dateTime});
  factory SampleModel.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as String;
    final name = json['name'] as String;
    final weather = json['weather'] as String;
    final location = json['location'] as String;
    final dateTime = json['dateTime'] as String;
    final dt = DateTime.parse(dateTime).toLocal();
    return SampleModel(
      id: id,
      name: name[0].toUpperCase() + name.substring(1).toLowerCase(),
      weather: weather,
      location: location,
      dateTime: DateFormat('MM:dd').format(dt),
    );
  }
   SampleModel copyWith({
      String? id,
      String? name,
      String? weather,
      String? location,
      String? dateTime,
  }) {
    return SampleModel(
      id: id ?? this.id,
      name: name ?? this.name,
      weather: weather ?? this.weather,
      location: location ?? this.location,
      dateTime: dateTime ?? this.dateTime,
    );
  }
}
