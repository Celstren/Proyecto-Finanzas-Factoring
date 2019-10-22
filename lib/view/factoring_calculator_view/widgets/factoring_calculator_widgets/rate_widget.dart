import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_enums.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/widgets/factoring_calculator_widgets/effective_rate_widget.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/widgets/factoring_calculator_widgets/nominal_rate_widget.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/widgets/factoring_calculator_widgets/periods_widget.dart';

class RateWidget extends StatelessWidget {
  final Rate rate;
  final FinanceDateEnum capitalizationPeriod;
  final FinanceDateEnum ratePeriod;
  final MoneyMaskedTextController rateAmountController;
  final Function onCapitalizationChange;
  final Function onRateChange;

  const RateWidget({Key key, this.rate, this.rateAmountController, this.capitalizationPeriod, this.ratePeriod, this.onCapitalizationChange, this.onRateChange}) : super(key: key);

  buildRate(){
    switch(rate){
      case Rate.NOMINAL_RATE:
      // TODO: Handle this case.
        return NominalRateWidget(rateAmountController: rateAmountController, capitalizationPeriod: capitalizationPeriod, onCapitalizationChange: onCapitalizationChange,);
        break;
      case Rate.EFFECTIVE_RATE:
      // TODO: Handle this case.
        return EffectiveRateWidget(rateAmountController: rateAmountController,);
        break;
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          buildRate(),
          PeriodsWidget(ratePeriod: ratePeriod, onRateChange: onRateChange,),
        ],
      ),
    );
  }

}