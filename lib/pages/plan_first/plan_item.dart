import 'package:customized_plan/db_plan/db_plan.dart';
import 'package:customized_plan/db_plan/plan_entity.dart';
import 'package:customized_plan/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

class PlanItem extends StatefulWidget {
  PlanItem(this.meNeeds,this.currentIndex, {this.onTap,this.entity, super.key});

  PlanEntity? entity;
  List<int> meNeeds;
  final int currentIndex;
  final VoidCallback? onTap;

  @override
  State<PlanItem> createState() => _PlanItemState();
}

class _PlanItemState extends State<PlanItem>
    with AutomaticKeepAliveClientMixin {

  DBPlan dbPlan = Get.find();

  void updateData(int index) async {
    if (widget.entity == null) {
      final e = PlanEntity(
        id: 0,
        createdTime: DateTime.now(),
        day: widget.currentIndex,
        meNeeds: [index],
      );
      await dbPlan.insertPlan(e);
    } else {
      if (widget.entity?.meNeeds.contains(index) == true) {
        widget.entity?.meNeeds.remove(index);
      } else {
        widget.entity?.meNeeds.add(index);
      }
      await dbPlan.updatePlan(widget.entity!);
    }
    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.meNeeds.length,
        itemBuilder: (_, index) {
          final item = widget.meNeeds[index];
          return Container(
            width: double.infinity,
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: <Widget>[
              Expanded(
                  child: Text(
                meNeedList[item],
                style: TextStyle(
                    fontSize: 14,
                    color: const Color(0xff715943),
                    decoration: widget.entity?.meNeeds.contains(item) == true
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,decorationStyle: TextDecorationStyle.solid),
                    overflow: TextOverflow.ellipsis,
              )),
              Icon(
                widget.entity?.meNeeds.contains(item) == true
                    ? Icons.check_circle
                    : Icons.circle_outlined,
                size: 19,
                color: widget.entity?.meNeeds.contains(item) == true
                    ? primaryColor
                    : Colors.grey,
              )
            ].toRow(),
          )
              .decorated(
                  borderRadius: BorderRadius.circular(8),
                  color: widget.entity?.meNeeds.contains(item) == true
                      ? const Color(0xfff7f7f7)
                      : const Color(0xfff5f1ed)).marginOnly(bottom: 10)
              .gestures(onTap: () {
                updateData(item);
          });
        });
  }

  @override
  bool get wantKeepAlive => true;
}
