import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/objects/factoring_objects.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/widgets/factoring_result_widgets/discount_result_widget.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/widgets/factoring_result_widgets/effective_annual_cost_rate_result_widget.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/widgets/factoring_result_widgets/given_value_result_widget.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/widgets/factoring_result_widgets/go_back_button_widget.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/widgets/factoring_result_widgets/net_value_result_widget.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/widgets/factoring_result_widgets/received_value_result_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FactoringResultPage extends StatefulWidget {
  final FactoringResultObject resultObject;
  final Function goBackFun;

  const FactoringResultPage({Key key, this.resultObject, this.goBackFun}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FactoringResultPageState();
  }

}


class _FactoringResultPageState extends State<FactoringResultPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(400)),
        child: Column(
          children: <Widget>[
            DiscountResultWidget(discountAmount: widget.resultObject.discountAmount,),
            NetValueResultWidget(netValueAmount: widget.resultObject.netValue,),
            ReceivedValueResultWidget(receivedValueAmount: widget.resultObject.receivedValue,),
            GivenValueResultWidget(givenValueAmount: widget.resultObject.givenValue,),
            EffectiveAnnualCostRateResultWidget(effectiveAnnualRateAmount: widget.resultObject.effectiveAnnualCostRate * 100,),
            GoBackButtonWidget(goBackFun: widget.goBackFun,),
          ],
        ),
      ),
    );
  }

}