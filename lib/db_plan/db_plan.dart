import 'dart:convert';
import 'package:customized_plan/db_plan/plan_entity.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DBPlan extends GetxService {
  late Database dbBase;

  Future<DBPlan> init() async {
    await createPlanDB();
    return this;
  }

  createPlanDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'plan.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createPlanTable(db);
        });
  }

  createPlanTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS plan (id INTEGER PRIMARY KEY, createdTime TEXT, day INTEGER, meNeeds TEXT)');
  }

  insertPlan(PlanEntity entity) async {
    final id = await dbBase.insert('plan', {
      'createdTime': entity.createdTime.toIso8601String(),
      'day': entity.day,
      'meNeeds': jsonEncode(entity.meNeeds),
    });
    return id;
  }

  updatePlan(PlanEntity entity) async {
    await dbBase.update('plan', {
      'day': entity.day,
      'meNeeds': jsonEncode(entity.meNeeds),
    }, where: 'id = ?', whereArgs: [entity.id]);
  }

  cleanPlanData() async {
    await dbBase.delete('plan');
  }

  Future<List<PlanEntity>> getPlanAllData() async {
    var result = await dbBase.query('plan', orderBy: 'createdTime DESC');
    return result.map((e) => PlanEntity.fromJson(e)).toList();
  }
}
