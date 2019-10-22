import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/objects/factoring_objects.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/widgets/factoring_calculator_widgets/add_more_widget.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/widgets/factoring_calculator_widgets/payment_widget.dart';

class PaymentsWidget extends StatelessWidget {
  final List<PaymentObject> payments;
  final Function onAddFun;
  final Function onDeleteFun;

  const PaymentsWidget({Key key, this.payments, this.onAddFun, this.onDeleteFun}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Column(
            children: List.generate(payments.length, (index) => PaymentWidget(index: index, payment: payments[index], deleteAtFun: onDeleteFun,)),
          ),
          AddMoreWidget(onAddFun: onAddFun,),
        ],
      ),
    );
  }

}