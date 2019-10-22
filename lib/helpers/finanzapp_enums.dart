import 'package:proyecto_finanzas/helpers/date_constants.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';

abstract class BaseEnum {
  final int _id;
  final String _name;

  const BaseEnum(this._id, this._name);

  int get id => _id;

  String get name => _name;
}


class FinanceDateEnum extends BaseEnum {
  const FinanceDateEnum(int id, String name) : super(id, name);

  static const FinanceDateEnum FINANCE_YEAR       = const FinanceDateEnum(0, MainViewStrings.FINANCE_YEAR);
  static const FinanceDateEnum SIX_MONTH_PERIOD   = const FinanceDateEnum(1, MainViewStrings.SIX_MONTH_PERIOD);
  static const FinanceDateEnum FOUR_MONTH_PERIOD  = const FinanceDateEnum(2, MainViewStrings.FOUR_MONTH_PERIOD);
  static const FinanceDateEnum THREE_MONTH_PERIOD = const FinanceDateEnum(3, MainViewStrings.THREE_MONTH_PERIOD);
  static const FinanceDateEnum TWO_MONTH_PERIOD   = const FinanceDateEnum(4, MainViewStrings.TWO_MONTH_PERIOD);
  static const FinanceDateEnum FINANCE_MONTH      = const FinanceDateEnum(5, MainViewStrings.FINANCE_MONTH);
  static const FinanceDateEnum FIFTEEN_DAY_PERIOD = const FinanceDateEnum(6, MainViewStrings.FIFTEEN_DAY_PERIOD);
  static const FinanceDateEnum FINANCE_DAY        = const FinanceDateEnum(7, MainViewStrings.FINANCE_DAY);

  ///Obtener objeto tipo periodo financiero a parir del id
  static getFinanceDateFromId(double quantity, int financeDateId){
    if (financeDateId == FINANCE_YEAR.id){
      return FinanceYear(value: quantity);
    } else if (financeDateId == SIX_MONTH_PERIOD.id){
      return SixMonthPeriod(value: quantity);
    } else if (financeDateId == FOUR_MONTH_PERIOD.id){
      return FourMonthPeriod(value: quantity);
    } else if (financeDateId == THREE_MONTH_PERIOD.id){
      return ThreeMonthPeriod(value: quantity);
    } else if (financeDateId == TWO_MONTH_PERIOD.id){
      return TwoMonthPeriod(value: quantity);
    } else if (financeDateId == FINANCE_MONTH.id){
      return FinanceMonth(value: quantity);
    } else if (financeDateId == FIFTEEN_DAY_PERIOD.id){
      return FifteenDayPeriod(value: quantity);
    } else if (financeDateId == FINANCE_DAY.id){
      return FinanceDay(value: quantity);
    }
  }
}

class SimpleRateEnum extends BaseEnum {
  const SimpleRateEnum(int id, String name) : super(id, name);

  static const SimpleRateEnum COST = const SimpleRateEnum(0, SimpleRateStrings.COST);
  static const SimpleRateEnum RATE = const SimpleRateEnum(1, SimpleRateStrings.RATE);
  static const SimpleRateEnum STOCK = const SimpleRateEnum(2, SimpleRateStrings.STOCK);
}

enum Rate {NOMINAL_RATE, EFFECTIVE_RATE}

enum Periods {DAY, FIFTEEN_DAY, MONTH, TWO_MONTH, THREE_MONTH, FOUR_MONTH, SIX_MONTH, YEAR}