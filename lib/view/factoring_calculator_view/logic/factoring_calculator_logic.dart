import 'package:proyecto_finanzas/view/factoring_calculator_view/objects/factoring_objects.dart';
import 'dart:math';

double calculateCostTotal(List<CostObject> costs){
  double costTotal = 0;

  costs.forEach((cost){
    costTotal += cost.amountController.numberValue;
  });

  return costTotal;
}

double calculatePaymentTotal(List<PaymentObject> payments){
  double paymentTotal = 0;

  payments.forEach((payment){
    paymentTotal += payment.amountController.numberValue;
  });

  return paymentTotal;
}

///m = period of nominal rate
///n = period of capitalization of the nominal rate
double calculateNominalRateToEffectiveRate(double nominalRate, double m, double n){
  assert (m != 0);
  return pow(1 + (nominalRate / m), n) - 1;
}

///m = period of effective
double calculateDiaryEffectiveRate(double effectiveRate, int difDays, double m){
  return (pow(1 + effectiveRate, difDays / m)) - 1;
}

double calculateDiscountRate(double effectiveDiaryRate){
  assert (effectiveDiaryRate != -1);

  return effectiveDiaryRate/(effectiveDiaryRate + 1);
}

double calculateDiscountAmount(double amount, double discountRate){
  return amount * discountRate;
}

double calculateNetPresentValue(double amount, double discount){
  return amount - discount;
}

double calculateReceivedValue(double netPresentValue, double costTotal){
  return netPresentValue - costTotal;
}

double calculateGivenValue(double amount, double paymentTotal){
  return amount + paymentTotal;
}

double calculateEffectiveCostsAnnualRate(double receivedValue, double givenValue, double m, int difDays){
  return pow(givenValue / receivedValue, m / difDays) - 1;
}

int peruStandardDaysDifferenceConversion(DateTime startDate, DateTime endDate){
  int daysDiscounted = (endDate.difference(startDate).inDays - 360) * (endDate.difference(startDate).inDays ~/ 360);
  return endDate.difference(startDate).inDays - daysDiscounted;
}

///costs = Lista de costos
///payments = Lista de gastos
///rateAmount = Tasa Nominal o Efectiva
///m = Periodo de tiempo en el que se aplica la tasa
///n = Periodo de tiempo en el que se aplica la capitalizacion según el periodo de tiempo de la tasa
///isNominalRate = Valor para verificar si la tasa es tasa nominal
///amount = Importe Neto inicial
///difDays = Diferencia de días entre la fecha de descuento y la fecha de vencimiento
FactoringResultObject calculateResults(List<CostObject> costs, List<PaymentObject> payments, double rateAmount, double m, double n, bool isNominalRate, double amount, int difDays) {

  double costTotal = calculateCostTotal(costs);

  double paymentTotal = calculatePaymentTotal(payments);

  double effectiveDiaryRate = isNominalRate? calculateNominalRateToEffectiveRate(rateAmount, m, n) : calculateDiaryEffectiveRate(rateAmount, difDays, m);

  double discountRate = calculateDiscountRate(effectiveDiaryRate);

  double discountAmount = calculateDiscountAmount(amount, discountRate);

  double netPresentValue = amount - discountAmount;

  double receivedValue = calculateReceivedValue(netPresentValue, costTotal);

  double givenValue = calculateGivenValue(amount, paymentTotal);

  double effectiveCostsAnnualRate = calculateEffectiveCostsAnnualRate(receivedValue, givenValue, m, difDays);

  return FactoringResultObject(discountRate, discountAmount, givenValue, receivedValue, effectiveCostsAnnualRate, netPresentValue);

}