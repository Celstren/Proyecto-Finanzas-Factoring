import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/objects/factoring_objects.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/widgets/factoring_calculator_widgets/add_more_widget.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/widgets/factoring_calculator_widgets/cost_widget.dart';

class CostsWidget extends StatelessWidget {
  final List<CostObject> costs;
  final Function onAddFun;
  final Function onDeleteFun;

  const CostsWidget({Key key, this.costs, this.onAddFun, this.onDeleteFun}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Column(
            children: List.generate(costs.length, (index) => CostWidget(index: index, cost: costs[index], deleteAtFun: onDeleteFun,)),
          ),
          AddMoreWidget(onAddFun: onAddFun,),
        ],
      ),
    );
  }

}