import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/view/tir_calculator/objects/fee_object.dart';
import 'package:proyecto_finanzas/view/tir_calculator/widgets/fee_form_title_widget.dart';
import 'package:proyecto_finanzas/view/tir_calculator/widgets/fee_tile_widget.dart';

class FeeFormWidget extends StatelessWidget {
  final List<FeeObject> feeObjects;

  const FeeFormWidget({Key key, this.feeObjects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          FeeFormTitleWidget(),
          Container(
            child: Column(
              children: List.generate(feeObjects.length, (index) => FeeTileWidget(feeObject: feeObjects[index])),
            ),
          ),
        ],
      ),
    );
  }

}