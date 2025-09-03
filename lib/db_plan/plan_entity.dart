import 'dart:convert';

class PlanEntity {
  int id;
  DateTime createdTime;
  int day;
  int? greatestGoal;
  List<int> meNeeds;

  PlanEntity({
    required this.id,
    required this.createdTime,
    required this.day,
    this.greatestGoal,
    required this.meNeeds,
  });

  factory PlanEntity.fromJson(Map<String, dynamic> json) {
    return PlanEntity(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      day: json['day'],
      meNeeds: List<int>.from(jsonDecode(json['meNeeds'])),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'day': day,
      'meNeeds': jsonEncode(meNeeds),
    };
  }
}